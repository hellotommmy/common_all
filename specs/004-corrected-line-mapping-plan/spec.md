# Corrected Line Mapping Analysis Plan

## Problem Statement

The previous analysis incorrectly counted conjuncts due to faulty parsing logic. The user has identified that:

1. **OldCohProp.thy lines 200-995**: Each line contains exactly one conjunct
2. **Total Original Conjuncts**: 796 (not 595 as incorrectly calculated)
3. **Parsing Error**: My script was splitting by `∧` instead of recognizing line-by-line structure

## Root Cause Analysis

### My Parsing Error:
1. **Incorrect Splitting**: Split lines by `∧` and treated each split as a conjunct
2. **Missing Structure Recognition**: Didn't recognize that each line = one conjunct
3. **Double Counting**: Counted conjuncts within lines instead of counting lines
4. **Wrong Assumption**: Assumed conjuncts spanned multiple lines

### Correct Structure:
- **Line 200**: `"SWMR_state_machine T = ( (SWMR T) ∧` (start of definition)
- **Lines 201-994**: Each line contains one conjunct ending with `∧`
- **Line 995**: Last conjunct ending with `)` (end of definition)
- **Total**: 796 conjuncts (995 - 200 + 1 = 796)

## Requirements

### Functional Requirements
1. **Correct Conjunct Counting**: Count exactly 796 original conjuncts (lines 200-995)
2. **Line-by-Line Mapping**: Map each line to corresponding current conjunct
3. **Accurate Consolidation Analysis**: Analyze how 796 original conjuncts map to current version
4. **Precise Documentation**: Document every line mapping with correct line numbers

### Non-Functional Requirements
1. **Accuracy**: 100% accurate line-by-line mapping
2. **Completeness**: All 796 original conjuncts must be mapped
3. **Traceability**: Every line must be traceable to current version
4. **Verification**: Mapping must be independently verifiable

## Success Criteria
1. **Correct Count**: Exactly 796 original conjuncts identified
2. **Complete Mapping**: All 796 lines mapped to current version
3. **Accurate Analysis**: Correct consolidation analysis
4. **Proper Documentation**: Line-by-line mapping documentation

## Technical Approach

### Corrected Parsing Strategy
1. **Line-by-Line Processing**: Process each line 200-995 as one conjunct
2. **Content Extraction**: Extract conjunct content from each line
3. **Structure Recognition**: Recognize that `∧` at end of line is connector, not separator
4. **Accurate Counting**: Count lines, not splits within lines

### Mapping Strategy
1. **Direct Line Mapping**: Map original line N to current line M
2. **Content Matching**: Match conjunct content between versions
3. **Consolidation Detection**: Identify which original lines were consolidated
4. **Gap Analysis**: Find any missing or unaccounted lines

## Implementation Plan

### Phase 1: Corrected Analysis
1. **Fix Parsing Logic**: Correct the conjunct extraction to count lines, not splits
2. **Recount Original**: Extract all 796 original conjuncts correctly
3. **Recount Current**: Extract current conjuncts with correct counting
4. **Verify Counts**: Ensure counts match expected numbers

### Phase 2: Accurate Mapping
1. **Line-by-Line Mapping**: Map each of the 796 original lines
2. **Consolidation Analysis**: Analyze how lines were consolidated
3. **Gap Detection**: Identify any missing lines
4. **Quality Verification**: Verify mapping accuracy

### Phase 3: Corrected Documentation
1. **Update All Reports**: Correct all previous analysis with accurate counts
2. **Line-by-Line Documentation**: Document every line mapping
3. **Consolidation Report**: Accurate consolidation analysis
4. **Verification Guide**: Updated verification procedures

## Arguments
User provided critical correction:
- OldCohProp.thy lines 200-995 each contain one conjunct
- Total should be 796 conjuncts, not 595
- My parsing logic was fundamentally flawed
- Need to redo the entire analysis with correct approach
