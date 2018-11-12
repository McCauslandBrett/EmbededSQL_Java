-- Lab6

-- • Find the total number of parts supplied by each supplier.
SELECT COUNT(C.pid), C.sid,
FROM catalog C
GROUP BY C.sid;
-- • Find the total number of parts supplied by each supplier who
-- supplies at least 3 parts.
SELECT COUNT(C.pid) AS PartCount, C.sid,
FROM catalog C,
GROUP BY C.sid,
HAVING COUNT(PartCount)>3;
--  -- For every supplier that supplies only green parts,
--   -- print the name of the supplier and the total number of
--   -- parts that he supplies.


-- SELECT OrderID
-- FROM OrderDetails
-- GROUP BY OrderID
-- HAVING max(Quantity) > ALL (SELECT avg(Quantity)
--                             FROM OrderDetails
--                             GROUP BY OrderID);


-- SELECT COUNT(C.pid) AS PartCount, C.sid,P.color
-- FROM catalog C, parts P
-- GROUP BY C.sid
-- WHERE PartCount,C.sid,P.color = ALL(SELECT P.color
--                                     FROM parts P
--                                     where P.color='green');

SELECT S.sname, COUNT(*) as PartCount
FROM Suppliers S, Catalog C, Parts P
WHERE C.sid = S.id and P.id = C.pid and P.color = 'green'
GROUP BY S.sname, S.id


-- For every supplier that supplies green part and red part,
-- print the name of the supplier and the price of
-- the most expensive part that he supplies.

--
-- SELECT S.sname, MAX(C.cost) as Partmax
-- FROM Suppliers S, Catalog C, Parts P
-- WHERE C.sid = S.id and P.id = C.pid
-- GROUP BY S.id
-- WHERE C.sid IN
--    (SELECT DISTINCT C.sid
--     FROM Catalog C1, Parts P1
--     WHERE C1.pid = P1.id AND P1.color ='red'
--     INTERSECT
--     SELECT DISTINCT C2.sid
--     FROM Catalog C2, Parts P2
--     WHERE C2.pid=P2.id AND P2.color ='green';
--     )
--
-- SELECT	 S.sname, MAX(C.cost) AS Partmax
-- FROM     suppliers AS S, parts AS P, catalog AS C
-- WHERE    P.id = C.pid AND C.sid = S.id
-- GROUP BY S.sname, S.id,P.color
-- HAVING   P.color IN ('green','red')
--
-- SELECT   s.sname, MIN(c.cost)as MIC
-- FROM     suppliers AS s, parts AS p, catalog AS c
-- WHERE    p.id = c.pid AND c.sid = s.id
-- GROUP BY s.sname, s.id,p.color
-- HAVING   p.color IN ('green','red')
