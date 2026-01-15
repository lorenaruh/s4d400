CLASS zcl_08_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Hello Bruce...
    DATA text TYPE string.
    DATA first_name TYPE c LENGTH 40.
    DATA last_name TYPE c LENGTH 40.
    first_name = 'Bruce'.
    last_name = 'Wayne'.
    text = 'Hello' && | |  && first_name && | | && last_name && ', how are you?'.
    out->write( text ).

  ENDMETHOD.
ENDCLASS.
