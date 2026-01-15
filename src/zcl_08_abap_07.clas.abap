CLASS zcl_08_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA travel_table TYPE Z08_travels.

    TRY.
        travel_table = zcl_abap_helper=>get_travels( '124' ).
      CATCH zcx_abap_no_data.
        "handle exception
        out->write( 'No Data available' ).

    ENDTRY.

**********************************************************************
*Änderungen

    "Vergangenheit löschen
    DELETE travel_table WHERE begin_date < cl_abap_context_info=>get_system_date( ).

    "Buchungsgebühr anpassen
    DATA travel TYPE REF TO /dmo/travel. "erzeugt Referenz auf Struktur
    LOOP AT travel_table REFERENCE INTO travel.
      travel->booking_fee = travel->booking_fee * '1.1'.
    ENDLOOP.

    "Sortieren
    SORT travel_table by description DESCENDING.



**********************************************************************
*Ausgabe
      out->write( travel_table ).
    out->write( cl_abap_context_info=>get_system_date( ) ).








  ENDMETHOD.
ENDCLASS.
