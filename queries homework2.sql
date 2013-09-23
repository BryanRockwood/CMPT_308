--Bryan Rockwood
-- 9/19/13 -9/22/13
-- CMPT 308
-- Alan Labouseur
-- Query Homework 2




-- Question 1. 

SELECT city
FROM agents
WHERE aid 
IN ( 
	SELECT aid
	FROM orders
	WHERE cid = 'c002') ;
	
	
-- Question 2
SELECT o.pid 
FROM orders o
WHERE o.aid 
IN (
	SELECT distinct o.aid
	FROM orders o, customers c
	WHERE o.cid = c.cid
	AND   c.city = 'Kyoto')
	

-- Question 3
SELECT cid, name
FROM customers
WHERE cid
NOT IN (
	SELECT cid
	FROM orders
	WHERE aid = 'a03' ) ;
		
-- Question 4
SELECT distinct c.cid, c.name
FROM  orders o, customers c
WHERE o.pid = 'p01'
AND   c.cid = o.cid
AND   o.cid
IN (
	SELECT o.cid
	FROM orders o
	WHERE o.pid = 'p07')

-- Question 5
SELECT distinct o.pid
FROM orders o
WHERE o.cid
 IN(
	 SELECT distinct o.cid
	 FROM agents a, orders o
	 WHERE a.aid = 'a03')
	 

	

-- Question 6
SELECT name, discount
FROM customers
WHERE city
IN (
	SELECT city
	FROM agents
	WHERE city = 'Duluth'
	  OR  city = 'Dallas') ;
	  
-- Question 7

SELECT name
FROM customers
WHERE city
IN (
	SELECT city
	FROM customers
	WHERE  city = 'Kyoto'
	  OR  city = 'Dallas') ;
	  
