CLASS zcl_08_vehicle DEFINITION
  PUBLIC
*  FINAL "Auskommentiet, damit Vererbung möglich
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.

    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

*    METHODS get_make         RETURNING VALUE(make) TYPE string.
*    METHODS get_model        RETURNING VALUE(model) TYPE string.

methods to_string RETURNING VALUE(string) type string.

    METHODS accelerate IMPORTING !value TYPE i
                       RAISING   zcx_08_valuetoohigh.

    METHODS brake IMPORTING !value TYPE i
                  RAISING   zcx_08_valuetoohigh.



    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA NUMBER_OF_vehicels TYPE i READ-ONLY.
    PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_08_vehicle IMPLEMENTATION.
  METHOD class_constructor.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.
    NUMBER_OF_vehicels += 1.
  ENDMETHOD.

   method to_string.
   string = |{ make } { model } ({ speed_in_kmh } km/h)|.
   ENDMETHOD.

  METHOD accelerate.
    IF value + value > 300.
      RAISE EXCEPTION NEW zcx_08_valuetoohigh( value = value ).
    ENDIF.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_08_valuetoohigh( value = value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.
ENDCLASS.
