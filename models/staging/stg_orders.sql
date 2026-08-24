select 
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    o.ordersellingprice,
    o.ordercostprice,
 
    p.productname,
    p.subcategory,
    p.category
    from {{ ref('orders') }} as o
    
    left join {{ ref('products') }} as p
    on o.productid = p.productid