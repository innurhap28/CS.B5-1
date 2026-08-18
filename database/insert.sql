PRAGMA foreign_keys = ON;

INSERT INTO students (student_id, student_name, phone, school_year) VALUES
    ('ST001', 'Alice Kim',    '010-1234-0001', 1),
    ('ST002', 'Barley Lee',   '010-1234-0002', 1),
    ('ST003', 'Charlie Kim',  '010-1234-0003', 2),
    ('ST004', 'Daniel Park',  '010-1234-0004', 2),
    ('ST005', 'Echo Park',    '010-1234-0005', 2),
    ('ST006', 'Frank Lee',    '010-1234-0006', 2),
    ('ST007', 'Gabriel Lee',  '010-1234-0007', 3),
    ('ST008', 'Hopper Choi',  '010-1234-0008', 3),
    ('ST009', 'Issac Hong',   '010-1234-0009', 3),
    ('ST010', 'Jackson Kim',  '010-1234-0010', 4);

INSERT INTO professors (prof_id, prof_name) VALUES
    ('PF001', 'Kelvin Jung'),
    ('PF002', 'Lauren Kim'),
    ('PF003', 'Miles Morales'),
    ('PF004', 'Nicholas Park'),
    ('PF005', 'Oister Kim'),
    ('PF006', 'Pardon Park'),
    ('PF007', 'Quebec Kim'),
    ('PF008', 'Richard Lee'),
    ('PF009', 'Sarah Lee'),
    ('PF010', 'Ticktack Tock');

INSERT INTO subjects (subject_id, prof_id, subject_name) VALUES
    ('SJ001', 'PF001', 'Physics'),
    ('SJ002', 'PF003', 'Algebra I'),
    ('SJ003', 'PF003', 'Algebra II'),
    ('SJ004', 'PF005', 'English I'),
    ('SJ005', 'PF005', 'English II'),
    ('SJ006', 'PF002', 'Calculus'),
    ('SJ007', 'PF004', 'Chemistry'),
    ('SJ008', 'PF006', 'Biology'),
    ('SJ009', 'PF002', 'Geometry'),
    ('SJ010', 'PF007', 'History'),
    ('SJ011', 'PF009', 'World History'),
    ('SJ012', 'PF010', 'Economics');

INSERT INTO enrollments (enroll_id, student_id, subject_id, semester, grade) VALUES
    ('EN001', 'ST001', 'SJ001', '2025-1', '80'),
    ('EN002', 'ST002', 'SJ003', '2025-1', '70'),
    ('EN003', 'ST004', 'SJ002', '2025-1', '100'),
    ('EN004', 'ST001', 'SJ004', '2025-2', '80'),
    ('EN005', 'ST006', 'SJ006', '2025-2', '100'),
    ('EN006', 'ST007', 'SJ007', '2025-2', '70'),
    ('EN007', 'ST008', 'SJ005', '2025-2', '80'),
    ('EN008', 'ST002', 'SJ009', '2026-1', '60'),
    ('EN009', 'ST005', 'SJ009', '2026-1', '100'),
    ('EN010', 'ST006', 'SJ010', '2026-1', '80'),
    ('EN011', 'ST004', 'SJ011', '2026-1', '90'),
    ('EN012', 'ST008', 'SJ012', '2026-2', '60'),
    ('EN013', 'ST009', 'SJ001', '2026-2', '80'),
    ('EN014', 'ST010', 'SJ006', '2026-2', '100');