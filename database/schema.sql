PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id      TEXT(5)      PRIMARY KEY,
    student_name    VARCHAR(5)  NOT NULL,
    phone           TEXT        UNIQUE,
    school_year     INT         NOT NULL
);

CREATE TABLE professors (
    prof_id         TEXT(5)      PRIMARY KEY,
    prof_name       VARCHAR(5)  NOT NULL
);

CREATE TABLE subjects (
    subject_id      TEXT(5)      PRIMARY KEY,
    prof_id         TEXT(5)      NOT NULL,
    subject_name    TEXT        NOT NULL UNIQUE,
    FOREIGN KEY (prof_id) REFERENCES professors(prof_id)
);

CREATE TABLE enrollments (
    enroll_id       TEXT(5)      PRIMARY KEY,
    student_id      TEXT(5)      NOT NULL,
    subject_id      TEXT(5)      NOT NULL,
    semester        TEXT        NOT NULL,
    grade           CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
)