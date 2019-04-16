# README

# Założenia
Opracowanie projektu, na który skłąda się implementacja w środowisku Oracle modelu relacyjnej bazy danych, oprogramowanie realizujące proces automatycznego generowania danych wejściowych oraz prezentujące wyniki w postaci analitycznej.

# Opis uruchomienia
Aby utworzyć oprawnie bazę danych należy w środowisku ORacle SQL Developer uruchomić w odpowiedniej kolejności:

1. CREATE.dll - skrypt zawiera komendy które tworzą tabele, kucze, zależności między tabelami oraz obiekty takie jak sekwencje, procedury, wyzwalacze oraz funkcje. Skrypt tworzy także trzy przykładowe widoki.

2. INSERT_AND_GENERATE.sql - Skrypt wprowadza do utworzonych wcześniej tabel przykładowe dane oraz za pomocą wcześniej utworzonego generatora danych generuje przykładowe obiekty tabeli KOMPUTER oraz 150 przykładowych, wielopozycyjnych faktur.

Po podjęciu powyższych kroków, projekt jest zaimplementowany i wypełniony przykładowymi danymi. W razie potrzeby usunięcia całego projektu należy uruchomić skrypt DROP.sql zawierający polecenia sprzątające po projekcie.

Więcej informacji na temat szzegółowego działania projektu i generatora danych znajduje się w pliku Dokumentacja.pdf
