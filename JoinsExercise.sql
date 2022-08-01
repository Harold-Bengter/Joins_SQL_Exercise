/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
FROM products p
INNER JOIN categories c
ON p.CategoryID = c.CategoryID; 

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating
FROM products p
LEFT JOIN reviews r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5; 

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity) AS "Total Sales"
FROM employees e
LEFT JOIN sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.FirstName,  e.MiddleInitial, e.LastName
ORDER BY SUM(s.Quantity) DESC; 

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT
departments.Name,
categories.Name
FROM departments d
JOIN categories c
ON d.DepartmentID = c.DepartmentID
HAVING categories.Name = "Games"
OR categories.Name = "Appliances";
    
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, Count(s.Quantity) AS 'total sales', SUM(s.Quantity * s.PricePerUnit) AS 'total revenue'
 FROM products p
 INNER JOIN sales s
 ON s.ProductID = p.ProductID
 WHERE p.ProductID = 97;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
LEFT JOIN products ON reviews.ProductID = products.ProductID
WHERE products.Name LIKE "vis%" AND reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name AS "Product Name", SUM(sales.Quantity) AS "Quantity Sold"
FROM products p
INNER JOIN sales s ON p.ProductID = s.ProductID
INNER JOIN employees e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, p.Name;