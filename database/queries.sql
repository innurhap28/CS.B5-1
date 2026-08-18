-- ==============================
-- # Q01. WHERE를 사용한 조건 조회
-- ==============================
SELECT student_name, school_year FROM students
    WHERE school_year = 2;


-- ==============================
-- # Q02. ORDER BY와 LIMIT을 사용한 상위 데이터 조회
-- ==============================
SELECT * FROM students
    ORDER BY school_year DESC
    LIMIT 3;


-- ==============================
-- # Q03. WHERE와 ORDER BY를 사용한 조건 정렬
-- ==============================
SELECT * FROM students
    WHERE school_year = 2
    ORDER BY student_name DESC;


-- ==============================
-- # Q04. LIKE를 사용한 문자열 검색
-- ==============================
SELECT * FROM students
    WHERE student_name LIKE '%Park%';


-- ==============================
-- # Q05. INNER JOIN을 사용한 테이블 연결
-- ==============================
SELECT A.subject_name, B.prof_name
    FROM subjects A INNER JOIN professors B
        ON A.prof_id = B.prof_id;


-- ==============================
-- # Q06. 여러 테이블을 INNER JOIN으로 연결
-- ==============================
SELECT A.student_name, B.subject_name, C.grade
    FROM subjects B INNER JOIN enrollments C
        ON B.subject_id = C.subject_id INNER JOIN students A
            ON A.student_id = C.student_id;


-- ==============================
-- # Q07. LEFT JOIN을 사용한 전체 데이터 조회
-- ==============================
SELECT A.prof_name, B.subject_name 
    FROM professors A LEFT OUTER JOIN subjects B 
        ON A.prof_id = B.prof_id;


-- ==============================
-- # Q08. COUNT와 GROUP BY를 사용한 수강자 수 집계
-- ==============================
SELECT A.subject_name AS 과목명, COUNT(B.student_id) AS 수강자수
    FROM subjects A INNER JOIN enrollments B
        ON A.subject_id = B.subject_id
        GROUP BY A.subject_name;


-- ==============================
-- # Q09. AVG와 GROUP BY를 사용한 평균 성적 집계
-- ==============================
SELECT A.subject_name AS 과목명, AVG(B.grade) AS 평균성적
    FROM subjects A INNER JOIN enrollments B
        ON A.subject_id = B.subject_id
            GROUP BY A.subject_name;


-- ==============================
-- # Q10. COUNT와 GROUP BY를 사용한 수강 과목 수 집계
-- ==============================
SELECT A.student_name AS 이름, COUNT(B.subject_id) AS 수강과목수
    FROM students A INNER JOIN enrollments B
        ON A.student_id = B.student_id
            GROUP BY A.student_name;


-- ==============================
-- # Q11. 서브쿼리를 사용한 평균값 기준 조회
-- ==============================
SELECT * FROM students
    WHERE school_year > (
        SELECT AVG(school_year) FROM students
    );