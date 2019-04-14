CREATE SEQUENCE seq_faktura_naglowek START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_faktura_pozycja START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_karta_graficzna START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_klient START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_komputer START WITH 1 INCREMENT BY 1 MAXVALUE 999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_platnosc START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_procesor START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_producent START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_ram START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE seq_typ START WITH 1 INCREMENT BY 1 MAXVALUE 9999 MINVALUE 1 NOCACHE;

CREATE TABLE komputer (
    id_komputer    NUMBER(4) NOT NULL,
    nazwa          VARCHAR2(40) NOT NULL,
    cena           NUMBER(8, 2) NOT NULL,
    stan           NUMBER(4) NOT NULL,
    id_typ         NUMBER(4) NOT NULL,
    id_procesor    NUMBER(4) NOT NULL,
    id_karty       NUMBER(4) NOT NULL,
    id_ram         NUMBER(4) NOT NULL,
    id_producent   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE komputer ADD CONSTRAINT komputer_pk PRIMARY KEY ( id_komputer );

CREATE OR REPLACE FUNCTION fn_daj_cene (
    v_id_komputer IN NUMBER
) RETURN NUMBER AS
    v_cena komputer.cena%TYPE;
BEGIN
    SELECT
        komputer.cena
    INTO v_cena
    FROM
        komputer
    WHERE
        id_komputer = v_id_komputer;

    RETURN v_cena;
END fn_daj_cene;
/

CREATE OR REPLACE FUNCTION fn_daj_last RETURN NUMBER AS
    v_last NUMBER;
BEGIN
    SELECT
        last_number
    INTO v_last
    FROM
        user_sequences
    WHERE
        sequence_name = 'SEQ_FAKTURA_NAGLOWEK';

    RETURN v_last;
END fn_daj_last;
/

CREATE OR REPLACE FUNCTION fn_daj_stan (
    v_id_komputer IN NUMBER
) RETURN NUMBER AS
    v_stan komputer.stan%TYPE;
BEGIN
    SELECT
        stan
    INTO v_stan
    FROM
        komputer
    WHERE
        id_komputer = v_id_komputer;

    RETURN v_stan;
END fn_daj_stan;
/

CREATE OR REPLACE FUNCTION fn_los_data RETURN DATE AS
    dni NUMBER;
BEGIN
    dni := round(dbms_random.value(1, 90));
    return(SYSDATE - dni);
END fn_los_data;
/

CREATE OR REPLACE FUNCTION fn_los_ilosc RETURN NUMBER AS
BEGIN
    RETURN round(dbms_random.value(1, 4));
END;
/

CREATE TABLE karta_graficzna (
    id_karty       NUMBER(4) NOT NULL,
    nazwa_karty    VARCHAR2(40),
    id_producent   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE karta_graficzna ADD CONSTRAINT karta_graficzna_pk PRIMARY KEY ( id_karty );

CREATE OR REPLACE FUNCTION fn_los_karta RETURN NUMBER AS
    v_id karta_graficzna.id_karty%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_karty
            FROM
                karta_graficzna
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_karta;
/

CREATE TABLE klient (
    id_klient   NUMBER(4) NOT NULL,
    imie        VARCHAR2(30) NOT NULL,
    nazwisko    VARCHAR2(50) NOT NULL,
    email       VARCHAR2(50),
    telefon     VARCHAR2(9)
)
LOGGING;

ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id_klient );

CREATE OR REPLACE FUNCTION fn_los_klient RETURN NUMBER AS
    v_id klient.id_klient%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_klient
            FROM
                klient
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_klient;
/

CREATE OR REPLACE FUNCTION fn_los_komputer RETURN NUMBER AS
    v_id komputer.id_komputer%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_komputer
            FROM
                komputer
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_komputer;
/

CREATE TABLE platnosc (
    id_platnosc       NUMBER(4) NOT NULL,
    forma_platnosci   VARCHAR2(40) NOT NULL
)
LOGGING;

ALTER TABLE platnosc ADD CONSTRAINT platnosc_pk PRIMARY KEY ( id_platnosc );

CREATE OR REPLACE FUNCTION fn_los_platnosc RETURN NUMBER AS
    v_id platnosc.id_platnosc%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_platnosc
            FROM
                platnosc
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_platnosc;
/

CREATE OR REPLACE FUNCTION fn_los_pozycje RETURN NUMBER AS
BEGIN
    RETURN round(dbms_random.value(1, 4));
END fn_los_pozycje;
/

CREATE TABLE procesor (
    id_procesor       NUMBER(4) NOT NULL,
    nazwa_procesora   VARCHAR2(40) NOT NULL,
    id_producent      NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE procesor ADD CONSTRAINT procesor_pk PRIMARY KEY ( id_procesor );

CREATE OR REPLACE FUNCTION fn_los_procesor RETURN NUMBER AS
    v_id procesor.id_procesor%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_procesor
            FROM
                procesor
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_procesor;
/

CREATE TABLE producent (
    id_producent       NUMBER(4) NOT NULL,
    nazwa_producenta   VARCHAR2(40) NOT NULL
)
LOGGING;

ALTER TABLE producent ADD CONSTRAINT producent_pk PRIMARY KEY ( id_producent );

CREATE OR REPLACE FUNCTION fn_los_producent RETURN NUMBER AS
    v_id producent.id_producent%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_producent
            FROM
                producent
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_producent;
/

CREATE TABLE ram (
    id_ram         NUMBER(4) NOT NULL,
    ilosc_ram      NUMBER(3) NOT NULL,
    id_producent   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE ram ADD CONSTRAINT ram_pk PRIMARY KEY ( id_ram );

CREATE OR REPLACE FUNCTION fn_los_ram RETURN NUMBER AS
    v_id ram.id_ram%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_ram
            FROM
                ram
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_ram;
/

CREATE TABLE typ (
    id_typ       NUMBER(4) NOT NULL,
    nazwa_typu   VARCHAR2(40) NOT NULL
)
LOGGING;

ALTER TABLE typ ADD CONSTRAINT typ_pk PRIMARY KEY ( id_typ );

CREATE OR REPLACE FUNCTION fn_los_typ RETURN NUMBER AS
    v_id typ.id_typ%TYPE;
BEGIN
    SELECT
        *
    INTO v_id
    FROM
        (
            SELECT
                id_typ
            FROM
                typ
            ORDER BY
                dbms_random.value
        )
    WHERE
        ROWNUM = 1;

    RETURN v_id;
END fn_los_typ;
/

CREATE TABLE faktura_naglowek (
    id_faktura        NUMBER(4) NOT NULL,
    data_faktury      DATE NOT NULL,
    wartosc_faktury   NUMBER(8, 2) NOT NULL,
    id_platnosc       NUMBER(4) NOT NULL,
    id_klient         NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE faktura_naglowek ADD CONSTRAINT faktura_naglowek_pk PRIMARY KEY ( id_faktura );

CREATE TABLE faktura_pozycja (
    id_pozycja    NUMBER(4) NOT NULL,
    ilosc         NUMBER(4) NOT NULL,
    cena          NUMBER(8, 2) NOT NULL,
    id_faktura    NUMBER(4) NOT NULL,
    id_komputer   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE faktura_pozycja ADD CONSTRAINT faktura_pozycja_pk PRIMARY KEY ( id_pozycja );

CREATE OR REPLACE PROCEDURE PR_DODAJ_FAKTURE AS
V_PLATNOSC NUMBER;
V_KLIENT NUMBER;
V_DATA DATE;
V_ILOSC NUMBER;
V_POZYCJE NUMBER;
V_KOMPUTER NUMBER;
V_CENA NUMBER(8,2);
V_STAN NUMBER;
V_FAKTURA NUMBER;
V_I NUMBER;
BEGIN
    COMMIT;
    V_PLATNOSC:=FN_LOS_PLATNOSC;
    V_KLIENT:=FN_LOS_KLIENT;
    V_DATA:=FN_LOS_DATA;
    V_POZYCJE:=FN_LOS_POZYCJE;
    V_I := 1;
    INSERT INTO FAKTURA_NAGLOWEK(DATA_FAKTURY,WARTOSC_FAKTURY,ID_PLATNOSC,ID_KLIENT) VALUES(V_DATA,0,V_PLATNOSC,V_KLIENT);
    V_FAKTURA:=FN_DAJ_LAST;
    V_FAKTURA:=V_FAKTURA-1;
    FOR V_I IN 1..V_POZYCJE
    LOOP
        V_KOMPUTER:=FN_LOS_KOMPUTER;
        V_ILOSC:=FN_LOS_ILOSC;
        V_CENA:=FN_DAJ_CENE(V_KOMPUTER);
        V_STAN:=FN_DAJ_STAN(V_KOMPUTER);
        IF V_STAN<V_ILOSC
        THEN
            ROLLBACK;
            dbms_output.put_line('Niewystarczajaca ilosc produktow');
            EXIT;
        ELSE
            INSERT INTO FAKTURA_POZYCJA(ILOSC,CENA,ID_FAKTURA,ID_KOMPUTER) VALUES(V_ILOSC,V_CENA,V_FAKTURA,V_KOMPUTER);
        END IF;
    END LOOP;
    COMMIT;
END PR_DODAJ_FAKTURE;
/

create or replace PROCEDURE PR_DODAJ_KOMPUTER (V_NAZWA IN VARCHAR,V_CENA IN FLOAT,V_STAN IN NUMBER)AS
V_TYP NUMBER;
V_KARTA NUMBER;
V_PROCESOR NUMBER;
V_RAM NUMBER;
V_PRODUCENT NUMBER;
BEGIN
V_TYP := FN_LOS_TYP;
V_KARTA := FN_LOS_KARTA;
V_RAM := FN_LOS_RAM;
V_PRODUCENT := FN_LOS_PRODUCENT;
V_PROCESOR := FN_LOS_PROCESOR;

INSERT INTO KOMPUTER(NAZWA,CENA,STAN,ID_TYP,ID_KARTY,ID_PROCESOR,ID_RAM,ID_PRODUCENT) VALUES(V_NAZWA,V_CENA,V_STAN,V_TYP,V_KARTA,V_PROCESOR,V_RAM,V_PRODUCENT);

END PR_DODAJ_KOMPUTER;

/

CREATE OR REPLACE PROCEDURE PR_DODAJ_WIELE_FAKTUR (V_ILOSC IN NUMBER) AS
V_I NUMBER;
BEGIN
V_I:=1;
FOR V_I IN 1..V_ILOSC
LOOP
    PR_DODAJ_FAKTURE;
END LOOP;
END PR_DODAJ_WIELE_FAKTUR;
/

ALTER TABLE faktura_pozycja
    ADD CONSTRAINT faktura_naglowek_fk FOREIGN KEY ( id_faktura )
        REFERENCES faktura_naglowek ( id_faktura )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE komputer
    ADD CONSTRAINT karta_graficzna_fk FOREIGN KEY ( id_karty )
        REFERENCES karta_graficzna ( id_karty )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE faktura_naglowek
    ADD CONSTRAINT klient_fk FOREIGN KEY ( id_klient )
        REFERENCES klient ( id_klient )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE faktura_pozycja
    ADD CONSTRAINT komputer_fk FOREIGN KEY ( id_komputer )
        REFERENCES komputer ( id_komputer )
    NOT DEFERRABLE;

ALTER TABLE faktura_naglowek
    ADD CONSTRAINT platnosc_fk FOREIGN KEY ( id_platnosc )
        REFERENCES platnosc ( id_platnosc )
    NOT DEFERRABLE;

ALTER TABLE komputer
    ADD CONSTRAINT procesor_fk FOREIGN KEY ( id_procesor )
        REFERENCES procesor ( id_procesor )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE komputer
    ADD CONSTRAINT producent_fk FOREIGN KEY ( id_producent )
        REFERENCES producent ( id_producent )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE karta_graficzna
    ADD CONSTRAINT producent_fkv1 FOREIGN KEY ( id_producent )
        REFERENCES producent ( id_producent )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE procesor
    ADD CONSTRAINT producent_fkv2 FOREIGN KEY ( id_producent )
        REFERENCES producent ( id_producent )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE ram
    ADD CONSTRAINT producent_fkv4 FOREIGN KEY ( id_producent )
        REFERENCES producent ( id_producent )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE komputer
    ADD CONSTRAINT ram_fk FOREIGN KEY ( id_ram )
        REFERENCES ram ( id_ram )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE komputer
    ADD CONSTRAINT typ_fk FOREIGN KEY ( id_typ )
        REFERENCES typ ( id_typ )
            ON DELETE CASCADE
    NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER TR_INS_FAKTURA_NAGLOWEK 
    BEFORE INSERT ON FAKTURA_NAGLOWEK 
    FOR EACH ROW 
begin
	:NEW.ID_FAKTURA:=SEQ_FAKTURA_NAGLOWEK.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_FAKTURA_POZYCJA 
    BEFORE INSERT ON FAKTURA_POZYCJA 
    FOR EACH ROW 
DECLARE
    V_ilosc number;
begin
        :NEW.ID_POZYCJA:=SEQ_FAKTURA_POZYCJA.nextval;

        select CENA*:NEW.ILOSC into :NEW.CENA
        from komputer
        where komputer.id_komputer = :NEW.id_komputer;

        update komputer
        set stan=stan-:NEW.ilosc
        where komputer.id_komputer = :NEW.id_komputer;

        update faktura_naglowek
        set wartosc_faktury = wartosc_faktury + :NEW.cena
        where faktura_naglowek.id_faktura = :NEW.id_faktura;

end; 
/

CREATE OR REPLACE TRIGGER TR_INS_KARTA_GRAFICZNA 
    BEFORE INSERT ON KARTA_GRAFICZNA 
    FOR EACH ROW 
begin
:NEW.ID_KARTY:=SEQ_KARTA_GRAFICZNA.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_KLIENT 
    BEFORE INSERT ON KLIENT 
    FOR EACH ROW 
begin
:NEW.ID_KLIENT:=SEQ_KLIENT.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_KOMPUTER 
    BEFORE INSERT ON KOMPUTER 
    FOR EACH ROW 
begin
:NEW.ID_KOMPUTER:=SEQ_KOMPUTER.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_PLATNOSC 
    BEFORE INSERT ON PLATNOSC 
    FOR EACH ROW 
begin
:NEW.ID_PLATNOSC:=SEQ_PLATNOSC.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_PROCESOR 
    BEFORE INSERT ON PROCESOR 
    FOR EACH ROW 
begin
:NEW.ID_PROCESOR:=SEQ_PROCESOR.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_PRODUCENT 
    BEFORE INSERT ON PRODUCENT 
    FOR EACH ROW 
begin
:NEW.ID_PRODUCENT:=SEQ_PRODUCENT.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_RAM 
    BEFORE INSERT ON RAM 
    FOR EACH ROW 
begin
:NEW.ID_RAM:=SEQ_RAM.nextval;
end; 
/

CREATE OR REPLACE TRIGGER TR_INS_TYP 
    BEFORE INSERT ON TYP 
    FOR EACH ROW 
begin
:NEW.ID_TYP:=SEQ_TYP.nextval;
end; 
/
CREATE OR REPLACE VIEW KOMPUTERY_ZYSK AS
SELECT NAZWA_PRODUCENTA||' '||NAZWA AS "Komputer",NAZWA_PROCESORA AS "Procesor",NAZWA_KARTY AS "Karta Graficzna",RAM.ILOSC_RAM||' GB' AS "RAM",SUM(FAKTURA_POZYCJA.ILOSC) AS "Ilosc sprzedanych",SUM(FAKTURA_POZYCJA.CENA) AS "Zysk_calkowity"
FROM KOMPUTER
INNER JOIN PRODUCENT ON PRODUCENT.ID_PRODUCENT = KOMPUTER.ID_PRODUCENT
INNER JOIN FAKTURA_POZYCJA ON FAKTURA_POZYCJA.ID_KOMPUTER=KOMPUTER.ID_KOMPUTER
INNER JOIN PROCESOR ON PROCESOR.ID_PROCESOR=KOMPUTER.ID_PROCESOR
INNER JOIN KARTA_GRAFICZNA ON KARTA_GRAFICZNA.ID_KARTY=KOMPUTER.ID_KARTY
INNER JOIN RAM ON RAM.ID_RAM=KOMPUTER.ID_RAM
GROUP BY NAZWA_PRODUCENTA||' '||NAZWA,NAZWA_PROCESORA,NAZWA_KARTY,ILOSC_RAM
ORDER BY "Zysk_calkowity" DESC;
/
CREATE OR REPLACE VIEW OSTATNI_MIESIAC AS
SELECT *
FROM FAKTURA_NAGLOWEK
WHERE DATA_FAKTURY BETWEEN SYSDATE - 30 AND SYSDATE
ORDER BY DATA_FAKTURY;
/
CREATE OR REPLACE VIEW TOP20_KLIENTOW AS
SELECT IMIE AS "Imie",NAZWISKO AS "Nazwisko",COUNT(*) AS "Ilosc zamowien",SUM(WARTOSC_FAKTURY) AS "Wydatki"
FROM KLIENT
INNER JOIN FAKTURA_NAGLOWEK ON FAKTURA_NAGLOWEK.ID_KLIENT = KLIENT.ID_KLIENT
WHERE ROWNUM <= 20
GROUP BY IMIE,NAZWISKO
ORDER BY "Wydatki" DESC;
/
COMMIT;