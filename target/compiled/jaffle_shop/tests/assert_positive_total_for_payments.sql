
with dbt__CTE__INTERNAL_test as (
-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail.
select
    order_id,
    sum(amount) as total_amount
from `finl-1067321-eds-thunderdome`.`maxm`.`stg_payments`
group by 1
having not(total_amount >= 0)
)select count(*) from dbt__CTE__INTERNAL_test