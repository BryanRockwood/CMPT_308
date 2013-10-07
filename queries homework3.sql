-- Bryan Rockwood
-- 10/6/13
-- CMPT 308
-- Database Management
-- Alan Labouseur
-- Query Hw 3

--Question 1
SELECT city
FROM agents
WHERE aid 
IN ( 
	SELECT aid
	FROM orders
	WHERE cid = 'c002') ;
	
-- Questions 2
SELECT a.city,  a.aid, o.cid
FROM agents a, orders o
WHERE a.aid = o.aid
AND   o.cid = 'c002'
ORDER BY a.aid

--Question 3
SELECT pid
FROM orders 
WHERE aid
IN (
	Select aid
	from orders
	where cid
	IN 
	(
		SELECT cid
		FROM customers
		WHERE city = 'Kyoto'))
		
-- Question 4
SELECT o.pid 
FROM orders o
WHERE o.aid 
IN (
	SELECT distinct o.aid
	FROM orders o, customers c
	WHERE o.cid = c.cid
	AND   c.city = 'Kyoto')
	
-- Question 5
SELECT name 
FROM customers
WHERE cid
NOT IN(
	SELECT cid
	FROM orders
	)
	
-- Question 6
SELECT c.name
FROM orders o right outer join  customers c ON o.cid = c.cid
WHERE o.cid is null

-- Question 7
SELECT c.name, a.name
FROM customers c, agents a, orders o
Where c.city =a.city
AND o.cid = c.cid
AND o.aid = a.aid


-- Question 8
SELECT c.name, a.name, c.city
FROM customers c, agents a
Where c.city =a.city

-- Question 9
SELECT p.city, c.name
FROM products p, customers c
WHERE p.city = c.city
GROUP by p.city, c.name
Order by COUNT (p.city)
LIMIT 2

--Question 10
SELECT p.city, c.name
FROM products p, customers c
WHERE p.city = c.city
GROUP by p.city, c.name
Order by p.city
LIMIT 2

-- Question 11
SELECT p.city, c.name
FROM products p left outer join customers c on c.city = p.city
GROUP by p.city, c.name
HAVING count (p.city)
 IN (

SELECT count (p.city)
FROM products p
GROUP BY p.city
Order by count(p.city) desc
LIMIT 1)

--Question 12
(SELECT name, avg (priceUSD)
FROM products
Group BY name
having avg (priceUSD) > (select avg (priceUSD) from products))

--Question 13
(SELECT c.name, o.pid, o.dollars
FROM orders o, customers c
GROUP BY c.name, o.pid, o.dollars, c.cid,o.cid
HAVING c.cid = o.cid
ORDER BY o.dollars desc
)
--Question 14
SELECT c.name, coalesce (sum (o.qty),0000000000000000)
FROM customers c left outer join orders o ON o.cid=c.cid
GROUP BY o.cid, c.name
order by c.name

--Question 15
SELECT c.name, a.name, p.name, a.city
FROM customers c, agents a, orders o, products p
Where a.city = 'New York'
AND c.cid = o.cid
AND p.pid = o.pid
AND a.aid = o.aid

-- Question 16
SELECT o.dollars, ((o.qty* p.priceUSD) *(( 100- c.discount)/100)), o.ordno
FROM orders o left outer join products p on o.pid = p.pid
	      left outer join customers c on o.cid=c.cid
		  
-- Question 17

Update orders
set dollars = 1111.00
where ordno = 1015