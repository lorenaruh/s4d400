CLASS zcl_08_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate FINAL IMPORTING !value TYPE i
                       RAISING   zcx_08_value_too_high.

    METHODS brake FINAL IMPORTING !value TYPE i
                  RAISING   zcx_08_value_too_high.

    METHODS to_string abstract RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_08_vehicle IMPLEMENTATION.
  METHOD accelerate.
    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_08_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_08_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.
**********************************************************************

ENDCLASS.
