CLASS zcl_08_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA customer type Z08_customer_info.
        customer = zcl_abap_helper=>get_customer( customer_id = '123456' ).
        out->write( |Customer_ID: | && customer-customer_id ).
        out->write( |Name: | && customer-first_name && | | && customer-last_name ).
        out->write( |City: | && customer-city ).
        out->write( |Country: | && customer-country_code ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text(  ) ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
