
    
    



select count(*) as validation_errors
from (

    select
        id

    from `finl-1067321-eds-thunderdome`.`maxm`.`customers`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


