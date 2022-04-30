INSERT INTO jobs(name, label) VALUES
    ('tacos', 'Tacos'),
    ('jardinier', 'Jardinier')
;

INSERT INTO job_grades (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('801', 'tacos',0,'recrue','Recrue',12,'{}','{}'),
    ('802', 'jardinier',0,'recrue','Recrue',12,'{}','{}')

;

INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
   ('commandetacos', 'Commande Tacos',50, 0, 1),
   ('plante', 'Plante du Jardinier',50, 0, 1)
   
;   

