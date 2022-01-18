USE bottega_uni;

INSERT INTO professors(professor_name, professor_email)
VALUES('Karen Flores', 'k_f@edu.com');
INSERT INTO professors(professor_name, professor_email)
VALUES('Eduardo Sanchez', 'e_s@edu.com');

INSERT INTO students(student_name, student_email)
VALUES('Barna', 'barna@edu.com');
INSERT INTO students(student_name, student_email)
VALUES('Fer', 'fer@edu.com');
INSERT INTO students(student_name, student_email)
VALUES('Susan', 'susan@edu.com');
INSERT INTO students(student_name, student_email)
VALUES('Noch', 'noch@edu.com');
INSERT INTO students(student_name, student_email)
VALUES('Ran', 'ran@edu.com');

INSERT INTO courses(course_title, course_professor_id)
VALUES(
'Git',
(SELECT professor_id FROM professors WHERE professor_email = 'k_f@edu.com')
);
INSERT INTO courses(course_title, course_professor_id)
VALUES(
'JavaScript',
(SELECT professor_id FROM professors WHERE professor_email = 'k_f@edu.com')
);
INSERT INTO courses(course_title, course_professor_id)
VALUES(
'Python',
(SELECT professor_id FROM professors WHERE professor_email = 'e_s@edu.com')
);

INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Python'),
(SELECT student_id FROM students WHERE student_id = 1)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Git'),
(SELECT student_id FROM students WHERE student_id = 2)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'JavaScript'),
(SELECT student_id FROM students WHERE student_id = 3)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Git'),
(SELECT student_id FROM students WHERE student_id = 4)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Python'),
(SELECT student_id FROM students WHERE student_id = 4)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Python'),
(SELECT student_id FROM students WHERE student_id = 5)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'Git'),
(SELECT student_id FROM students WHERE student_id = 5)
);
INSERT INTO grades(grade_obtained, grade_course_id, grade_student_id)
VALUES(
round( rand()*10),
(SELECT course_id FROM courses WHERE course_title = 'JavaScript'),
(SELECT student_id FROM students WHERE student_id = 5)
);


SELECT *
FROM courses
JOIN students;

SELECT *
FROM grades;

-- #querys
-- #average grade by professor Karen
SELECT ROUND(AVG(grade_obtained)) AS 'average grade assigned by Karen'
FROM grades
WHERE grade_course_id = 2 OR grade_course_id = 1 ;
-- #average grade by professor Eduardo 
SELECT ROUND(AVG(grade_obtained)) AS 'average grade assigned by Eduardo'
FROM grades
WHERE grade_course_id = 3;

-- #TOP GRADES FROM EACH STUDENT
SELECT MAX(grade_obtained)
FROM grades
WHERE grade_student_id = 1;
SELECT MAX(grade_obtained)
FROM grades
WHERE grade_student_id = 2;
SELECT MAX(grade_obtained)
FROM grades
WHERE grade_student_id = 3;
SELECT MAX(grade_obtained)
FROM grades
WHERE grade_student_id = 4;
SELECT MAX(grade_obtained)
FROM grades
WHERE grade_student_id = 5;

-- #GROUP STUDENTS BY COURSE
SELECT 
s.student_name,
g.grade_student_id,
c.course_title
FROM students s
JOIN grades g
ON g.grade_student_id = s.student_id
JOIN courses c
ON g.grade_course_id = course_id;

-- #SUMMARY REPORT COURSES AND AVERAGE GRADES
SELECT
c.course_title  AS 'Course',
AVG(g.grade_obtained) AS 'Average grade'
FROM courses c
JOIN grades g
ON g.grade_course_id = c.course_id
GROUP BY c.course_title;