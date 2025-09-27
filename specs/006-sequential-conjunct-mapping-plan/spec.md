# Sequential Conjunct Mapping Plan

## Problem Statement

The user requires a sequential "two-pointer" algorithm to map conjuncts between the original file (OldCohProp.thy lines 200-995, 796 conjuncts) and the current file (CoherenceProperties.thy lines 286-771, 486 conjuncts) by walking through both files line by line from the beginning.

## User Requirements

### Core Algorithm: Two-Pointer Sequential Mapping
1. **Start from the beginning** of both files (line 200 in original, line 286 in current)
2. **Compare conjuncts** at current positions in both files
3. **If they correspond**: Move both pointers forward (+1 line each)
4. **If they don't correspond**: Move forward based on consolidation pattern
   - If 1 original → 1 current: Move both +1
   - If 2 original → 1 current: Move original +2, current +1
   - If 3 original → 1 current: Move original +3, current +1
   - etc.
5. **Continue until both reach the end**
6. **Report misalignments**: If one side finishes before the other, or if they can't be aligned

### Key Differences from Previous Approach
- **Sequential Processing**: Process files line by line from start to finish
- **No Semantic Matching**: Don't use keyword similarity or semantic analysis
- **Structural Alignment**: Focus on structural correspondence and consolidation patterns
- **Error Detection**: Detect when files become misaligned or one finishes before the other

## Requirements

### Functional Requirements
1. **Sequential Line Processing**: Process both files line by line from beginning to end
2. **Consolidation Detection**: Detect when multiple original lines map to one current line
3. **Alignment Verification**: Verify that both files can be completely aligned
4. **Mismatch Detection**: Detect and report when alignment fails
5. **Complete Coverage**: Ensure all lines in both files are processed

### Non-Functional Requirements
1. **Accuracy**: 100% accurate sequential processing
2. **Completeness**: Process every line in both files
3. **Error Reporting**: Clear reporting of alignment issues
4. **Traceability**: Complete trace of pointer movements

## Success Criteria

### Primary Success Criteria
1. **Complete Sequential Mapping**: All lines processed from start to finish
2. **Alignment Verification**: Both files completely aligned or misalignment clearly identified
3. **Consolidation Documentation**: Clear documentation of consolidation patterns found
4. **Error Detection**: Any misalignments or incomplete processing clearly reported

### Secondary Success Criteria
1. **Pattern Analysis**: Analysis of consolidation patterns discovered during sequential processing
2. **Quality Metrics**: Metrics on alignment quality and consolidation effectiveness
3. **Documentation Integration**: Integration with existing documentation following same format

## Technical Approach

### Two-Pointer Algorithm
```python
def sequential_mapping():
    original_pointer = 200  # Start of original conjuncts
    current_pointer = 286   # Start of current conjuncts
    original_end = 995      # End of original conjuncts
    current_end = 771       # End of current conjuncts
    
    mappings = []
    
    while original_pointer <= original_end and current_pointer <= current_end:
        # Extract conjuncts at current positions
        orig_conjunct = extract_conjunct(original_file, original_pointer)
        curr_conjunct = extract_conjunct(current_file, current_pointer)
        
        # Determine consolidation pattern
        consolidation = detect_consolidation(orig_conjunct, curr_conjunct, original_pointer, current_pointer)
        
        # Create mapping
        mapping = create_mapping(consolidation)
        mappings.append(mapping)
        
        # Move pointers based on consolidation pattern
        original_pointer += consolidation['original_count']
        current_pointer += consolidation['current_count']
    
    # Check for incomplete processing
    if original_pointer <= original_end:
        report_error("Original file not completely processed")
    if current_pointer <= current_end:
        report_error("Current file not completely processed")
    
    return mappings
```

### Consolidation Detection Strategy
1. **Content Analysis**: Analyze conjunct content to detect consolidation patterns
2. **Device Pattern Matching**: Look for hardcoded device patterns in original vs quantified patterns in current
3. **Structural Comparison**: Compare logical structure to determine correspondence
4. **Look-ahead**: Look ahead a few lines to detect multi-line consolidations

### Error Detection
1. **Alignment Failure**: When conjuncts can't be aligned despite look-ahead
2. **Incomplete Processing**: When one file finishes before the other
3. **Pattern Mismatch**: When expected consolidation patterns don't match
4. **Structural Inconsistency**: When logical structure doesn't align

## Implementation Plan

### Phase 1: Sequential Processing Infrastructure
1. **File Readers**: Create readers for both original and current files
2. **Conjunct Extractors**: Extract individual conjuncts from each line
3. **Pointer Management**: Implement two-pointer algorithm infrastructure
4. **Content Normalization**: Normalize conjunct content for comparison

### Phase 2: Consolidation Detection
1. **Pattern Matchers**: Implement pattern matching for consolidation detection
2. **Look-ahead Logic**: Implement look-ahead to detect multi-line consolidations
3. **Correspondence Rules**: Define rules for determining when conjuncts correspond
4. **Consolidation Counting**: Count how many original lines map to each current line

### Phase 3: Sequential Mapping Execution
1. **Main Algorithm**: Implement the two-pointer sequential mapping algorithm
2. **Mapping Creation**: Create detailed mappings for each correspondence
3. **Progress Tracking**: Track pointer movements and mapping progress
4. **Error Detection**: Detect and report alignment issues

### Phase 4: Documentation and Integration
1. **Mapping Documentation**: Document all sequential mappings
2. **Pattern Analysis**: Analyze consolidation patterns found
3. **Error Reporting**: Report any alignment issues or incomplete processing
4. **Integration**: Integrate with existing documentation format

## Arguments
User specified:
- Use "two-pointer" algorithm starting from the beginning of both files
- Move pointers based on correspondence (1→1) or consolidation patterns (2→1, 3→1, etc.)
- Continue until both files are completely processed
- Report if files become misaligned or one finishes before the other
- The previous examples were just illustrations, not actual mappings
- Need actual sequential line-by-line processing from start to finish
