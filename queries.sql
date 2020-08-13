-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT a.ProductName, b.CategoryName
FROM Product as a
JOIN Category as b on a.CategoryId = b.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT a.id as orderId, b.CompanyName
FROM [Order] as a
JOIN Shipper as b on a.shipvia = b.id
WHERE OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT a.ProductName, a.QuantityPerUnit
FROM product as a
join orderdetail as b on a.id =b.ProductId 
WHERE b.OrderId = 10251
Order By a.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT a.id as OrderID, c.CompanyName as Customer, b.LastName as EmployeeLastName
FROM [Order] as a
left join Employee as b on a.EmployeeId = b.Id
join Customer as c on a.CustomerId = c.Id


-- Stretch

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT a.CategoryName, count(b.ProductName) as count
FROM Categories as a
LEFT JOIN Products as b on a.categoryid = b.categoryid
GROUP BY a.CategoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT a.OrderID, count(c.ProductName) as ItemCount
FROM Orders as a
LEFT JOIN OrderDetails as b
ON a.OrderID = b.OrderID
LEFT JOIN Products as c
ON b.ProductID = c.ProductID
GROUP BY a.OrderID
