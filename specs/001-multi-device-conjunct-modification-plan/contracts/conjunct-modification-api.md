# Conjunct Modification API Contract

## Overview
This contract defines the API for modifying conjuncts in Isabelle/HOL theory files to support multi-device patterns.

## Endpoints

### 1. Modify Conjunct
**Method**: `modify_conjunct`  
**Input**: 
- `line_number`: nat - Line number in CoherenceProperties.thy
- `original_content`: string - Original 2-device constraint
- `complexity_level`: enum - Simple, Medium, Complex, Critical
- `pattern_type`: enum - Universal, MutualExclusion, Existential, Global

**Output**:
- `modified_content`: string - Multi-device constraint
- `semantic_analysis`: string - Explanation of semantic preservation
- `success`: boolean - Whether modification was successful
- `error_message`: string - Error details if unsuccessful

**Preconditions**:
- Line number must be between 561-1056
- Original content must be non-empty
- Complexity level must be valid
- Pattern type must be valid

**Postconditions**:
- Modified content preserves original semantics
- Quantifier patterns follow established conventions
- Original content preserved in cartouche comment
- Progress tracking updated

### 2. Batch Modify Conjuncts
**Method**: `batch_modify_conjuncts`  
**Input**:
- `batch_id`: nat - Batch identifier
- `start_line`: nat - First line in batch
- `end_line`: nat - Last line in batch
- `conjuncts`: list[ConjunctInput] - List of conjuncts to modify

**Output**:
- `batch_result`: BatchResult - Overall batch modification result
- `modified_conjuncts`: list[ConjunctOutput] - Successfully modified conjuncts
- `failed_conjuncts`: list[ConjunctError] - Failed conjuncts with error details
- `success_rate`: real - Percentage of successful modifications

**Preconditions**:
- Start line must be ≤ end line
- All conjuncts must be in specified range
- Batch must not exceed parallelization limits

**Postconditions**:
- All successful modifications applied
- Progress tracking updated for batch
- Failed modifications logged with details
- Batch status updated

### 3. Update Progress Tracking
**Method**: `update_progress_tracking`  
**Input**:
- `conjuncts`: list[ConjunctStatus] - List of conjunct status updates
- `batch_status`: BatchStatus - Current batch status
- `overall_progress`: ProgressStatus - Overall progress status

**Output**:
- `success`: boolean - Whether update was successful
- `updated_files`: list[string] - Files that were updated
- `error_message`: string - Error details if unsuccessful

**Preconditions**:
- All conjunct statuses must be valid
- Batch status must be consistent
- Progress status must be accurate

**Postconditions**:
- SWMR_modification_progress.py updated
- PROGRESS_REPORT.md updated
- DETAILED_MODIFICATIONS.md updated
- my_messages.md updated

### 4. Validate Modification
**Method**: `validate_modification`  
**Input**:
- `line_number`: nat - Line number to validate
- `original_content`: string - Original content
- `modified_content`: string - Modified content

**Output**:
- `is_valid`: boolean - Whether modification is valid
- `syntax_errors`: list[string] - Isabelle syntax errors
- `semantic_errors`: list[string] - Semantic validation errors
- `suggestions`: list[string] - Improvement suggestions

**Preconditions**:
- Line number must be valid
- Content must be non-empty
- Modification must be complete

**Postconditions**:
- Syntax validation completed
- Semantic validation completed
- Validation results returned

## Data Types

### ConjunctInput
```typescript
interface ConjunctInput {
  line_number: number;
  original_content: string;
  complexity_level: 'Simple' | 'Medium' | 'Complex' | 'Critical';
  pattern_type: 'Universal' | 'MutualExclusion' | 'Existential' | 'Global';
}
```

### ConjunctOutput
```typescript
interface ConjunctOutput {
  line_number: number;
  original_content: string;
  modified_content: string;
  semantic_analysis: string;
  success: boolean;
}
```

### ConjunctError
```typescript
interface ConjunctError {
  line_number: number;
  original_content: string;
  error_message: string;
  error_type: 'Syntax' | 'Semantic' | 'Pattern' | 'Dependency';
}
```

### BatchResult
```typescript
interface BatchResult {
  batch_id: number;
  total_conjuncts: number;
  successful_conjuncts: number;
  failed_conjuncts: number;
  success_rate: number;
  processing_time: number;
}
```

### ConjunctStatus
```typescript
interface ConjunctStatus {
  line_number: number;
  status: 'Pending' | 'InProgress' | 'Completed' | 'NeedsReview';
  modified_content?: string;
  semantic_analysis?: string;
}
```

### BatchStatus
```typescript
interface BatchStatus {
  batch_id: number;
  status: 'Pending' | 'InProgress' | 'Completed' | 'NeedsReview';
  start_line: number;
  end_line: number;
  conjunct_count: number;
  completed_conjuncts: number;
}
```

### ProgressStatus
```typescript
interface ProgressStatus {
  total_conjuncts: number;
  modified_conjuncts: number;
  remaining_conjuncts: number;
  completion_percentage: number;
  current_batch: number;
  last_modified: string;
}
```

## Error Handling

### Error Types
1. **Syntax Errors**: Isabelle/HOL syntax validation failures
2. **Semantic Errors**: Semantic preservation validation failures
3. **Pattern Errors**: Quantifier pattern validation failures
4. **Dependency Errors**: Circular dependency or missing dependency errors
5. **File Errors**: File system or git operation failures

### Error Response Format
```typescript
interface ErrorResponse {
  error_type: string;
  error_message: string;
  error_details: string;
  suggested_fix: string;
  line_number?: number;
  context?: string;
}
```

## Performance Requirements

### Response Times
- **Single Conjunct Modification**: < 1 second
- **Batch Modification (10 conjuncts)**: < 10 seconds
- **Progress Tracking Update**: < 2 seconds
- **Validation**: < 5 seconds

### Throughput
- **Concurrent Modifications**: Up to 10 parallel modifications
- **Batch Size**: Maximum 20 conjuncts per batch
- **Progress Updates**: Real-time updates for active modifications

### Resource Usage
- **Memory**: < 100MB for typical operations
- **CPU**: < 50% for parallel modifications
- **Disk I/O**: Minimal for progress tracking updates

## Security Considerations

### Input Validation
- All inputs must be validated before processing
- Line numbers must be within valid range
- Content must be properly escaped
- File paths must be validated

### Access Control
- Only authorized users can modify conjuncts
- Progress tracking updates require authentication
- Git operations require proper permissions

### Data Integrity
- All modifications must be atomic
- Progress tracking must be consistent
- File modifications must be validated
- Git commits must be verified

## Monitoring and Logging

### Metrics
- Modification success rate
- Average processing time
- Error frequency by type
- Progress tracking accuracy

### Logging
- All modifications logged with timestamps
- Error details logged for debugging
- Progress updates logged for audit
- User interactions logged for review

### Alerts
- High error rates trigger alerts
- Long processing times trigger alerts
- Progress tracking inconsistencies trigger alerts
- File system errors trigger alerts
