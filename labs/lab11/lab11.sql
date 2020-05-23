.read sp20data.sql

CREATE TABLE obedience AS
SELECT seven, instructor
FROM students;

CREATE TABLE smallest_int AS
SELECT time, smallest
FROM students
WHERE smallest > 2
ORDER BY smallest 
LIMIT 20;

CREATE TABLE matchmaker
AS
SELECT stud1.pet, stud2.song, stud1.color, stud2.color
FROM students as stud1, students as stud2
WHERE stud1.pet = stud2.pet AND stud1.song = stud2.song AND stud1.time < stud2.time;
;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
--CREATE TABLE stacks_helper,
  --dogs,
  --stack_height,
  --last_height
--);

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
