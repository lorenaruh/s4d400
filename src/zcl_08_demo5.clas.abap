CLASS zcl_08_demo5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo5 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(result) = ZCL_08_calculator=>divide( operand1 = 5 operand2 = 0 ).

        out->write( result ).
      CATCH cx_sy_zerodivide INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    DATA(result2) = ZCL_08_calculator=>calculate_percentage( percentage = 15 base = 10 ).
    out->write( result2 ).

  ENDMETHOD.
ENDCLASS.
