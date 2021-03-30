
    
    




with all_values as (

    select distinct
        status as value_field

    from `finl-1067321-eds-thunderdome`.`maxm`.`stg_orders`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'completed','shipped','returned','placed'
    )
)

select count(*) as validation_errors
from validation_errors


