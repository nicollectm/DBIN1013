Task4.sql

-- 1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00
  AND waiter_no IN (
      SELECT staff_no
      FROM restStaff
      WHERE first_name = 'Charles' AND surname = 'Watson'
  );

-- 2 
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_date = 160111
      AND room_name = (
          SELECT room_name
          FROM restBill
          WHERE cust_name = 'Nerida Smith'
            AND bill_date = 160111
          LIMIT 1
      )
);

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4 
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5
SELECT 
    b.cust_name,
    s.first_name AS headwaiter_first_name,
    s.surname AS headwaiter_surname,
    rm.room_name
FROM 
    restBill b
JOIN 
    restStaff s ON b.waiter_no = s.staff_no
JOIN 
    restRoom_management rm ON rm.headwaiter = s.staff_no
WHERE 
    b.bill_total = (SELECT MAX(bill_total) FROM restBill);