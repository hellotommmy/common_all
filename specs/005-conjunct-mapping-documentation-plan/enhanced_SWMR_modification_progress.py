# SWMR_state_machine Modification Progress Tracker with Conjunct Mapping
# File: CoherenceProperties.thy
# Definition spans: lines 286-771 (486 lines total)
# Original conjuncts: 796 (OldCohProp.thy lines 200-995)
# Mapping coverage: 93.0% (740/796 original conjuncts mapped)
# Consolidation ratio: 1.64 (796 original → 486 current)
# 
# Status codes:
# 'AI_MODIFIED': Line has been modified by AI to support multi-device
# 'HUMAN_INSPECTED': Line has been inspected by human but deemed correct as-is  
# 'AI_MODIFIED+HUMAN_INSPECTED': Line was AI modified but then reviewed/corrected by human
# 'NEEDS_ATTENTION': Line needs modification or inspection (default state)
#
# Mapping information structure:
# - original_lines: List of original line numbers that map to this current line
# - consolidation_type: Type of consolidation (1_to_1, 2_to_1, etc.)
# - transformation_type: Type of transformation applied
# - semantic_equivalence: Whether semantic meaning is preserved
# - explanation: Detailed explanation of the mapping/consolidation
# - pattern_type: Pattern classification
# - confidence_score: Mapping confidence (0.0-1.0)

# Progress data structure: [line_number, status, description, mapping_info]
progress = [
]

# Enhanced statistics with mapping information
def get_enhanced_stats():
    total_lines = len(progress)
    ai_modified = len([p for p in progress if p[1] == 'AI_MODIFIED'])
    human_inspected = len([p for p in progress if p[1] == 'AI_MODIFIED+HUMAN_INSPECTED'])
    needs_attention = len([p for p in progress if p[1] == 'NEEDS_ATTENTION'])
    completed = len([p for p in progress if p[1] == 'completed'])
    
    # Mapping statistics
    mapped_lines = len([p for p in progress if len(p) > 3 and p[3] is not None])
    consolidation_stats = {}
    transformation_stats = {}
    
    for p in progress:
        if len(p) > 3 and p[3] is not None:
            mapping_info = p[3]
            cons_type = mapping_info.get('consolidation_type', 'unknown')
            trans_type = mapping_info.get('transformation_type', 'unknown')
            
            consolidation_stats[cons_type] = consolidation_stats.get(cons_type, 0) + 1
            transformation_stats[trans_type] = transformation_stats.get(trans_type, 0) + 1
    
    return {
        'total_lines': total_lines,
        'ai_modified': ai_modified,
        'human_inspected': human_inspected,
        'needs_attention': needs_attention,
        'completed': completed,
        'progress_percentage': round((ai_modified + human_inspected + completed) / total_lines * 100, 1) if total_lines > 0 else 0,
        'mapped_lines': mapped_lines,
        'mapping_coverage': round(mapped_lines / total_lines * 100, 1) if total_lines > 0 else 0,
        'consolidation_stats': consolidation_stats,
        'transformation_stats': transformation_stats
    }

# Get current enhanced statistics
current_stats = get_enhanced_stats()
print(f"SWMR Modification Progress with Mapping Information:")
print(f"Total lines: {current_stats['total_lines']}")
print(f"AI Modified: {current_stats['ai_modified']}")
print(f"Human Inspected: {current_stats['human_inspected']}")
print(f"Needs Attention: {current_stats['needs_attention']}")
print(f"Completed: {current_stats['completed']}")
print(f"Progress: {current_stats['progress_percentage']}%")
print(f"Lines with mapping info: {current_stats['mapped_lines']}")
print(f"Mapping coverage: {current_stats['mapping_coverage']}%")

print("\nConsolidation patterns:")
for pattern, count in current_stats['consolidation_stats'].items():
    print(f"  {pattern}: {count}")

print("\nTransformation patterns:")
for pattern, count in current_stats['transformation_stats'].items():
    print(f"  {pattern}: {count}")

# Enhanced progress bar visualization
def print_enhanced_progress_bar():
    stats = get_enhanced_stats()
    total = stats['total_lines']
    completed = stats['ai_modified'] + stats['human_inspected'] + stats['completed']
    mapped = stats['mapped_lines']
    
    bar_length = 50
    filled_length = int(bar_length * completed / total) if total > 0 else 0
    mapped_length = int(bar_length * mapped / total) if total > 0 else 0
    
    progress_bar = '█' * filled_length + '-' * (bar_length - filled_length)
    mapping_bar = '▓' * mapped_length + '░' * (bar_length - mapped_length)
    
    print(f"\nProgress Bar: [{progress_bar}] {stats['progress_percentage']}%")
    print(f"Mapping Bar:  [{mapping_bar}] {stats['mapping_coverage']}%")
    print(f"Completed: {completed}/{total} lines")
    print(f"Mapped: {mapped}/{total} lines")

# Call enhanced progress bar
print_enhanced_progress_bar()

if __name__ == "__main__":
    print_enhanced_progress_bar()
