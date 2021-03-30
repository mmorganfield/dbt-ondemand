

  create or replace view `finl-1067321-eds-thunderdome`.`maxm`.`stg_customers`
  OPTIONS()
  as with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from `finl-1067321-eds-thunderdome.maxm.customers`
)

select * from customers;

