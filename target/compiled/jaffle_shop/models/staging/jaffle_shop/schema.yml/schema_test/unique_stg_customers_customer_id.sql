
    
    



select count(*) as validation_errors
from (

    select
        customer_id

    from `finl-1067321-eds-thunderdome`.`maxm`.`stg_customers`
    where customer_id is not null
    group by customer_id
    having count(*) > 1

) validation_errors


