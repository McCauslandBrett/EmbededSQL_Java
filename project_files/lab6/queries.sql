-- Lab6

-- • Find the total number of parts supplied by each supplier.
SELECT COUNT(C.pid), C.sid
FROM Catalog C
GROUP BY C.sid;
-- • Find the total number of parts supplied by each supplier who
-- supplies at least 3 parts.
-- SELECT COUNT(C.pid) AS PartCount,C.sid,S.sname
-- FROM Catalog C,Suppliers S
-- GROUP BY C.sid
-- HAVING COUNT(PartCount)>3;
SELECT COUNT(C.pid),S.sid
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid
GROUP BY S.sid
HAVING COUNT(C.pid) >= 3;
--  -- For every supplier that supplies only green parts,
--   -- print the name of the supplier and the total number of
--   -- parts that he supplies.

SELECT Suppliers.sname, COUNT(Catalog.pid)
FROM Suppliers, Parts, Catalog
WHERE Parts.pid = Catalog.pid
and Suppliers.sid = Catalog.sid
and Suppliers.sid
IN (SELECT Suppliers.sid
    FROM Suppliers, Parts, Catalog
    WHERE Suppliers.sid = Catalog.sid
    and Parts.pid= Catalog.pid
    and Parts.color= 'Green')
    and Suppliers.sid
    NOT IN (SELECT Suppliers.sid
            FROM Suppliers, Parts, Catalog
            WHERE Suppliers.sid = Catalog.sid
            and Parts.pid = Catalog.pid
            and Parts.Color != 'Green')
            GROUP BY Suppliers.sid

-- For every supplier that supplies green part and red part,
-- print the name of the supplier and the price of
-- the most expensive part that he supplies.
SELECT suppliers.sname, MAX(catalog.cost)
FROM suppliers, catalog, parts
WHERE parts.pid = catalog.pid
and suppliers.sid = Catalog.sid
and suppliers.sid
IN(SELECT suppliers.sid
   FROM suppliers, parts , catalog
   WHERE suppliers.sid=catalog.sid
   and parts.pid = catalog.pid
   and parts.color = 'Red')
   and suppliers.sid
   IN(SELECT suppliers.sid
      FROM suppliers,parts,catalog
      WHERE suppliers.sid = catalog.sid
      and parts.pid=catalog.pid
      and parts.color = 'Green')
      Group BY suppliers.sname
