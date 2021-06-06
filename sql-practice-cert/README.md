# SQL Practice #

SQL Practice repository

### SQL Study ###

* SQL study process
* summary of functions and procedures
* [Google](https://google.com)

### Something to add ###

* Functions
* Procedures

### Contribution guidelines ###

* Writing tests
* Code review
* To Study a lot

### References ###

* [Google](https://google.com)
* Some Additional information

The default host is 'localhost' and the default port is 3306;

To log into the data base console:
$ mysql -u admin -p

To check the database: (an sql command on terminal, always ends on a semicolon)
$ show databases;

To create a database called testgui1:
$ create database testgui1;

Check if it was created:
$ show databases;

Select the database:
$ use ss1;
p

Help of an specific command:
help use

Check tables:
$ show tables;
$ show tables from DB_name;

Check the content of a table (the table is called 'Employee':
$ show * from users;

Make a backup of the database, using the mysqldump tool (not required been logged into mariaDB):
$mysqldump --user=admin --password=123qwe --result-file=/home/ss/progs/ss1-backup.sql --databases ss1


mysqldump --user=admin --password=123qwe --result-file=/home/ss/progs/crocapp-tables/x.sql --databases crocapp


--temp:

create database crocapp;
use crocapp;
DROP TABLE IF EXISTS users;

-- ok executed in terminal, mariaDB
create table crocapp.users(
    id int(5) not null auto_increment,
    username varchar(20) default null,
    userpassword varchar(20) default null,
    userrandomkey varchar(20) default null,
    useremail varchar(20) default null,
    useralias varchar(20) default null,
    primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;


-- from dbsolo
CREATE  TABLE `users`(`id` INT NOT NULL,
                      `username` VARCHAR(50) NOT NULL,
                      `userpassword` VARCHAR(50) NOT NULL,
                      `userrandomkey` INT NOT NULL,
                      `useremail` VARCHAR(50),
                      `useralias` VARCHAR(50) NOT NULL,
  CONSTRAINT users_pk1 PRIMARY KEY (`id`))
 ENGINE = InnoDB;
 
 CREATE  TABLE `userdetails`(`id` INT NOT NULL,
                            `firstname` VARCHAR(50) NOT NULL,
                            `lastname` VARCHAR(50) NOT NULL,
                            `address` VARCHAR(50) NOT NULL,
                            `phone` VARCHAR(50),
                            `property1` VARCHAR(50) NOT NULL,
  CONSTRAINT userdetails_pk1 PRIMARY KEY (`id`))
 ENGINE = InnoDB;
 
 CREATE  TABLE `userapps`(`id` INT NOT NULL,
                         `appname` VARCHAR(50) NOT NULL,
                         `appyear` YEAR NOT NULL,
                         `applastupdate` DATE NOT NULL,
                         `appcode` VARCHAR(50) NOT NULL,
                         `userexperience` VARCHAR(50) NOT NULL,
  CONSTRAINT userapps_pk1 PRIMARY KEY (`id`))
 ENGINE = InnoDB;
 
 CREATE  TABLE `userbirth`(`id` INT NOT NULL,
                          `usermonth` VARCHAR(50) NOT NULL,
                          `useryear` YEAR NOT NULL,
                          `userhospitalvalue` INT NOT NULL,
                          `usersign` VARCHAR(50) NOT NULL,
  CONSTRAINT userbirth_pk1 PRIMARY KEY (`id`),
  CONSTRAINT id UNIQUE (`id`))
 ENGINE = InnoDB;
 
 CREATE  TABLE `useros`(`id` INT AUTO_INCREMENT NOT NULL,
                       `userosx` VARCHAR(50) NOT NULL,
                       `userversion` VARCHAR(50) NOT NULL,
                       `userexpertise` VARCHAR(50) NOT NULL,
                       `userostheme` VARCHAR(50) NOT NULL,
                       `useroscost` INT DEFAULT 10 NOT NULL,
  CONSTRAINT useros_pk1 PRIMARY KEY (`id`),
  CONSTRAINT useros_uniq1 UNIQUE (`id`))
 ENGINE = InnoDB;
 
ALTER TABLE users CHANGE COLUMN username username VARCHAR(60) NOT NULL COMMENT '';
 
--Drop the id column in our table, and create back the id column but with the autoincrement key feature:
ALTER TABLE table_name drop id;
ALTER TABLE table_name add id int auto_increment key;

--Insert informaition by hand, line by line: 
 INSERT INTO users (username, userpassword, userrandomkey, useremail, useralias) VALUES ('gstar','123asd','567','gs@davs.tech','gohan21');
 
 -- delete an specific field
 delete from users where id = 3;
 delete from users where id between 10 and 22;

--reset the auto_incerement
alter table users auto_increment = 1;

--load local data (from a csv file):
load data local infile "/home/ss/progs/crocapp-tables/tempy1.csv" into table table_name fields terminated by ';' lines terminated by '\n';

--update a field:
UPDATE `crocapp`.`users` SET `userrandomkey` = '441' WHERE (`id` = '5');

-- check the table status and verify the columns:
check table table_name;
describe table_name;
describe view_name;

-- create a view (a view is like a DB, but it's just a view, it affects the database). When you can't modif the order of the columns in a database, this is a solution.
CREATE VIEW userdetails_view AS SELECT id, firstname, lastname, address, phone, property1 FROM userdetails;

-- to show all tables and views:
show full tables;

-- delete a view in sql:
drop view view_name;

-- load data from a file, to a view in sql: 
load data local infile "/home/ss/progs/crocapp-tables/usersdetails.csv" into table userdetails_view fields terminated by ';' lines terminated by '\n';

-- 


describe userapps;
alter table userapps drop id;
describe userapps;
alter table userapps add id int auto_increment key;
describe userapps;
create view userapps_view as select id, appname, appyear, applastupdate, appcode, userexperience from userapps;
show full tables;
describe userapps_view;
load data local infile "/home/ss/progs/crocapp-tables/userapp.csv" into table userapps_view fields terminated by ';' lines terminated by '\n';
select * from userapps_view;
select * from userapps;
show full tables;
drop view userapps_view;
show full tables;


Links:
https://www.tutorialrepublic.com/php-tutorial/php-mysql-crud-application.php


***
sudo dmidecode -s xx

and xx can be:


    bios-vendor
    bios-version
    bios-release-date
    system-manufacturer
    system-product-name
    system-version
    system-serial-number
    system-uuid
    baseboard-manufacturer
    baseboard-product-name
    baseboard-version
    baseboard-serial-number
    baseboard-asset-tag
    chassis-manufacturer
    chassis-type
    chassis-version
    chassis-serial-number
    chassis-asset-tag
    processor-family
    processor-manufacturer
    processor-version
    processor-frequency




















