CLASS zcl_08_demo3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo3 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Einfache verzweigungen
    DATA age        TYPE i.
    DATA gender     TYPE c LENGTH 1.
    DATA first_name TYPE c LENGTH 40.
    DATA last_name  TYPE c LENGTH 40.

    " ---------------------------------------------------------------------
    " Vergleichs Operatoren: <, >, <=, >=, <>
    " Logische Operatoren: and, or, not
    "  + is (not) Initial
    " ---------------------------------------------------------------------
    age = 17.
    gender = 'M'.
    first_name = 'Hugo'.
    last_name = 'Müller'.

    " ---------------------------------------------------------------------
    age = 19.
    gender = 'M'.
    first_name = 'Hugo'.
    last_name = 'Müller'.

    IF age < 18.
      out->write( |Hallo { first_name }| ).

    ELSEIF gender = 'M' OR gender = 'm'.
      out->write( |Guten Tag Herr { first_name } { last_name }| ).

    ELSEIF gender = 'w' OR gender = 'W'.
      out->write( |Guten Tag Frau { first_name } { last_name }| ).

    ELSE.
      out->write( |Guten Tag { first_name } { last_name }| ).

    ENDIF.

    " ---------------------------------------------------------------------
    out->write( |Hallo { COND #( WHEN age < 18                     THEN first_name
                                 WHEN gender = 'M' OR gender = 'm' THEN |Herr { last_name }|
                                 WHEN gender = 'w' OR gender = 'W' THEN |Frau { first_name }|
                                 ELSE                                   |{ first_name } { last_name }| ) }| ).

    " ---------------------------------------------------------------------
    " Prüfung auf Initial-Wert

    IF age IS INITIAL.
      out->write( |kein Alter angegeben| ).
    ENDIF.

    " ---------------------------------------------------------------------
    " Fallunterscheidungen (switch cases)

    CASE gender.
      WHEN 'w' OR 'W'.
        out->write( |Guten Tag Frau { last_name }| ).
      WHEN 'm' OR 'M'.
        out->write( |Guten Tag Herr { last_name }| ).
      WHEN OTHERS.
        out->write( |Guten Tag { first_name } { last_name }| ).
    ENDCASE.

    out->write( |Hallo { SWITCH #( gender
                                   WHEN 'm' OR 'M' THEN |Herr { last_name }|
                                   WHEN 'w' OR 'W' THEN |Frau { last_name }|
                                   ELSE                 last_name ) }| ).
**********************************************************************
*Schleifen (werden in Realität nicht mehr genutzt)

*while-Schleife
    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

*do n times-Schleife
    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

*Endlosschleife
    DO.
      out->write( sy-index ).
      IF sy-index = 10.
        EXIT.
      ENDIF.
    ENDDO.


  ENDMETHOD.
ENDCLASS.
