CLASS zcl_08_abap_cds_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z08_customerkpis( p_city = 'Karlsruhe' )
      FIELDS *
      ORDER BY TotalRevenue DESCENDING
      INTO TABLE @DATA(customer).

    out->write( customer ).
  ENDMETHOD.
ENDCLASS.
