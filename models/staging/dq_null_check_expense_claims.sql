
{{config(materialized = 'table', database='raw',
 alias='DQ_NULL_CHECK_EXPENSE_CLAIMS'
)}}


with dq_check as (
    {{check_nulls(ref('stg_expense_claims'),['claim_id','employee_id','amount'])}}
)


SELECT * FROM dq_check where null_check_status ='FAIL'