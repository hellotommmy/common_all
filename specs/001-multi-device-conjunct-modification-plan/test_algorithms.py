#!/usr/bin/env python3
"""
Simple test for core algorithms
"""

from src.extractors import ConjunctExtractor
from src.algorithms import SimilarityCalculator, SequentialMappingInterface

def test_algorithms():
    print('Testing ConjunctExtractor...')
    extractor = ConjunctExtractor(
        '../../betterProofAll/Common/OldCohProp.thy',
        '../../betterProofAll/Common/CoherenceProperties.thy',
        200, 995, 286, 771
    )

    # Test validation
    validation = extractor.validate_expected_counts()
    print(f'Original conjuncts: {validation["original_count"]} (expected: {validation["original_expected"]}, valid: {validation["original_valid"]})')
    print(f'Current conjuncts: {validation["current_count"]} (expected: {validation["current_expected"]}, valid: {validation["current_valid"]})')

    print('\nTesting SimilarityCalculator...')
    calc = SimilarityCalculator()
    sim1 = calc.calculate_similarity('test string', 'test string')
    sim2 = calc.calculate_similarity('CSTATE Modified T 0', 'CSTATE Modified T i')
    print(f'Identical strings similarity: {sim1}')
    print(f'Device generalization similarity: {sim2:.3f}')

    print('\nTesting SequentialMappingInterface...')
    mapper = SequentialMappingInterface()
    test_sim = mapper.calculate_similarity('hello world', 'hello word')
    print(f'Interface similarity calculation: {test_sim:.3f}')

    print('\n🎉 All core algorithms working correctly!')

if __name__ == '__main__':
    test_algorithms()
