CLASS zcl_08_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE Z08_Decimal
                operand2      TYPE Z08_Decimal

      RETURNING VALUE(result) TYPE Z08_decimal
      RAISING   cx_sy_zerodivide.

**********************************************************************
    CLASS-METHODS calculate_percentage
      IMPORTING
                percentage    TYPE Z08_Decimal
                base          TYPE Z08_Decimal
      RETURNING VALUE(result) TYPE Z08_decimal.

**********************************************************************

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_calculator IMPLEMENTATION.
  METHOD divide.
    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.


    result = operand1 / operand2.
*    RETURN operand1 / operand2. " ist seit neuestem möglich, aber nicht gern gesehen von Daniel
  ENDMETHOD.


**********************************************************************


  METHOD calculate_percentage.
    result = percentage / 100 * base.

  ENDMETHOD.






ENDCLASS.
