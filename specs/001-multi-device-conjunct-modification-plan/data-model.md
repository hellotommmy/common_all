# Data Model: Multi-Device Conjunct Modification

## Entities

### Conjunct Entity
**Name**: Conjunct  
**Description**: Individual constraint in SWMR_state_machine definition  
**Fields**:
- `line_number`: nat - Line number in CoherenceProperties.thy
- `complexity_level`: enum - Simple, Medium, Complex, Critical
- `pattern_type`: enum - Universal, MutualExclusion, Existential, Global
- `original_content`: string - Original 2-device constraint
- `modified_content`: string - Multi-device constraint
- `semantic_analysis`: string - Explanation of semantic preservation
- `modification_status`: enum - Pending, InProgress, Completed, NeedsReview
- `dependencies`: list[line_number] - Other conjuncts this depends on
- `parallelization_group`: nat - Group for parallel modification

### Modification Batch Entity
**Name**: ModificationBatch  
**Description**: Group of conjuncts modified together  
**Fields**:
- `batch_id`: nat - Sequential batch identifier
- `start_line`: nat - First line in batch
- `end_line`: nat - Last line in batch
- `conjunct_count`: nat - Number of conjuncts in batch
- `complexity_level`: enum - Dominant complexity level
- `parallelization_potential`: enum - High, Medium, Low, VeryLow
- `estimated_risk`: enum - Low, Medium, High, Critical
- `status`: enum - Pending, InProgress, Completed, NeedsReview

### Progress Tracking Entity
**Name**: ProgressTracking  
**Description**: Overall modification progress  
**Fields**:
- `total_conjuncts`: nat - Total number of conjuncts (432)
- `modified_conjuncts`: nat - Number completed (340)
- `remaining_conjuncts`: nat - Number remaining (92)
- `completion_percentage`: real - Progress percentage (44.0%)
- `current_batch`: nat - Currently active batch
- `last_modified`: timestamp - Last modification time

## Relationships

### Conjunct Dependencies
- **Type**: Many-to-Many
- **Description**: Conjuncts that depend on other conjuncts
- **Constraints**: 
  - No circular dependencies
  - Dependencies must be in lower line numbers
  - Critical conjuncts may depend on multiple others

### Batch Composition
- **Type**: One-to-Many (Batch to Conjuncts)
- **Description**: Batches contain multiple conjuncts
- **Constraints**:
  - Conjuncts in same batch can be modified in parallel
  - Batch complexity determined by highest complexity conjunct
  - Batch risk determined by highest risk conjunct

### Progress Tracking
- **Type**: One-to-One (Overall to Batches)
- **Description**: Overall progress tracks batch completion
- **Constraints**:
  - Progress percentage = (completed_conjuncts / total_conjuncts) * 100
  - Batches must be completed in order
  - All conjuncts in batch must be completed before batch is marked complete

## State Transitions

### Conjunct Modification States
```
Pending → InProgress → Completed
   ↓           ↓
NeedsReview ←────┘
```

**Transitions**:
- `Pending → InProgress`: Modification started
- `InProgress → Completed`: Modification finished and verified
- `InProgress → NeedsReview`: Complex modification requires review
- `NeedsReview → InProgress`: Review feedback incorporated
- `NeedsReview → Completed`: Review approved

### Batch Processing States
```
Pending → InProgress → Completed
   ↓           ↓
NeedsReview ←────┘
```

**Transitions**:
- `Pending → InProgress`: Batch processing started
- `InProgress → Completed`: All conjuncts in batch completed
- `InProgress → NeedsReview`: Batch requires review
- `NeedsReview → InProgress`: Review feedback incorporated
- `NeedsReview → Completed`: Review approved

## Validation Rules

### Conjunct Validation
1. **Line Number**: Must be unique, between 561-1056
2. **Content**: Original and modified content must be non-empty
3. **Semantic Analysis**: Must explain how semantics are preserved
4. **Dependencies**: Must not create circular dependencies
5. **Pattern Type**: Must match established quantifier patterns

### Batch Validation
1. **Line Range**: Start line must be ≤ end line
2. **Conjunct Count**: Must match actual conjuncts in range
3. **Complexity**: Must be consistent with conjunct complexities
4. **Parallelization**: Must be feasible for conjunct types
5. **Risk Assessment**: Must match highest risk conjunct

### Progress Validation
1. **Totals**: modified + remaining = total
2. **Percentage**: Must be between 0-100
3. **Consistency**: Must match actual file state
4. **Timestamps**: Must be chronological
5. **Completeness**: All required fields must be present

## Data Integrity Constraints

### Referential Integrity
- Conjunct dependencies must reference valid line numbers
- Batch references must be to existing batches
- Progress tracking must reference valid entities

### Semantic Integrity
- Modified content must preserve original semantics
- Quantifier patterns must be consistent
- Cross-device constraints must be properly generalized

### Temporal Integrity
- Modifications must be chronological
- Progress updates must be sequential
- Dependencies must be resolved before dependent conjuncts

## Performance Considerations

### Parallelization
- Simple conjuncts can be modified in parallel
- Complex conjuncts require sequential processing
- Batch size optimized for parallelization potential

### Memory Usage
- Conjunct entities are lightweight
- Semantic analysis stored as text
- Progress tracking cached for performance

### Query Optimization
- Line number indexed for fast lookup
- Complexity level indexed for filtering
- Status indexed for progress tracking

## Integration Points

### File System Integration
- Conjuncts map to lines in CoherenceProperties.thy
- Progress tracking maps to SWMR_modification_progress.py
- Documentation maps to PROGRESS_REPORT.md

### Git Integration
- Each batch modification creates a commit
- Progress tracking preserved across commits
- Rollback capability for failed modifications

### User Interface Integration
- Progress visualization from progress tracking
- Batch status from modification batches
- Detailed analysis from conjunct entities
