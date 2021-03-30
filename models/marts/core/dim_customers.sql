with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (
    
    select * from {{ ref('stg_payments') }}
),

customer_orders as (

    select
        customer_id,
        order_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1,2

),

customer_payments as (
    
    select
        order_id,
        amount
    
    from payments
),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        sum(customer_payments.amount) as lifetime_value

    from customers

    left join customer_orders using (customer_id)
    left join customer_payments on customer_orders.order_id = customer_payments.order_id

    group by 1,2,3,4,5,6
)

select * from final