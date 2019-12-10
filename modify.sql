ALTER TABLE class
MODIFY COLUMN Level varchar(50);

ALTER TABLE studentlevels
MODIFY COLUMN Level varchar(50);

ALTER TABLE timevolunteer
MODIFY COLUMN Day int(11);

ALTER TABLE timestudent
MODIFY COLUMN Day int(11);