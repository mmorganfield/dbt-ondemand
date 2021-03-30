

  create or replace view `finl-1067321-eds-thunderdome`.`maxm`.`stg_payments`
  OPTIONS()
  as select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at

from `finl-1067321-eds-thunderdome`.`maxm`.`payments`;

