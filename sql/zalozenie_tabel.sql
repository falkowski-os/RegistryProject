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