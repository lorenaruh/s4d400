CLASS zcl_08_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA kundenummer TYPE /dmo/customer_id VALUE '123459'.
    DATA first_name TYPE /dmo/first_name VALUE 'Lorena'.
    DATA last_name TYPE /dmo/last_name VALUE 'Ruh'.
    DATA city TYPE /dmo/city VALUE 'Ottersweier'.
    DATA country TYPE land1 VALUE 'DEU'.

    out->write( condense( |{ kundenummer }, { first_name } { last_name }, { city } ({ country })| ) ).


   ENDMETHOD.
ENDCLASS.
