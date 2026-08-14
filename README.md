# 관계형 데이터베이스 설계와 SQL


students 1 ───── N grades N ───── 1 subjects
                                      │
                                      │ 1
                                      │
                                      N
                                  professers

- 학생 1명 → 여러 개의 성적을 가질 수 있음
- 과목 1개 → 여러 학생의 성적을 가질 수 있음
- 과목 1개 → 여러 교수와 연결할 수도 있음

```
PRAGMA foreign_keys = ON;
```
SQLite에서만 사용하는 설정 명령어. 
"앞으로 이 SQLite 연결에서는 FK 제약조건을 검사해라" 
즉 이게 없으면/OFF로 되어 있으면 FK를 선언해 놓았더라도 실제로 그 참조 관계를 검사하지는 않는다. 

---

```
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS students;
```
같은 이름의 테이블이 이미 존재할 경우, 기존 테이블을 삭제 후 새로 만들어 초기화시킨다. 
FK 관계로 인해 자식 테이블을 먼저 삭제하는 순서대로 진행. 