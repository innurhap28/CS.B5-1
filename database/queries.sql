-- ==============================
-- # Q00. 쿼리 실습 내용 작성
-- ==============================

SELECT student_name, school_year FROM students
    WHERE school_year = 2;

SELECT * FROM students
    ORDER BY school_year DESC
    LIMIT 3;

SELECT * FROM students
    WHERE school_year = 2
    ORDER BY student_name DESC;

SELECT * FROM students
    WHERE student_name LIKE %Park%;

 SELECT A.subject_name, B.prof_name
    FROM subjects A INNER JOIN professors B
        ON A.prof_id = B.prof_id;

SELECT A.student_name, B.subject_name, C.grade
    FROM subjects B INNER JOIN enrollments C
        ON B.subject_id = C.subject_id INNER JOIN students A
            ON A.student_id = C.student_id;

SELECT A.prof_name, B.subject_name 
    FROM professors A LEFT OUTER JOIN subjects B 
        ON A.prof_id = B.prof_id;