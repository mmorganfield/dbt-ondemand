

  create or replace view `finl-1067321-eds-thunderdome`.`maxm`.`stg_orders`
  OPTIONS()
  as select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from `finl-1067321-eds-thunderdome`.`maxm`.`orders`;

