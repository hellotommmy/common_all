# Data Model: Conjunct Mapping Documentation

## Core Entities

### ConjunctMapping
**Purpose**: Represents line-by-line mapping between original and current conjuncts

**Fields**:
- `original_lines: List[int]` - Line numbers from OldCohProp.thy (200-995)
- `current_line: int` - Line number from CoherenceProperties.thy (286-771)
- `consolidation_type: str` - Type of mapping (1_to_1, 2_to_1, 4_to_1, 6_to_1, no_match)
- `transformation_type: str` - Semantic transformation category
- `confidence_score: float` - Mapping confidence (0.0-1.0)
- `semantic_equivalence: str` - Preservation status (preserved, enhanced, modified)
- `explanation: str` - Human-readable mapping description

**Validation Rules**:
- original_lines must be within range 200-995
- current_line must be within range 286-771
- confidence_score must be between 0.0 and 1.0
- consolidation_type must match pattern: N_to_1 or no_match

### ConsolidationPattern
**Purpose**: Documents N:1 transformation patterns

**Fields**:
- `pattern_type: str` - Pattern identifier (2_to_1, 4_to_1, 6_to_1)
- `count: int` - Number of occurrences
- `examples: List[ConjunctMapping]` - Representative examples
- `semantic_rule: str` - Transformation rule description

### TransformationType
**Purpose**: Classifies semantic transformations

**Fields**:
- `type_name: str` - Transformation identifier
- `description: str` - Semantic meaning
- `pattern_examples: List[str]` - Code pattern examples
- `frequency: int` - Occurrence count

**Categories**:
- `hardcoded_to_quantified`: Direct device reference → quantifier
- `multi_conjunct_consolidation`: Multiple conjuncts → single conjunct
- `enhanced_quantification`: Complex quantifier patterns
- `single_conjunct_transformation`: Individual generalization
- `no_change`: Semantically identical

### MappingAnalysis
**Purpose**: Overall analysis results and statistics

**Fields**:
- `total_original_conjuncts: int` - 796
- `total_current_conjuncts: int` - 486
- `total_mappings: int` - Number of mapping entries
- `coverage_percentage: float` - Mapped original conjuncts percentage
- `consolidation_ratio: float` - Original/current ratio
- `average_confidence: float` - Mean confidence score
- `quality_metrics: Dict` - High/medium/low confidence counts

## Relationships

### ConjunctMapping → ConsolidationPattern
- Many mappings can share the same consolidation pattern
- Pattern analysis aggregates mapping statistics

### ConjunctMapping → TransformationType  
- Each mapping has exactly one transformation type
- Type analysis provides semantic categorization

### MappingAnalysis → All Entities
- Analysis aggregates data from all mapping entities
- Provides summary statistics and quality metrics

## State Transitions

### Mapping Status Flow
```
unmapped → candidate_mapping → validated_mapping → documented_mapping
```

### Confidence Evolution
```
initial_similarity → pattern_matching → semantic_validation → final_confidence
```

## Data Validation

### Completeness Checks
- All 796 original lines must have mapping entries
- No duplicate original line mappings
- All current lines must be referenced

### Quality Assurance
- Confidence scores >0.8 for high-quality mappings
- Semantic equivalence verification for all mappings
- Consolidation pattern consistency checks

### Integration Validation
- Mapping results align with SWMR_modification_progress.py
- Documentation consistency with DETAILED_MODIFICATIONS.md
- Progress tracking synchronization