SELECT (CASE WHEN GRADE < 8 THEN NULL ELSE NAME END), GRADE, MARKS
FROM(SELECT NAME,
        (CASE WHEN MARKS < 10 THEN 1
         WHEN MARKS = 100 THEN 10
         ELSE FLOOR(MARKS/10)+1 END) AS GRADE,
         MARKS
     FROM STUDENTS) AS GRADES
ORDER BY GRADE DESC, NAME ASC, MARKS ASC
