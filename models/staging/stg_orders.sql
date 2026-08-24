select 
    o.ORDERID,
    o.ORDERDATE,
    o.SHIPDATE,
    o.SHIPMODE,
    o.CUSTOMERID,
    o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
    o.ORDERSELLINGPRICE,
    o.ORDERCOSTPRICE,
    c.CustomerName,
    c.Segment,
    c.Country,
    p.ProductID,
    p.ProductName,
    p.SubCategory,
    p.Category
    from {{ ref('orders') }} as o
    left join {{ ref('customers') }} as c
    on o.CUSTOMERID = c.CUSTOMERID
    left join {{ ref('products') }} as p
    on o.ProductID = p.ProductID