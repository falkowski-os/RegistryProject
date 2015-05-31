CREATE TABLE IF NOT EXISTS grupa_dostepowa (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR (40) NOT NULL,
    id_uzytkownika_wpr BIGINT NOT NULL,
    data_wpr DATE NOT NULL,
    id_uzytkownika_mod BIGINT,
    data_mod DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (id_uzytkownika_wpr) REFERENCES uzytkownik(id),
    FOREIGN KEY (id_uzytkownika_mod) REFERENCES uzytkownik(id)
);

CREATE TRIGGER grupa_dostepowa_data_wpr_date BEFORE INSERT ON grupa_dostepowa
FOR EACH ROW
SET NEW.data_wpr = CURRENT_DATE;

CREATE TRIGGER grupa_dostepowa_data_mod_date BEFORE UPDATE ON grupa_dostepowa
FOR EACH ROW
SET NEW.data_mod = CURRENT_DATE;

create table if not exists projekt (
    id bigint not null auto_increment primary key,
    nazwa varchar(50) not null,
    data_start date,  
    data_koniec date,
    max_token int not null,
	id_uzytkownika_wpr bigint not null,
	id_uzytkownika_mod bigint not null,
	data_mod date not null,
	data_wpr date not null
);

create table if not exists historia_projekt (
 	id_projekt bigint not null,
 	nazwa varchar(50) not null,
	data_start date not null,
	data_koniec date not null,
	max_token int not null,
	id_uzytkownika_wpr bigint not null,
	id_uzytkownika_mod bigint not null,
	data_mod date not null,
	data_wpr date not null
);

alter table historia_projekt add foreign key (id_projekt) references projekt (id);

create trigger update_projekt
  before update on projekt
    for each row
        
INSERT INTO historia_projekt VALUES (old.id, old.nazwa, old.data_start, old.data_koniec, old.max_token, old.id_uzytkownika_wpr, old.id_uzytkownika_mod, old.data_mod, old.data_wpr);
				
create trigger delete_projekt
  before delete on projekt
    for each row
        
INSERT INTO historia_projekt VALUES (old.id, old.nazwa, old.data_start, old.data_koniec, old.max_token, old.id_uzytkownika_wpr, old.id_uzytkownika_mod, old.data_mod, old.data_wpr);