# 관계형 데이터베이스 설계와 SQL

```
                         ┌─────────────────┐
                         │   PROFESSORS    │
                         ├─────────────────┤
                         │ PK prof_id      │
                         │    prof_name    │
                         └────────┬────────┘
                                  │ 1
                                  │
                                  │ N
                         ┌────────▼────────┐
                         │    SUBJECTS     │
                         ├─────────────────┤
                         │ PK subject_id   │
                         │ FK prof_id      │
                         │    subject_name │
                         └────────┬────────┘
                                  │ 1
                                  │
                                  │ N
┌─────────────────┐      ┌────────▼────────┐
│    STUDENTS     │      │   ENROLLMENTS   │
├─────────────────┤      ├─────────────────┤
│ PK student_id   │ 1  N │ PK enrollment_id│
│    student_name │──────│ FK student_id   │
│    phone UNIQUE  │      │ FK subject_id   │
└─────────────────┘      │    semester     │
                         │    grade        │
                         └─────────────────┘
```


```
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