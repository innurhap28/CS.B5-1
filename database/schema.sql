PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id      INT(5)      PRIMARY KEY,
    student_name    VARCHAR(5)  NOT NULL,
    phone           TEXT        UNIQUE
);

CREATE TABLE subjects (
    subject_id      INT(5)      PRIMARY KEY,
    subject_name    TEXT        NOT NULL UNIQUE
);

CREATE TABLE professors (
    prof_id         INT(5)      PRIMARY KEY,
    prof_name       VARCHAR(5)  NOT NULL,
    subject_id      INT(5)      NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE grades (
    grade_id        INT(5)      PRIMARY KEY,
    student_id      INT(5)      NOT NULL,
    subject_id      INT(5)      NOT NULL,
    grade           CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
)