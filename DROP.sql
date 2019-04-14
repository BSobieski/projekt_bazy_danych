DROP TABLE FAKTURA_NAGLOWEK CASCADE CONSTRAINTS ;

DROP TABLE FAKTURA_POZYCJA CASCADE CONSTRAINTS ;

DROP TABLE KARTA_GRAFICZNA CASCADE CONSTRAINTS ;

DROP TABLE KLIENT CASCADE CONSTRAINTS ;

DROP TABLE KOMPUTER CASCADE CONSTRAINTS ;

DROP TABLE PLATNOSC CASCADE CONSTRAINTS ;

DROP TABLE PROCESOR CASCADE CONSTRAINTS ;

DROP TABLE PRODUCENT CASCADE CONSTRAINTS ;

DROP TABLE RAM CASCADE CONSTRAINTS ;

DROP TABLE TYP CASCADE CONSTRAINTS ;

DROP SEQUENCE SEQ_FAKTURA_NAGLOWEK ;

DROP SEQUENCE SEQ_FAKTURA_POZYCJA ;

DROP SEQUENCE SEQ_KARTA_GRAFICZNA ;

DROP SEQUENCE SEQ_KLIENT ;

DROP SEQUENCE SEQ_KOMPUTER ;

DROP SEQUENCE SEQ_PLATNOSC ;

DROP SEQUENCE SEQ_PROCESOR ;

DROP SEQUENCE SEQ_PRODUCENT ;

DROP SEQUENCE SEQ_RAM ;

DROP SEQUENCE SEQ_TYP ;

DROP FUNCTION FN_LOS_KLIENT;

DROP FUNCTION FN_LOS_PLATNOSC;

DROP FUNCTION FN_LOS_POZYCJE;

DROP FUNCTION FN_LOS_KOMPUTER;

DROP FUNCTION FN_DAJ_STAN;

DROP FUNCTION FN_DAJ_CENE;

DROP FUNCTION FN_LOS_ILOSC;

DROP FUNCTION FN_LOS_TYP;

DROP FUNCTION FN_LOS_PROCESOR;

DROP FUNCTION FN_LOS_KARTA;

DROP FUNCTION FN_LOS_RAM;

DROP FUNCTION FN_LOS_PRODUCENT;

DROP FUNCTION FN_LOS_DATA;

DROP FUNCTION FN_DAJ_LAST;

DROP PROCEDURE PR_DODAJ_KOMPUTER;

DROP PROCEDURE PR_DODAJ_FAKTURE;

DROP PROCEDURE PR_DODAJ_WIELE_FAKTUR;

DROP VIEW KOMPUTERY_ZYSK;

DROP VIEW OSTATNI_MIESIAC;

DROP VIEW TOP20_KLIENTOW;

COMMIT;