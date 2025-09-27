#!/usr/bin/env python3
"""
Analyze Consolidation Patterns
Analyzes how quantifiers consolidated multiple original conjuncts into single current conjuncts
"""

import json
import re
from typing import List, Dict, Tuple

class ConsolidationPatternAnalyzer:
    def __init__(self):
        self.original_conjuncts = []
        self.current_conjuncts = []
        self.consolidation_patterns = {}
    
    def load_data(self):
        """Load original and current conjunct data"""
        with open('specs/003-line-mapping-analysis-plan/original_conjuncts.json', 'r') as f:
            self.original_conjuncts = json.load(f)
        
        with open('specs/003-line-mapping-analysis-plan/current_conjuncts.json', 'r') as f:
            self.current_conjuncts = json.load(f)
        
        print(f"Loaded {len(self.original_conjuncts)} original conjuncts")
        print(f"Loaded {len(self.current_conjuncts)} current conjuncts")
    
    def analyze_consolidation_patterns(self):
        """Analyze consolidation patterns between original and current versions"""
        patterns = {
            'simple_universal': [],
            'mutual_exclusion': [],
            'length_constraint': [],
            'channel_constraint': [],
            'complex_consolidation': [],
            'no_change': [],
            'new_conjuncts': []
        }
        
        # Analyze original conjuncts for consolidation patterns
        for orig_conjunct in self.original_conjuncts:
            orig_content = orig_conjunct['content']
            orig_type = orig_conjunct['type']
            
            # Look for patterns that could be consolidated
            if orig_type == 'hardcoded_device':
                # Check for simple universal pattern: (A T 0) and (A T 1)
                if re.search(r'\([^)]*\s+0\s*\)', orig_content) and re.search(r'\([^)]*\s+1\s*\)', orig_content):
                    patterns['simple_universal'].append(orig_conjunct)
                
                # Check for mutual exclusion pattern: A T 0 → ¬B T 1
                elif '→' in orig_content and '¬' in orig_content:
                    patterns['mutual_exclusion'].append(orig_conjunct)
                
                # Check for length constraint pattern
                elif 'length' in orig_content.lower():
                    patterns['length_constraint'].append(orig_conjunct)
                
                # Check for channel constraint pattern
                elif any(channel in orig_content.lower() for channel in ['htddatas', 'dthdatas', 'reqresps', 'snps', 'snpresps']):
                    patterns['channel_constraint'].append(orig_conjunct)
                
                else:
                    patterns['complex_consolidation'].append(orig_conjunct)
            
            elif orig_type in ['state_constraint', 'channel_constraint']:
                # These might be consolidated or unchanged
                patterns['no_change'].append(orig_conjunct)
        
        # Analyze current conjuncts for new patterns
        for curr_conjunct in self.current_conjuncts:
            curr_content = curr_conjunct['content']
            curr_type = curr_conjunct['type']
            
            if curr_type == 'universal_quantifier':
                # Check if this is a new universal quantifier
                if '∀' in curr_content or '\\<forall>' in curr_content:
                    # Check if this corresponds to an original conjunct
                    if not self.find_corresponding_original(curr_conjunct):
                        patterns['new_conjuncts'].append(curr_conjunct)
        
        self.consolidation_patterns = patterns
        return patterns
    
    def find_corresponding_original(self, current_conjunct):
        """Find if a current conjunct corresponds to an original conjunct"""
        curr_content = current_conjunct['content']
        
        # Simple keyword matching
        curr_keywords = self.extract_keywords(curr_content)
        
        for orig_conjunct in self.original_conjuncts:
            orig_keywords = self.extract_keywords(orig_conjunct['content'])
            
            # Check for significant keyword overlap
            overlap = len(set(curr_keywords) & set(orig_keywords))
            if overlap >= 3:  # Threshold for correspondence
                return orig_conjunct
        
        return None
    
    def extract_keywords(self, content: str) -> List[str]:
        """Extract keywords from conjunct content"""
        # Remove common words and extract meaningful terms
        content_lower = content.lower()
        
        # Extract function names, state names, etc.
        keywords = re.findall(r'[a-zA-Z_][a-zA-Z0-9_]*', content_lower)
        
        # Filter out common words
        common_words = {'t', 'and', 'or', 'not', 'if', 'then', 'else', 'the', 'a', 'an', 'is', 'are', 'was', 'were', 'i', 'j'}
        keywords = [kw for kw in keywords if kw not in common_words and len(kw) > 2]
        
        return keywords
    
    def calculate_consolidation_metrics(self):
        """Calculate consolidation metrics"""
        metrics = {
            'original_count': len(self.original_conjuncts),
            'current_count': len(self.current_conjuncts),
            'consolidation_ratio': len(self.original_conjuncts) / len(self.current_conjuncts) if self.current_conjuncts else 0,
            'pattern_counts': {},
            'consolidation_factors': {}
        }
        
        # Count patterns
        for pattern_type, conjuncts in self.consolidation_patterns.items():
            metrics['pattern_counts'][pattern_type] = len(conjuncts)
        
        # Calculate consolidation factors
        total_original = len(self.original_conjuncts)
        for pattern_type, conjuncts in self.consolidation_patterns.items():
            if conjuncts:
                metrics['consolidation_factors'][pattern_type] = len(conjuncts) / total_original
        
        return metrics
    
    def generate_consolidation_report(self):
        """Generate comprehensive consolidation analysis report"""
        report = {
            'summary': {
                'original_conjuncts': len(self.original_conjuncts),
                'current_conjuncts': len(self.current_conjuncts),
                'consolidation_ratio': len(self.original_conjuncts) / len(self.current_conjuncts) if self.current_conjuncts else 0,
                'net_change': len(self.current_conjuncts) - len(self.original_conjuncts)
            },
            'consolidation_patterns': self.consolidation_patterns,
            'metrics': self.calculate_consolidation_metrics(),
            'analysis': {
                'key_insights': [],
                'consolidation_effectiveness': {},
                'semantic_preservation': {}
            }
        }
        
        # Add key insights
        if report['summary']['consolidation_ratio'] < 1:
            report['analysis']['key_insights'].append("Current version has more conjuncts than original - suggests more granular parsing")
        elif report['summary']['consolidation_ratio'] > 1:
            report['analysis']['key_insights'].append("Original version has more conjuncts - consolidation occurred")
        else:
            report['analysis']['key_insights'].append("Equal number of conjuncts - no consolidation or 1:1 mapping")
        
        # Analyze pattern effectiveness
        for pattern_type, conjuncts in self.consolidation_patterns.items():
            if conjuncts:
                report['analysis']['consolidation_effectiveness'][pattern_type] = {
                    'count': len(conjuncts),
                    'percentage': (len(conjuncts) / len(self.original_conjuncts)) * 100
                }
        
        return report

def main():
    analyzer = ConsolidationPatternAnalyzer()
    
    print("=== Analyzing Consolidation Patterns ===")
    print()
    
    # Load data
    print("1. Loading conjunct data...")
    analyzer.load_data()
    
    # Analyze patterns
    print("2. Analyzing consolidation patterns...")
    patterns = analyzer.analyze_consolidation_patterns()
    
    print("\n3. Consolidation pattern analysis:")
    for pattern_type, conjuncts in patterns.items():
        print(f"   {pattern_type}: {len(conjuncts)} conjuncts")
    
    # Calculate metrics
    print("\n4. Calculating consolidation metrics...")
    metrics = analyzer.calculate_consolidation_metrics()
    
    print(f"   Original conjuncts: {metrics['original_count']}")
    print(f"   Current conjuncts: {metrics['current_count']}")
    print(f"   Consolidation ratio: {metrics['consolidation_ratio']:.3f}")
    print(f"   Net change: {metrics['current_count'] - metrics['original_count']}")
    
    # Generate report
    print("\n5. Generating consolidation report...")
    report = analyzer.generate_consolidation_report()
    
    # Save report
    with open('specs/003-line-mapping-analysis-plan/consolidation_analysis_report.json', 'w') as f:
        json.dump(report, f, indent=2, default=str)
    
    print(f"   Consolidation report saved to: consolidation_analysis_report.json")
    
    # Show key insights
    print("\n6. Key insights:")
    for insight in report['analysis']['key_insights']:
        print(f"   - {insight}")
    
    print(f"\n7. Consolidation analysis complete!")

if __name__ == "__main__":
    main()
