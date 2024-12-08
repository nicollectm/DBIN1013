-- 1
CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.bill_total
FROM 
restBill b
JOIN 
restStaff s ON b.waiter_no = s.staff_no 
WHERE
s.first_name = "Sam" AND s.surname = "Pitt";
-- 2
SELECT* FROM
samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals AS
SELECT 
rm.room_name, SUM(b.bill_total) AS total_sum
FROM 
restBill b
JOIN
restRest_table rt ON b.table_no = rt.table_no
JOIN
restRoom_management rm ON rt.room_name = rm.room_name
GROUP BY 
rm.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT
CONCAT(s.first_name, "", s.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM 
restBill b
JOIN
restStaff s ON b.waiter_no = s.staff_no
JOIN 
restRoom_management rm ON s.staff_no = rm.headwaiter
GROUP BY
s.first_name, s.surname;
