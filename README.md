# 관계형 데이터베이스 설계와 SQL

```
erDiagram
    students ||--o{ enrollments : "학생 1 - 수강 N"
    subjects ||--o{ enrollments : "과목 1 - 수강 N"
    professors ||--o{ subjects : "교수 1 - 과목 N"

    students {
        TEXT student_id PK "학생 ID"
        VARCHAR student_name "NOT NULL"
        TEXT phone "UNIQUE, NULL 허용"
        INT school_year "NOT NULL"
    }

    professors {
        TEXT prof_id PK "교수 ID"
        VARCHAR prof_name "NOT NULL"
    }

    subjects {
        TEXT subject_id PK "과목 ID"
        TEXT prof_id FK "NOT NULL -> professors.prof_id"
        TEXT subject_name "NOT NULL, UNIQUE"
    }

    enrollments {
        TEXT enroll_id PK "수강 ID"
        TEXT student_id FK "NOT NULL -> students.student_id"
        TEXT subject_id FK "NOT NULL -> subjects.subject_id"
        TEXT semester "NOT NULL"
        CHAR grade "NULL 허용"
    }
```

```sql
PRAGMA foreign_keys = ON;
```
SQLite에서만 사용하는 설정 명령어. 
"앞으로 이 SQLite 연결에서는 FK 제약조건을 검사해라" 
즉 이게 없으면/OFF로 되어 있으면 FK를 선언해 놓았더라도 실제로 그 참조 관계를 검사하지는 않는다. 

---

```sql
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS students;
```
같은 이름의 테이블이 이미 존재할 경우, 기존 테이블을 삭제 후 새로 만들어 초기화시킨다. 
FK 관계로 인해 자식 테이블을 먼저 삭제하는 순서대로 진행. 


