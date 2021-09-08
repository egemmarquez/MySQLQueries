SELECT 
    payment.id AS 'Payment ID',
    user.id AS 'User ID',
    user.first_name,
    user.last_name,
    user.phone,
    user.email,
    payment.amount,
    school.name AS school_name,
    campus.name AS campus_name,
    discipline.name AS discipline_name,
    payment.date AS 'Date of Charge', 
    payment_info.exp_date as 'Expiration Date' 
FROM
    payment
        LEFT JOIN
    user ON payment.user_id = user.id
        JOIN
    user_student ON payment.user_id = user_student.user_id
        JOIN
    discipline ON user_student.discipline_id = discipline.id
        JOIN
    payment_info ON user.id = payment_info.user_id
          JOIN
    campus ON discipline.campus_id = campus.id
    JOIN
    school ON campus.school_id = school.id 
