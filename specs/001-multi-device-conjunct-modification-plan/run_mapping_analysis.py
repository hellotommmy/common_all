#!/usr/bin/env python3
"""
Command-line interface for comprehensive conjunct mapping analysis
Provides flexible CLI for executing mapping analysis with various options
"""

import os
import sys
import argparse
import json
from typing import Optional, Tuple
from pathlib import Path

# Add current directory to path for imports
sys.path.insert(0, os.path.dirname(__file__))

from comprehensive_mapping_analyzer import ComprehensiveMappingAnalyzer, AnalysisConfiguration

def parse_line_range(range_str: str) -> Tuple[int, int]:
    """
    Parse line range string (e.g., "200-995" or "200:995")
    
    Args:
        range_str: Line range string
        
    Returns:
        Tuple of (start_line, end_line)
    """
    if '-' in range_str:
        start, end = range_str.split('-', 1)
    elif ':' in range_str:
        start, end = range_str.split(':', 1)
    else:
        raise ValueError(f"Invalid line range format: {range_str}. Use 'start-end' or 'start:end'")
    
    try:
        start_line = int(start.strip())
        end_line = int(end.strip())
        
        if start_line >= end_line:
            raise ValueError(f"Start line ({start_line}) must be less than end line ({end_line})")
        
        return start_line, end_line
    except ValueError as e:
        raise ValueError(f"Invalid line range: {range_str}. {str(e)}")

def validate_file_path(file_path: str, description: str) -> str:
    """
    Validate that a file path exists and is readable
    
    Args:
        file_path: Path to validate
        description: Description for error messages
        
    Returns:
        Absolute path to the file
    """
    path = Path(file_path)
    
    if not path.exists():
        raise FileNotFoundError(f"{description} file not found: {file_path}")
    
    if not path.is_file():
        raise ValueError(f"{description} path is not a file: {file_path}")
    
    if not os.access(path, os.R_OK):
        raise PermissionError(f"{description} file is not readable: {file_path}")
    
    return str(path.absolute())

def create_output_directory(output_dir: str) -> str:
    """
    Create output directory if it doesn't exist
    
    Args:
        output_dir: Output directory path
        
    Returns:
        Absolute path to the output directory
    """
    path = Path(output_dir)
    path.mkdir(parents=True, exist_ok=True)
    
    if not os.access(path, os.W_OK):
        raise PermissionError(f"Output directory is not writable: {output_dir}")
    
    return str(path.absolute())

def setup_argument_parser() -> argparse.ArgumentParser:
    """Setup command-line argument parser"""
    parser = argparse.ArgumentParser(
        description="Comprehensive Conjunct Mapping Analysis Tool",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Basic analysis with default settings
  python run_mapping_analysis.py
  
  # Custom file paths and line ranges
  python run_mapping_analysis.py \\
    --original betterProofAll/Common/OldCohProp.thy \\
    --current betterProofAll/Common/CoherenceProperties.thy \\
    --original-range 200-995 \\
    --current-range 200-700
  
  # Analysis with custom output directory and validation disabled
  python run_mapping_analysis.py \\
    --output-dir custom_results \\
    --no-validation
  
  # Dry run to validate configuration without executing analysis
  python run_mapping_analysis.py --dry-run
        """
    )
    
    # File paths
    parser.add_argument(
        '--original', '-o',
        default='betterProofAll/Common/OldCohProp.thy',
        help='Path to original theory file (default: betterProofAll/Common/OldCohProp.thy)'
    )
    
    parser.add_argument(
        '--current', '-c',
        default='betterProofAll/Common/CoherenceProperties.thy',
        help='Path to current theory file (default: betterProofAll/Common/CoherenceProperties.thy)'
    )
    
    # Line ranges
    parser.add_argument(
        '--original-range',
        default='200-995',
        help='Line range for original file (default: 200-995)'
    )
    
    parser.add_argument(
        '--current-range',
        default='200-700',
        help='Line range for current file (default: 200-700)'
    )
    
    # Output configuration
    parser.add_argument(
        '--output-dir', '-d',
        default='mapping_analysis_results',
        help='Output directory for analysis results (default: mapping_analysis_results)'
    )
    
    # Analysis options
    parser.add_argument(
        '--no-validation',
        action='store_true',
        help='Disable validation and quality assurance'
    )
    
    parser.add_argument(
        '--no-documentation-update',
        action='store_true',
        help='Disable documentation file updates'
    )
    
    parser.add_argument(
        '--confidence-threshold',
        type=float,
        default=0.5,
        help='Minimum confidence threshold for mappings (default: 0.5)'
    )
    
    parser.add_argument(
        '--max-consolidation-ratio',
        type=int,
        default=5,
        help='Maximum consolidation ratio (N:1) to allow (default: 5)'
    )
    
    # Execution options
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Validate configuration and show analysis plan without executing'
    )
    
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )
    
    parser.add_argument(
        '--quiet', '-q',
        action='store_true',
        help='Suppress non-essential output'
    )
    
    # Configuration file
    parser.add_argument(
        '--config',
        help='Load configuration from JSON file'
    )
    
    parser.add_argument(
        '--save-config',
        help='Save current configuration to JSON file and exit'
    )
    
    return parser

def load_configuration_from_file(config_path: str) -> dict:
    """Load configuration from JSON file"""
    try:
        with open(config_path, 'r', encoding='utf-8') as f:
            config_data = json.load(f)
        
        print(f"✅ Configuration loaded from: {config_path}")
        return config_data
    
    except FileNotFoundError:
        raise FileNotFoundError(f"Configuration file not found: {config_path}")
    except json.JSONDecodeError as e:
        raise ValueError(f"Invalid JSON in configuration file: {config_path}. Error: {e}")

def save_configuration_to_file(config: AnalysisConfiguration, config_path: str):
    """Save configuration to JSON file"""
    config_data = {
        'original_file_path': config.original_file_path,
        'current_file_path': config.current_file_path,
        'original_line_range': config.original_line_range,
        'current_line_range': config.current_line_range,
        'output_directory': config.output_directory,
        'enable_validation': config.enable_validation,
        'enable_documentation_update': config.enable_documentation_update,
        'confidence_threshold': config.confidence_threshold,
        'max_consolidation_ratio': config.max_consolidation_ratio
    }
    
    try:
        with open(config_path, 'w', encoding='utf-8') as f:
            json.dump(config_data, f, indent=2)
        
        print(f"✅ Configuration saved to: {config_path}")
    
    except Exception as e:
        raise RuntimeError(f"Failed to save configuration: {e}")

def create_configuration_from_args(args) -> AnalysisConfiguration:
    """Create analysis configuration from command-line arguments"""
    # Load base configuration from file if specified
    if args.config:
        config_data = load_configuration_from_file(args.config)
        
        # Override with command-line arguments
        original_file_path = args.original or config_data.get('original_file_path', 'betterProofAll/Common/OldCohProp.thy')
        current_file_path = args.current or config_data.get('current_file_path', 'betterProofAll/Common/CoherenceProperties.thy')
        original_range = parse_line_range(args.original_range or f"{config_data.get('original_line_range', [200, 995])[0]}-{config_data.get('original_line_range', [200, 995])[1]}")
        current_range = parse_line_range(args.current_range or f"{config_data.get('current_line_range', [200, 700])[0]}-{config_data.get('current_line_range', [200, 700])[1]}")
        output_directory = args.output_dir or config_data.get('output_directory', 'mapping_analysis_results')
        enable_validation = not args.no_validation and config_data.get('enable_validation', True)
        enable_documentation_update = not args.no_documentation_update and config_data.get('enable_documentation_update', True)
        confidence_threshold = args.confidence_threshold or config_data.get('confidence_threshold', 0.5)
        max_consolidation_ratio = args.max_consolidation_ratio or config_data.get('max_consolidation_ratio', 5)
    else:
        # Create configuration from command-line arguments only
        original_file_path = args.original
        current_file_path = args.current
        original_range = parse_line_range(args.original_range)
        current_range = parse_line_range(args.current_range)
        output_directory = args.output_dir
        enable_validation = not args.no_validation
        enable_documentation_update = not args.no_documentation_update
        confidence_threshold = args.confidence_threshold
        max_consolidation_ratio = args.max_consolidation_ratio
    
    # Validate file paths
    original_file_path = validate_file_path(original_file_path, "Original theory")
    current_file_path = validate_file_path(current_file_path, "Current theory")
    
    # Create output directory
    output_directory = create_output_directory(output_directory)
    
    return AnalysisConfiguration(
        original_file_path=original_file_path,
        current_file_path=current_file_path,
        original_line_range=original_range,
        current_line_range=current_range,
        output_directory=output_directory,
        enable_validation=enable_validation,
        enable_documentation_update=enable_documentation_update,
        confidence_threshold=confidence_threshold,
        max_consolidation_ratio=max_consolidation_ratio
    )

def print_analysis_plan(config: AnalysisConfiguration, verbose: bool = False):
    """Print analysis execution plan"""
    print("📋 Analysis Execution Plan")
    print("=" * 50)
    print(f"📁 Original file: {config.original_file_path}")
    print(f"📁 Current file: {config.current_file_path}")
    print(f"📊 Original range: lines {config.original_line_range[0]}-{config.original_line_range[1]} ({config.original_line_range[1] - config.original_line_range[0] + 1} lines)")
    print(f"📊 Current range: lines {config.current_line_range[0]}-{config.current_line_range[1]} ({config.current_line_range[1] - config.current_line_range[0] + 1} lines)")
    print(f"📂 Output directory: {config.output_directory}")
    print(f"✅ Validation enabled: {config.enable_validation}")
    print(f"📝 Documentation update enabled: {config.enable_documentation_update}")
    print(f"🎯 Confidence threshold: {config.confidence_threshold}")
    print(f"🔗 Max consolidation ratio: {config.max_consolidation_ratio}:1")
    
    if verbose:
        print("\n🔄 Analysis Phases:")
        print("  1. Extract conjuncts from both files")
        print("  2. Perform sequential two-pointer mapping")
        print("  3. Analyze consolidation patterns and transformations")
        if config.enable_validation:
            print("  4. Validate mappings and calculate quality metrics")
        if config.enable_documentation_update:
            print("  5. Update documentation files")
        print("  6. Generate analysis outputs and reports")

def main():
    """Main entry point for CLI"""
    parser = setup_argument_parser()
    args = parser.parse_args()
    
    # Handle quiet/verbose flags
    if args.quiet and args.verbose:
        print("❌ Error: Cannot use both --quiet and --verbose flags")
        return 1
    
    try:
        # Create configuration
        config = create_configuration_from_args(args)
        
        # Handle save-config option
        if args.save_config:
            save_configuration_to_file(config, args.save_config)
            return 0
        
        # Print header (unless quiet)
        if not args.quiet:
            print("🔍 Comprehensive Conjunct Mapping Analysis")
            print("=" * 50)
        
        # Print analysis plan
        if args.dry_run or args.verbose:
            print_analysis_plan(config, args.verbose)
        
        # Exit if dry run
        if args.dry_run:
            print("\n✅ Configuration validated successfully")
            print("🚀 Run without --dry-run to execute analysis")
            return 0
        
        # Initialize and run analyzer
        analyzer = ComprehensiveMappingAnalyzer(config)
        results = analyzer.run_comprehensive_analysis()
        
        if results.success:
            if not args.quiet:
                print(f"\n🎉 Analysis completed successfully!")
                print(f"📊 Results available in: {config.output_directory}")
                print(f"⏱️  Execution time: {results.execution_time:.2f} seconds")
                
                if results.quality_metrics:
                    print(f"📈 Overall quality score: {results.quality_metrics.get('overall_quality', 0):.3f}")
            
            return 0
        else:
            print(f"\n❌ Analysis failed!")
            if not args.quiet:
                print(f"Error: {results.error_message}")
            return 1
    
    except KeyboardInterrupt:
        print("\n⚠️  Analysis interrupted by user")
        return 130
    
    except Exception as e:
        print(f"\n❌ Error: {str(e)}")
        if args.verbose:
            import traceback
            print(traceback.format_exc())
        return 1

if __name__ == "__main__":
    sys.exit(main())
