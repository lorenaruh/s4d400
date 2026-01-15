CLASS zcl_08_hello_world_and DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_hello_world_and IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
*Hello World
**********************************************************************
    DATA text TYPE string. "Deklaration
    text = 'Hello world!'. "Wertzuweisung

* Ausgabe
    out->write( text ).


**********************************************************************
*Datentypen und Datenobjekte
**********************************************************************
    DATA age TYPE i. "Ganze Zahlen
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2. "Fest-Kommazahl p für packaged number, length in byte
    DATA first_name TYPE c LENGTH 40. "Zeichenketten fester Länge
    DATA matriculation_number TYPE n LENGTH 7. "Ziffernfolgen
    DATA xmas TYPE d. "Datumsangaben
    DATA noon TYPE t. "Zeitangaben
    DATA flag. "Kennzeichen "boolean"

    DATA carrier_id TYPE c LENGTH 3. "ABAP Standarttyp
    DATA carrier_id2 TYPE /dmo/carrier_id. "schöner Option "Datenelement

**********************************************************************
*Wertzuweisungen
**********************************************************************

* Initialisierung
    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Lorena'.
    matriculation_number = '640392'.
    xmas = '20261225'. "YYYYMMDD (Year, Month, Day)
    noon = '120000'. "HHMMSS (Hour, Minutes, Seconds)
    flag = 'X'.
    flag = ''.
    flag = ' '.
    CLEAR flag.


* Statische Vorbelegung
    DATA last_name TYPE c LENGTH 40 VALUE 'Ruh'.

*Inlinedeklaration
    DATA(size_in_cm) = 179. "erstmal nicht so benutzen, bei inline deklaration dürfen keine Leerzeichen sein






  ENDMETHOD.
ENDCLASS.
