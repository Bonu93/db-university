-------------------------------------- GROUP BY -------------------------------------------



-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`), YEAR(`enrolment_date`) AS `Year` 
FROM `students` 
GROUP BY `Year`;

-- 2 Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`id`), `office_address` 
FROM `teachers` 
GROUP BY `office_address`;

--  3 Calcolare la media dei voti di ogni appello d'esame

SELECT ROUND(AVG (`vote`), 3) AS `Average`, `exam_id` 
FROM `exam_student` 
GROUP BY `exam_id`;


-- 4 Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`), `department_id` 
FROM `degrees` 
GROUP BY `department_id`;


-------------------------------------------- JOIN -------------------------------------------------

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT * FROM `students` 
INNER JOIN `degrees` 
ON students.degree_id = degrees.id 
WHERE degrees.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT * FROM `degrees` 
INNER JOIN `departments` ON degrees.department_id = departments.id 
WHERE departments.name = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT * FROM `course_teacher` 
WHERE `teacher_id` = 44;

-- 4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.name AS `student_name`, students.surname AS `student_surnmane`, degrees.name AS `degree_name`, departments.name AS `department_name` 
FROM `students`
INNER JOIN `degrees` ON students.degree_id = degrees.id 
INNER JOIN `departments` ON degrees.department_id = departments.id 
ORDER BY `student_surnmane`, `student_name`;