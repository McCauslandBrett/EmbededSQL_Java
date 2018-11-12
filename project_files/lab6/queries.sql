-- -- • Find the pid of parts with cost lower than 10
-- SELECT pid
-- FROM Catalog
-- WHERE cost < 10;
-- -- • Find the name of parts with cost lower than 10
-- SELECT P.pname
-- FROM Parts P, Catalog C
-- WHERE C.cost<10 AND P.pid=C.pid;
-- -- • Find the address of the suppliers who supply “Fire Hydrant Cap”
-- SELECT S.address
-- FROM Suppliers S, Catalog C, Parts P
-- WHERE P.pid=C.pid AND P.pname='Fire Hydrant Cap' AND S.sid= C.sid ;
-- -- • Find the name of the suppliers who supply green parts
-- SELECT S.sname
-- FROM Suppliers S, Catalog C, Parts P
-- WHERE P.pid=C.pid AND P.color='Green' AND S.sid= C.sid ;
-- -- • For each supplier, list the supplier’s name along with all parts’
-- name that it supply
-- SELECT S.sname,P.pname
-- FROM Suppliers S, Catalog C, Parts P
-- WHERE P.pid=C.pid AND S.sid= C.sid ;

-- Lab6

-- • Find the total number of parts supplied by each supplier.
SELECT COUNT(C.pid), C.sid,
FROM catalog C,
GROUP BY C.sid;
-- • Find the total number of parts supplied by each supplier who
-- supplies at least 3 parts.
SELECT COUNT(C.pid) AS PartCount, C.sid,
FROM catalog C,
GROUP BY C.sid,
HAVING COUNT(PartCount)>3;

SELECT OrderID
FROM OrderDetails
GROUP BY OrderID
HAVING max(Quantity) > ALL (SELECT avg(Quantity)
                            FROM OrderDetails
                            GROUP BY OrderID);
-- • For every supplier that supplies only green parts,
-- print the name of the supplier and the total number of parts that he supplies.
-- SELECT COUNT(C.pid) AS PartCount, C.sid,P.color
-- FROM catalog C, parts P
-- GROUP BY C.sid
-- WHERE PartCount,C.sid,P.color = ALL(SELECT P.color
--                                     FROM parts P
--                                     where P.color='green');
-- WHERE ProductID = ALL (SELECT ProductId
--                        FROM OrderDetails
--                        WHERE Quantity = 6 OR Quantity = 2);

-- IN AND NOT IN
--
-- GROUP BY C.sid;

-- • For every supplier that supplies green part and red part,
-- print the name of the supplier and the price of
-- the most expensive part that he supplies.
