CLASS zcl_08_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA operant1 TYPE Z08_Decimal VALUE '2'.
    DATA operant2 TYPE Z08_Decimal VALUE '3'.
    DATA result TYPE Z08_Decimal.
    DATA operator TYPE c LENGTH 1 VALUE '!'.

    CASE operator.
      WHEN '+'.
        result = operant1 + operant2.
      WHEN '-'.
        result = operant1 - operant2.
      WHEN '*'.
        result = operant1 * operant2.
      WHEN '/'.
        result = operant1 / operant2.
      WHEN '%'.
        result = ZCL_08_calculator=>calculate_percentage( percentage = operant1
                                                          base = operant2 ).
      WHEN ''.
        result = ZCL_abap_calculator=>calculate_power( base = ( operant1 ) exponent = conv #( operant2 ) ).
      WHEN OTHERS.
        out->write( 'Invalid Operator' ).
    ENDCASE.

    out->write( |Das Ergebnis von { operant1 NUMBER = USER } { operator } { operant2 NUMBER = USER } = { result NUMBER = USER } | ).




  ENDMETHOD.
ENDCLASS.
