# Sequential Conjunct Mapping Tasks

## Task Overview
Implement a two-pointer algorithm to sequentially map conjuncts from original file (OldCohProp.thy lines 200-995) to current file (CoherenceProperties.thy lines 286-771) by processing line by line from beginning to end.

## Phase 1: Sequential Processing Infrastructure

### T001: Create File Readers and Conjunct Extractors
**Priority**: Critical
**Dependencies**: None
**Description**: Create infrastructure to read and extract conjuncts from both files sequentially.

**Subtasks**:
- [ ] Create reader for OldCohProp.thy starting at line 200
- [ ] Create reader for CoherenceProperties.thy starting at line 286
- [ ] Implement conjunct extraction from individual lines
- [ ] Handle line cleaning and normalization
- [ ] Create conjunct data structures

**Deliverables**:
- File reading infrastructure
- Conjunct extraction functions
- Line normalization utilities
- Data structure definitions

### T002: Implement Two-Pointer Algorithm Infrastructure
**Priority**: Critical
**Dependencies**: T001
**Description**: Implement the core two-pointer algorithm infrastructure.

**Algorithm Structure**:
```python
class SequentialMapper:
    def __init__(self):
        self.original_pointer = 200  # Start of original
        self.current_pointer = 286   # Start of current
        self.original_end = 995      # End of original
        self.current_end = 771       # End of current
        self.mappings = []
        self.errors = []
    
    def sequential_map(self):
        while not self.is_complete():
            mapping = self.process_current_position()
            self.advance_pointers(mapping)
        
        self.check_completion()
```

**Subtasks**:
- [ ] Implement pointer management
- [ ] Create main sequential processing loop
- [ ] Implement completion checking
- [ ] Create error detection and reporting
- [ ] Add progress tracking

**Deliverables**:
- Two-pointer algorithm framework
- Pointer management system
- Progress tracking utilities
- Error detection system

### T003: Create Content Analysis and Normalization
**Priority**: High
**Dependencies**: T001
**Description**: Create content analysis tools to compare conjuncts and detect patterns.

**Content Analysis Features**:
- [ ] Remove device-specific numbers (0, 1) for comparison
- [ ] Normalize whitespace and formatting
- [ ] Extract logical structure patterns
- [ ] Identify hardcoded vs quantified patterns
- [ ] Create content signatures for comparison

**Deliverables**:
- Content normalization functions
- Pattern extraction utilities
- Comparison algorithms
- Signature generation system

## Phase 2: Consolidation Detection

### T004: Implement Consolidation Pattern Detection
**Priority**: Critical
**Dependencies**: T002, T003
**Description**: Detect when multiple original conjuncts consolidate into single current conjuncts.

**Detection Patterns**:
- [ ] **1→1 Correspondence**: Single original maps to single current
- [ ] **2→1 Consolidation**: Two original (e.g., device 0, device 1) map to one current (quantified)
- [ ] **3→1 Consolidation**: Three original map to one current
- [ ] **N→1 Consolidation**: Multiple original map to one current

**Detection Algorithm**:
```python
def detect_consolidation(orig_line, curr_line, orig_pointer, curr_pointer):
    # Check if current line corresponds to original line
    if direct_correspondence(orig_line, curr_line):
        return {'type': '1_to_1', 'original_count': 1, 'current_count': 1}
    
    # Look ahead for consolidation patterns
    for look_ahead in range(2, 6):  # Check up to 5 original lines
        orig_group = get_original_lines(orig_pointer, look_ahead)
        if consolidation_match(orig_group, curr_line):
            return {'type': f'{look_ahead}_to_1', 'original_count': look_ahead, 'current_count': 1}
    
    # No match found
    return {'type': 'no_match', 'original_count': 1, 'current_count': 1}
```

**Subtasks**:
- [ ] Implement direct correspondence detection
- [ ] Implement look-ahead consolidation detection
- [ ] Create consolidation pattern matching
- [ ] Add confidence scoring
- [ ] Handle edge cases and errors

**Deliverables**:
- Consolidation detection algorithm
- Pattern matching functions
- Look-ahead logic
- Confidence scoring system

### T005: Create Correspondence Rules
**Priority**: High
**Dependencies**: T004
**Description**: Define rules for determining when conjuncts correspond.

**Correspondence Rules**:
- [ ] **Exact Match**: Identical content after normalization
- [ ] **Device Substitution**: Original with hardcoded devices matches current with quantifiers
- [ ] **Structural Match**: Same logical structure with different quantification
- [ ] **Semantic Equivalence**: Semantically equivalent but syntactically different

**Rule Implementation**:
```python
def direct_correspondence(orig_conjunct, curr_conjunct):
    # Rule 1: Exact match after normalization
    if normalize(orig_conjunct) == normalize(curr_conjunct):
        return True
    
    # Rule 2: Device substitution pattern
    if device_substitution_match(orig_conjunct, curr_conjunct):
        return True
    
    # Rule 3: Structural equivalence
    if structural_match(orig_conjunct, curr_conjunct):
        return True
    
    return False
```

**Subtasks**:
- [ ] Define exact match rules
- [ ] Implement device substitution detection
- [ ] Create structural matching algorithm
- [ ] Add semantic equivalence checking
- [ ] Create rule priority system

**Deliverables**:
- Correspondence rule system
- Rule implementation functions
- Priority and confidence system
- Rule validation utilities

## Phase 3: Sequential Mapping Execution

### T006: Implement Main Sequential Mapping Algorithm
**Priority**: Critical
**Dependencies**: T005
**Description**: Implement the main two-pointer sequential mapping algorithm.

**Main Algorithm**:
```python
def execute_sequential_mapping(self):
    while self.original_pointer <= self.original_end and self.current_pointer <= self.current_end:
        # Extract current conjuncts
        orig_conjunct = self.extract_original_conjunct(self.original_pointer)
        curr_conjunct = self.extract_current_conjunct(self.current_pointer)
        
        # Detect consolidation pattern
        consolidation = self.detect_consolidation(orig_conjunct, curr_conjunct)
        
        # Create mapping
        mapping = self.create_mapping(consolidation, orig_conjunct, curr_conjunct)
        self.mappings.append(mapping)
        
        # Advance pointers
        self.original_pointer += consolidation['original_count']
        self.current_pointer += consolidation['current_count']
        
        # Progress reporting
        self.report_progress()
    
    # Check for incomplete processing
    self.check_completion()
```

**Subtasks**:
- [ ] Implement main processing loop
- [ ] Create mapping data structures
- [ ] Add pointer advancement logic
- [ ] Implement progress reporting
- [ ] Add error handling and recovery

**Deliverables**:
- Main sequential mapping algorithm
- Mapping data structures
- Progress reporting system
- Error handling framework

### T007: Create Detailed Mapping Documentation
**Priority**: High
**Dependencies**: T006
**Description**: Create detailed documentation for each mapping discovered.

**Mapping Documentation Structure**:
```python
mapping = {
    'original_lines': [200, 201],           # Lines from original file
    'current_line': 286,                    # Line from current file
    'consolidation_type': '2_to_1',         # Type of consolidation
    'original_content': ['conjunct1', 'conjunct2'],  # Original conjunct content
    'current_content': 'quantified_conjunct',        # Current conjunct content
    'correspondence_rule': 'device_substitution',    # Rule used for matching
    'confidence_score': 0.95,               # Confidence in mapping
    'explanation': 'Two device-specific conjuncts consolidated into quantified form',
    'pointer_movement': {'original': 2, 'current': 1}  # How pointers moved
}
```

**Subtasks**:
- [ ] Design mapping data structure
- [ ] Implement mapping creation
- [ ] Add detailed explanations
- [ ] Create confidence assessment
- [ ] Generate human-readable descriptions

**Deliverables**:
- Mapping documentation system
- Detailed mapping records
- Explanation generation
- Confidence assessment utilities

### T008: Implement Error Detection and Reporting
**Priority**: Critical
**Dependencies**: T006
**Description**: Detect and report alignment errors and incomplete processing.

**Error Types**:
- [ ] **Alignment Failure**: When conjuncts can't be aligned
- [ ] **Incomplete Original**: Original file not completely processed
- [ ] **Incomplete Current**: Current file not completely processed
- [ ] **Pattern Mismatch**: Expected patterns don't match
- [ ] **Pointer Overflow**: Pointers exceed file boundaries

**Error Reporting**:
```python
def check_completion(self):
    errors = []
    
    if self.original_pointer <= self.original_end:
        remaining = self.original_end - self.original_pointer + 1
        errors.append(f"Original file incomplete: {remaining} lines remaining (lines {self.original_pointer}-{self.original_end})")
    
    if self.current_pointer <= self.current_end:
        remaining = self.current_end - self.current_pointer + 1
        errors.append(f"Current file incomplete: {remaining} lines remaining (lines {self.current_pointer}-{self.current_end})")
    
    if errors:
        self.report_errors(errors)
    else:
        self.report_success()
```

**Subtasks**:
- [ ] Implement completion checking
- [ ] Create error classification system
- [ ] Add detailed error reporting
- [ ] Implement recovery strategies
- [ ] Create error summary reports

**Deliverables**:
- Error detection system
- Error classification framework
- Detailed error reporting
- Recovery strategy implementation

## Phase 4: Analysis and Integration

### T009: Analyze Sequential Mapping Results
**Priority**: High
**Dependencies**: T008
**Description**: Analyze the results of sequential mapping to understand consolidation patterns.

**Analysis Components**:
- [ ] **Consolidation Statistics**: Count of each consolidation type (1→1, 2→1, etc.)
- [ ] **Pattern Analysis**: Analysis of common consolidation patterns
- [ ] **Coverage Analysis**: Percentage of lines successfully mapped
- [ ] **Quality Metrics**: Confidence scores and mapping quality
- [ ] **Error Analysis**: Analysis of any alignment issues

**Subtasks**:
- [ ] Calculate consolidation statistics
- [ ] Analyze pattern distributions
- [ ] Compute coverage metrics
- [ ] Assess mapping quality
- [ ] Analyze error patterns

**Deliverables**:
- Consolidation statistics report
- Pattern analysis documentation
- Coverage and quality metrics
- Error analysis report

### T010: Generate Integration Documentation
**Priority**: Medium
**Dependencies**: T009
**Description**: Generate documentation compatible with existing SWMR_modification_progress.py and DETAILED_MODIFICATIONS.md format.

**Integration Format**:
```python
# Enhanced progress entry with sequential mapping info
progress_entry = [
    current_line,
    status,
    description,
    {
        'sequential_mapping': {
            'original_lines': [200, 201],
            'consolidation_type': '2_to_1',
            'pointer_position': {'original': 202, 'current': 287},
            'correspondence_rule': 'device_substitution',
            'confidence_score': 0.95
        }
    }
]
```

**Subtasks**:
- [ ] Create integration format specification
- [ ] Generate enhanced progress file
- [ ] Create detailed modifications section
- [ ] Add sequential mapping documentation
- [ ] Verify format compatibility

**Deliverables**:
- Enhanced SWMR_modification_progress.py
- Sequential mapping section for DETAILED_MODIFICATIONS.md
- Integration documentation
- Format compatibility verification

### T011: Final Validation and Quality Assurance
**Priority**: Critical
**Dependencies**: T010
**Description**: Perform final validation of sequential mapping results.

**Validation Checklist**:
- [ ] Verify all original lines processed (200-995)
- [ ] Verify all current lines processed (286-771)
- [ ] Check mapping completeness and accuracy
- [ ] Validate consolidation pattern detection
- [ ] Verify error detection and reporting
- [ ] Test edge cases and boundary conditions

**Subtasks**:
- [ ] Implement validation test suite
- [ ] Run comprehensive validation tests
- [ ] Verify boundary condition handling
- [ ] Test error detection accuracy
- [ ] Validate integration compatibility

**Deliverables**:
- Validation test suite
- Validation results report
- Quality assurance documentation
- Final mapping verification

## Success Criteria

### Primary Success Criteria
1. **Complete Sequential Processing**: All lines from both files processed from start to finish
2. **Accurate Consolidation Detection**: Correct identification of consolidation patterns (1→1, 2→1, etc.)
3. **Error Detection**: Clear reporting of any alignment issues or incomplete processing
4. **Documentation Integration**: Results integrated with existing documentation format

### Secondary Success Criteria
1. **High Mapping Quality**: High confidence scores for mappings
2. **Pattern Analysis**: Comprehensive analysis of consolidation patterns
3. **Error Recovery**: Robust handling of alignment issues
4. **Usability**: Clear, understandable mapping documentation

## Timeline Estimate

- **Phase 1 (Infrastructure)**: 4-6 hours
- **Phase 2 (Detection)**: 6-8 hours
- **Phase 3 (Execution)**: 4-6 hours
- **Phase 4 (Analysis)**: 3-4 hours

**Total Estimated Time**: 17-24 hours

## Dependencies

### External Dependencies
- Access to OldCohProp.thy and CoherenceProperties.thy
- Existing SWMR_modification_progress.py format
- DETAILED_MODIFICATIONS.md format

### Internal Dependencies
- Infrastructure before detection algorithms
- Detection before execution
- Execution before analysis
- Analysis before integration
