-- Lab6

-- • Find the total number of parts supplied by each supplier.
-- SELECT COUNT(C.pid), C.sid
-- FROM Catalog C
-- GROUP BY C.sid;
--
-- -- • Find the total number of parts supplied by each supplier who
-- -- supplies at least 3 parts.
--
SELECT COUNT(C.pid),S.sid,S.sname
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
GROUP BY S.sid
HAVING COUNT(C.pid) >= 3;
--  -- For every supplier that supplies only green parts,
--   -- print the name of the supplier and the total number of
--   -- parts that he supplies.
SELECT COUNT(C.pid),S.sid,S.sname
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
and S.sid = C.sid
and S.sid NOT IN (
          SELECT S2.sid
          FROM Suppliers S2, Parts P2, Catalog C2
          WHERE S2.sid = C2.sid
          and P2.pid = C2.pid
          and P2.Color != 'Green')
GROUP BY S.sid;



-- -- For every supplier that supplies green part and red part,
-- -- print the name of the supplier and the price of
-- -- the most expensive part that he supplies.
-- SELECT Suppliers.sname, MAX(Catalog.cost)
-- FROM Suppliers, Catalog, Parts
-- WHERE Parts.pid = Catalog.pid
-- and Suppliers.sid = Catalog.sid
-- and Suppliers.sid
-- IN(SELECT Suppliers.sid
--    FROM Suppliers, Parts , Catalog
--    WHERE Suppliers.sid = Catalog.sid
--    and Parts.pid = Catalog.pid
--    and Parts.color = 'Red')
--    and Suppliers.sid
--    IN(SELECT Suppliers.sid
--       FROM Suppliers,Parts,Catalog
--       WHERE Suppliers.sid = Catalog.sid
--       and Parts.pid=Catalog.pid
--       and Parts.color = 'Green')
-- Group BY Suppliers.sname
