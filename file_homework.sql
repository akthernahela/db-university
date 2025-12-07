USE db_universityadmin;
/*
#1. Selezionare tutti gli studenti nati nel 1990 (160)
#SELECT * FROM `students` WHERE YEAR(date_of_birth) = 1990;

#2. Selezionare tutti i corsi che valgono più di 10 crediti (479)``
#SELECT * FROM `courses` WHERE `cfu` > 10;

#3. Selezionare tutti gli studenti che hanno più di 30 anni
#SELECT * FROM `students` WHERE (YEAR(CURDATE()) - YEAR(date_of_birth)) > 30;

#4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
#SELECT * FROM `courses` WHERE `year` = 1 AND `period` = 'I semestre';

#5. Selezionare tutti gli appelli del esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
#SELECT * FROM `exams` WHERE `date` = '2020-06-20' AND `hour` >= '14:00:00';

#6. Selezionare tutti i corsi di laurea magistrale (38)
#SELECT * FROM `degrees` WHERE `level` = 'magistrale';

#7. Da quanti dipartimenti è composta l^università? (12)
#SELECT * FROM `departments`;

#8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
#SELECT * FROM `teachers` WHERE `phone` IS NULL;

#GROUP 

#1. Contare quanti iscritti ci sono stati ogni anno
#SELECT YEAR(enrolment_date) AS `enrolment_year`, COUNT(*) FROM `students` GROUP BY YEAR(enrolment_date) ORDER BY `enrolment_year`;

#2. Contare gli insegnanti che hanno l^ufficio nello stesso edificio
#SELECT `office_address`, COUNT(*) AS `teacher` FROM `teachers` GROUP BY `office_address`;

#3. Calcolare la media dei voti di ogni appello d^esame
#SELECT `exam_id`, AVG(vote) AS `avrg_marks` FROM `exam_student` GROUP BY `exam_id`;

#4. Contare quanti corsi di laurea ci sono per ogni dipartimento
#SELECT `department_id`, COUNT(*) AS `corsi_laurea` FROM `degrees` GROUP BY `department_id`;

*/

#JOIN

#1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

/*SELECT
    students.id,
    students.name,
    students.surname,
    students.date_of_birth,
    students.fiscal_code,
    students.enrolment_date,
    students.registration_number,
    students.degree_id
FROM students
INNER JOIN degrees
    ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';
*/

#2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

/*SELECT
    degrees.id,
    degrees.name,
    degrees.level,
    degrees.address,
    degrees.email,
    degrees.website,
    degrees.department_id
FROM degrees
INNER JOIN departments
    ON degrees.department_id = departments.id
WHERE degrees.level = 'magistrale'
  AND departments.name = 'Dipartimento di Neuroscienze';
*/

#3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

/*SELECT
    courses.id,
    courses.name,
    courses.description,
    courses.period,
    courses.year,
    courses.cfu,
    courses.website,
    courses.degree_id
FROM courses
INNER JOIN course_teacher
    ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;
*/

#4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

/*SELECT
    students.name AS student_name,
    students.surname AS student_surname,
    degrees.name AS degree_name,
    departments.name AS department_name
FROM students
INNER JOIN degrees
    ON students.degree_id = degrees.id
INNER JOIN departments
    ON degrees.department_id = departments.id
ORDER BY
    students.surname ASC,
    students.name ASC;
*/

#5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT
    degrees.name AS degree_name,
    courses.name AS course_name,
    teachers.name AS teacher_name,
    teachers.surname AS teacher_surname
FROM degrees
INNER JOIN courses
    ON courses.degree_id = degrees.id
INNER JOIN course_teacher
    ON course_teacher.course_id = courses.id
INNER JOIN teachers
    ON teachers.id = course_teacher.teacher_id
ORDER BY
    degree_name,
    course_name,
    teacher_surname;
