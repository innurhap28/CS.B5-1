# queries.sql 실행 결과 목록


## Q01. WHERE를 사용한 조건 조회
```
sqlite> SELECT student_name, school_year FROM students 
   ...> WHERE school_year = 2;
┌──────────────┬─────────────┐
│ student_name │ school_year │
├──────────────┼─────────────┤
│ Charlie Kim  │ 2           │
│ Daniel Park  │ 2           │
│ Echo Park    │ 2           │
│ Frank Lee    │ 2           │
└──────────────┴─────────────┘
Run Time: real 0.000 user 0.000063 sys 0.000056
```

---
## Q02. ORDER BY와 LIMIT을 사용한 상위 데이터 조회
```
sqlite> SELECT * FROM students 
   ...> ORDER BY school_year DESC 
   ...> LIMIT 3;
┌────────────┬──────────────┬───────────────┬─────────────┐
│ student_id │ student_name │     phone     │ school_year │
├────────────┼──────────────┼───────────────┼─────────────┤
│ ST010      │ Jackson Kim  │ 010-1234-0010 │ 4           │
│ ST007      │ Gabriel Lee  │ 010-1234-0007 │ 3           │
│ ST008      │ Hopper Choi  │ 010-1234-0008 │ 3           │
└────────────┴──────────────┴───────────────┴─────────────┘
Run Time: real 0.000 user 0.000111 sys 0.000102
```

---
## Q03. WHERE와 ORDER BY를 사용한 조건 정렬
```
sqlite> SELECT * FROM students
   ...> WHERE school_year = 2
   ...> ORDER BY student_name DESC;
┌────────────┬──────────────┬───────────────┬─────────────┐
│ student_id │ student_name │     phone     │ school_year │
├────────────┼──────────────┼───────────────┼─────────────┤
│ ST006      │ Frank Lee    │ 010-1234-0006 │ 2           │
│ ST005      │ Echo Park    │ 010-1234-0005 │ 2           │
│ ST004      │ Daniel Park  │ 010-1234-0004 │ 2           │
│ ST003      │ Charlie Kim  │ 010-1234-0003 │ 2           │
└────────────┴──────────────┴───────────────┴─────────────┘
Run Time: real 0.000 user 0.000094 sys 0.000077
```

---
## Q04. LIKE를 사용한 문자열 검색
```
sqlite> SELECT * FROM students 
   ...> WHERE student_name LIKE '%Park%';
┌────────────┬──────────────┬───────────────┬─────────────┐
│ student_id │ student_name │     phone     │ school_year │
├────────────┼──────────────┼───────────────┼─────────────┤
│ ST004      │ Daniel Park  │ 010-1234-0004 │ 2           │
│ ST005      │ Echo Park    │ 010-1234-0005 │ 2           │
└────────────┴──────────────┴───────────────┴─────────────┘
Run Time: real 0.001 user 0.000069 sys 0.000072
```
---
## Q05. INNER JOIN을 사용한 테이블 연결
```
sqlite> SELECT A.subject_name, B.prof_name
   ...> FROM subjects A INNER JOIN professors B
   ...> ON A.prof_id = B.prof_id;
┌───────────────┬───────────────┐
│ subject_name  │   prof_name   │
├───────────────┼───────────────┤
│ Physics       │ Kelvin Jung   │
│ Algebra I     │ Miles Morales │
│ Algebra II    │ Miles Morales │
│ English I     │ Oister Kim    │
│ English II    │ Oister Kim    │
│ Calculus      │ Lauren Kim    │
│ Chemistry     │ Nicholas Park │
│ Biology       │ Pardon Park   │
│ Geometry      │ Lauren Kim    │
│ History       │ Quebec Kim    │
│ World History │ Sarah Lee     │
│ Economics     │ Ticktack Tock │
└───────────────┴───────────────┘
Run Time: real 0.000 user 0.000115 sys 0.000099
```

---
## Q06. 여러 테이블을 INNER JOIN으로 연결
```
sqlite> SELECT A.student_name, B.subject_name, C.grade
   ...> FROM subjects B INNER JOIN enrollments C
   ...> ON B.subject_id = C.subject_id INNER JOIN students A
   ...> ON A.student_id = C.student_id;
┌──────────────┬───────────────┬───────┐
│ student_name │ subject_name  │ grade │
├──────────────┼───────────────┼───────┤
│ Alice Kim    │ Physics       │ 80    │
│ Barley Lee   │ Algebra II    │ 70    │
│ Daniel Park  │ Algebra I     │ 100   │
│ Alice Kim    │ English I     │ 80    │
│ Frank Lee    │ Calculus      │ 100   │
│ Gabriel Lee  │ Chemistry     │ 70    │
│ Hopper Choi  │ English II    │ 80    │
│ Barley Lee   │ Geometry      │ 60    │
│ Echo Park    │ Geometry      │ 100   │
│ Frank Lee    │ History       │ 80    │
│ Daniel Park  │ World History │ 90    │
│ Hopper Choi  │ Economics     │ 60    │
│ Issac Hong   │ Physics       │ 80    │
│ Jackson Kim  │ Calculus      │ 100   │
└──────────────┴───────────────┴───────┘
Run Time: real 0.001 user 0.000127 sys 0.000109
```

---
## Q07. LEFT JOIN을 사용한 전체 데이터 조회
```
sqlite> SELECT A.prof_name, B.subject_name 
   ...> FROM professors A LEFT OUTER JOIN subjects B 
   ...> ON A.prof_id = B.prof_id;
┌───────────────┬───────────────┐
│   prof_name   │ subject_name  │
├───────────────┼───────────────┤
│ Kelvin Jung   │ Physics       │
│ Lauren Kim    │ Calculus      │
│ Lauren Kim    │ Geometry      │
│ Miles Morales │ Algebra I     │
│ Miles Morales │ Algebra II    │
│ Nicholas Park │ Chemistry     │
│ Oister Kim    │ English I     │
│ Oister Kim    │ English II    │
│ Pardon Park   │ Biology       │
│ Quebec Kim    │ History       │
│ Richard Lee   │ [NULL]        │
│ Sarah Lee     │ World History │
│ Ticktack Tock │ Economics     │
└───────────────┴───────────────┘
Run Time: real 0.000 user 0.000129 sys 0.000101
```

---
## Q08. COUNT와 GROUP BY를 사용한 수강자 수 집계
```
sqlite> SELECT A.subject_name AS 과목명, COUNT(B.student_id) AS 수강자수
   ...> FROM subjects A INNER JOIN enrollments B
   ...> ON A.subject_id = B.subject_id
   ...> GROUP BY A.subject_name;
┌───────────────┬──────────┐
│     과목명      │  수강자수  │
├───────────────┼──────────┤
│ Algebra I     │ 1        │
│ Algebra II    │ 1        │
│ Calculus      │ 2        │
│ Chemistry     │ 1        │
│ Economics     │ 1        │
│ English I     │ 1        │
│ English II    │ 1        │
│ Geometry      │ 2        │
│ History       │ 1        │
│ Physics       │ 2        │
│ World History │ 1        │
└───────────────┴──────────┘
Run Time: real 0.000 user 0.000109 sys 0.000079
```

---
## Q09. AVG와 GROUP BY를 사용한 평균 성적 집계
```
sqlite> SELECT A.subject_name AS 과목명, AVG(B.grade) AS 평균성적
   ...> FROM subjects A INNER JOIN enrollments B
   ...> ON A.subject_id = B.subject_id
   ...> GROUP BY A.subject_name;
┌───────────────┬──────────┐
│     과목명      │  평균성적  │
├───────────────┼──────────┤
│ Algebra I     │ 100.0    │
│ Algebra II    │ 70.0     │
│ Calculus      │ 100.0    │
│ Chemistry     │ 70.0     │
│ Economics     │ 60.0     │
│ English I     │ 80.0     │
│ English II    │ 80.0     │
│ Geometry      │ 80.0     │
│ History       │ 80.0     │
│ Physics       │ 80.0     │
│ World History │ 90.0     │
└───────────────┴──────────┘
Run Time: real 0.000 user 0.000107 sys 0.000070
```

---
## Q10. COUNT와 GROUP BY를 사용한 수강 과목 수 집계
```
sqlite> SELECT A.student_name AS 이름, COUNT(B.subject_id) AS 수강과목수
   ...> FROM students A INNER JOIN enrollments B
   ...> ON A.student_id = B.student_id
   ...> GROUP BY A.student_name;
┌─────────────┬────────────┐
│     이름     │   수강과목수  │
├─────────────┼────────────┤
│ Alice Kim   │ 2          │
│ Barley Lee  │ 2          │
│ Daniel Park │ 2          │
│ Echo Park   │ 1          │
│ Frank Lee   │ 2          │
│ Gabriel Lee │ 1          │
│ Hopper Choi │ 2          │
│ Issac Hong  │ 1          │
│ Jackson Kim │ 1          │
└─────────────┴────────────┘
Run Time: real 0.001 user 0.000103 sys 0.000075
```

---
## Q11. 서브쿼리를 사용한 평균값 기준 조회
```
sqlite> SELECT * FROM students
   ...> WHERE school_year > (SELECT AVG(school_year) FROM students);
┌────────────┬──────────────┬───────────────┬─────────────┐
│ student_id │ student_name │     phone     │ school_year │
├────────────┼──────────────┼───────────────┼─────────────┤
│ ST007      │ Gabriel Lee  │ 010-1234-0007 │ 3           │
│ ST008      │ Hopper Choi  │ 010-1234-0008 │ 3           │
│ ST009      │ Issac Hong   │ 010-1234-0009 │ 3           │
│ ST010      │ Jackson Kim  │ 010-1234-0010 │ 4           │
└────────────┴──────────────┴───────────────┴─────────────┘
Run Time: real 0.000 user 0.000100 sys 0.000078
```