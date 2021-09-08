SELECT 
    a.id,
    a.first_name,
    a.last_name,
    a.phone,
    a.email,
    b.date AS charge_date
FROM
    user a
        RIGHT JOIN
    payment b ON a.id = b.user_id
WHERE
    b.date BETWEEN '2020-01-01 00:00:00' AND '2020-12-31 23:59:00'
        AND a.active = 1
        AND b.type = 'C'
GROUP BY id
HAVING COUNT(a.id) > 1
