
#7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
# Создать таблицы с иерархией из диаграммы в БД
CREATE TABLE animal (
	id INT PRIMARY KEY auto_increment NOT NULL,
	kind VARCHAR(20)
	
);

CREATE TABLE PET (
    id INT PRIMARY KEY,
    id_animal INT,
    FOREIGN KEY (id_animal) REFERENCES animal(id)

);


CREATE TABLE Pack_animal (
    id INT PRIMARY KEY,
    id_animal INT,
    FOREIGN KEY (id_animal) REFERENCES animal(id)

);

CREATE TABLE dogs (
    id INT PRIMARY KEY,
    id_pet INT,
    FOREIGN KEY (id_pet) REFERENCES pet (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

CREATE TABLE cats (
    id INT PRIMARY KEY,
    id_pet INT,
    FOREIGN KEY (id_pet) REFERENCES pet (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

CREATE TABLE hamsters (
    id INT PRIMARY KEY,
    id_pet INT,
    FOREIGN KEY (id_pet) REFERENCES pet (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

CREATE TABLE horses (
    id INT PRIMARY KEY,
    id_pack_animal INT,
    FOREIGN KEY (id_pack_animal) REFERENCES Pack_animal (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

CREATE TABLE donkeys (
    id INT PRIMARY KEY,
    id_pack_animal INT,
    FOREIGN KEY (id_pack_animal) REFERENCES Pack_animal (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

CREATE TABLE camels (
    id INT PRIMARY KEY,
    id_pack_animal INT,
    FOREIGN KEY (id_pack_animal) REFERENCES Pack_animal (id),
    name VARCHAR(100),
    birthdate Date,
    command VARCHAR(100)
    
);

#Заполнить низкоуровневые таблицы именами(животных), командами
#которые они выполняют и датами рождения

INSERT INTO animal (id, kind)
VALUES 
(1, 'pet'),(2, 'pet'),(3, 'pet'),(4, 'pet'),(5, 'pack animal'),
(6, 'pack animal'),(7, 'pack animal'),(8, 'pack animal'),(9, 'pack animal'),(10, 'pack animal'),
(11,'pet'),(12,'pet'),(13,'pet'),(14,'pet'),(15,'pet'),
(16,'pet'),(17, 'pack animal' ),(18, 'pack animal'),(19, 'pack animal'),(20, 'pack animal'),
(21, 'pack animal'),(22, 'pack animal'),(23, 'pack animal'),(24, 'pack animal'),(25, 'pet'),
(26, 'pet'),(27, 'pet'),(28, 'pet'),(29, 'pet'),(30, 'pack animal');

ALTER TABLE pet 
ADD species VARCHAR(20);

ALTER TABLE pack_animal 
ADD species VARCHAR(20);



INSERT INTO pet (id, id_animal, species)
VALUES
(1,1, 'dog'),
(2,2, 'cat'),
(3,3, 'hamster'),
(4,4, 'dog'),
(5,11, 'dog'),
(6,12, 'cat'),
(7,13, 'hamster'),
(8,14, 'hamster'),
(9,15, 'dog'),
(10,16, 'cat'),
(11,25, 'cat'),
(12,26, 'cat'),
(13,27, 'dog'),
(14,28, 'dog'),
(15,29, 'dog');

INSERT INTO pack_animal (id, id_animal, species)
VALUES
(1,5, 'horse'),
(2,6, 'camel'),
(3,7, 'camel'),
(4,8, 'donkey'),
(5,9, 'horse'),
(6,10, 'horse'),
(7,17, 'horse'),
(8,18, 'donkey'),
(9,19, 'donkey'),
(10,20, 'camel'),
(11,21, 'horse'),
(12,22, 'donkey'),
(13,23, 'camel'),
(14,24, 'camel'),
(15,30, 'donkeys');

INSERT INTO dogs (id, id_pet, name, birthdate, command )
VALUES
(1, 1, 'Buch', '2020-10-16', 'Сидеть, лежать, зайка'),
(2, 4, 'Tuzik', '2018-11-10', 'Сидеть, лежать'),
(3, 5, 'Him', '2018-08-05', 'Место'),
(4, 9, 'Jack', '2022-06-05', 'Лежать'),
(5, 13, 'Koko', '2020-10-16', 'Сидеть, лежать'),
(6, 14, 'Bick', '2019-05-09', 'Сидеть, место'),
(7, 15, 'Luck', '2015-10-10', 'Сидеть');

INSERT INTO cats (id, id_pet, name, birthdate, command )
VALUES
(1, 2, 'Barsik', '2019-04-07', 'нет'),
(2, 6, 'Marysia', '2020-05-05', 'нет'),
(3, 10, 'Myrka', '2018-08-05', 'голос'),
(4, 11, 'Tom', '2022-06-05', 'нет'),
(5, 12, 'Kiko', '2020-10-16', 'бежать');



INSERT INTO hamsters  (id, id_pet, name, birthdate, command )
VALUES
(1, 3, 'Xoma', '2023-04-07', 'нет'),
(2, 7, 'Pika', '2021-12-01', 'нет'),
(3, 8, 'Greck', '2022-01-13', 'нет');

INSERT INTO horses  (id, id_pack_animal , name, birthdate, command )
VALUES
(1, 1, 'White', '2015-10-16', 'Рысь, хоп, вперед, стоп'),
(2, 5, 'Russet', '2018-03-10', 'Вперед, стоп, рысь, тише'),
(3, 6, 'Tail', '2013-08-15', 'Шагом, вперед, прыжок, стоп, рысь'),
(4, 7, 'Jacky', '2022-11-20', 'Вперед, стоп'),
(5, 11, 'Rock', '2017-07-16', 'Вперед, стоп, рысь');



INSERT INTO donkeys  (id, id_pack_animal , name, birthdate, command )
VALUES
(1, 4, 'Liz', '2018-09-10', 'вперед, стоп'),
(2, 8, 'Berti', '2019-12-10', 'Вперед, стоп, тише'),
(3, 9, 'Dora', '2019-08-20', 'вперед,стоп'),
(4, 12, 'Rudi', '2022-07-07', 'Вперед, стоп, ,быстро'),
(5, 15, 'Kona', '2023-05-16', 'нет');



INSERT INTO camels (id, id_pack_animal , name, birthdate, command )
VALUES
(1, 2, 'Bo', '2020-03-17', 'вперед, стоп, лежать'),
(2, 3, 'All', '2020-08-10', 'Вперед, стоп, тише, вниз'),
(3, 10, 'Hloy', '2019-06-20', 'вперед,стоп'),
(4, 13, 'Rolo', '2022-09-19', 'Вперед, стоп, ,быстро'),
(5, 14, 'Swen', '2023-01-20', 'нет');


#Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку.


DROP TABLE camels;

DELETE FROM pack_animal
WHERE species = 'camel';
DROP TABLE horses_and_donkeys;
# Объединить таблицы лошади, и ослы в одну таблицу.
CREATE TABLE horses_and_donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_type VARCHAR(50),
    id_in_type_table INT,
    id_pack_animal INT,
    FOREIGN KEY (id_pack_animal) REFERENCES pack_animal(id),
    name VARCHAR(100),
    birthdate DATE,
    command VARCHAR(100)
 
    
);
 
    
INSERT INTO horses_and_donkeys (animal_type,id_in_type_table, id_pack_animal ,name, birthdate,command)
SELECT 'horse',id, id_pack_animal ,name, birthdate,command FROM horses
UNION ALL
SELECT 'donkey',id, id_pack_animal ,name, birthdate,command FROM donkeys;

/*Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице*/
DROP TABLE young_animals;
CREATE TABLE young_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_to_type_animal INT,
    animal_type VARCHAR(20),
    name VARCHAR(100),
    birthdate DATE,
    age VARCHAR(50)
    
);

     
INSERT INTO young_animals (id_to_type_animal, animal_type, name, birthdate, age)
SELECT derived_table.id_to_type_animal, derived_table.animal_type, derived_table.name, derived_table.birthdate,
       CONCAT(TIMESTAMPDIFF(YEAR, derived_table.birthdate, CURDATE()), ' years and ',
              TIMESTAMPDIFF(MONTH, derived_table.birthdate, CURDATE()) % 12, ' months') AS age
FROM (
      SELECT id AS id_to_type_animal, "dog" AS animal_type, name, birthdate FROM dogs
      UNION ALL
      SELECT id AS id_to_type_animal, "cat" AS animal_type, name, birthdate FROM cats
      UNION ALL
      SELECT id AS id_to_type_animal, "hamsters" AS animal_type, name, birthdate FROM hamsters
      UNION ALL
      SELECT id AS id_to_type_animal, animal_type, name, birthdate FROM horses_and_donkeys
     ) AS derived_table
WHERE TIMESTAMPDIFF(MONTH, derived_table.birthdate, CURDATE()) >= 12 
      AND TIMESTAMPDIFF(MONTH, derived_table.birthdate, CURDATE()) < 36;

     
     
# Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
DROP TABLE all_animals;
CREATE TABLE all_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_type VARCHAR(50),
    id_in_type_table INT,
    id_pet_animal INT,
    id_pack_animal INT,
    name VARCHAR(100),
    birthdate DATE,
    command VARCHAR(100)
);

INSERT INTO all_animals (animal_type, id_in_type_table, id_pet_animal, id_pack_animal, name, birthdate, command)
SELECT 'dog', id, id_pet, NULL, name, birthdate, command FROM dogs
UNION ALL
SELECT 'cat', id, id_pet, NULL, name, birthdate, command FROM cats
UNION ALL
SELECT 'hamster', id, id_pet, NULL, name, birthdate, command FROM hamsters
UNION ALL
SELECT animal_type, id_in_type_table, NULL, id_pack_animal, name, birthdate, command FROM horses_and_donkeys;

