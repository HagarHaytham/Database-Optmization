ALTER TABLE class
MODIFY COLUMN Level varchar(50);

ALTER TABLE studentlevels
MODIFY COLUMN Level varchar(50);

ALTER TABLE timevolunteer
MODIFY COLUMN Day int(11);

ALTER TABLE timestudent
MODIFY COLUMN Day int(11);

ALTER TABLE timevolunteer
Change `From` availableFrom time;

ALTER TABLE timevolunteer
Change `To` availableTo time;



DELETE FROM timevolunteer
WHERE 1;

DELETE FROM timestudent
WHERE 1;

DELETE FROM studentlevels
WHERE 1;


DELETE FROM studentlesson
WHERE 1;

DELETE FROM studentclass
WHERE 1;

DELETE FROM lesson
WHERE 1;

DELETE FROM class
WHERE 1;