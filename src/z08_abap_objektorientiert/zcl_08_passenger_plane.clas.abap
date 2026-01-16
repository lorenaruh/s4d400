CLASS zcl_08_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_airplane
*  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    " Deklaration
    DATA number_of_seats TYPE i READ-ONLY.
**********************************************************************

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                number_of_seats      TYPE i
      RAISING   zcx_abap_initial_parameter.
**********************************************************************

    METHODS get_total_weight_in_tons REDEFINITION.

**********************************************************************

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.
**********************************************************************
**********************************************************************


CLASS zcl_08_passenger_plane IMPLEMENTATION.
**********************************************************************
  METHOD constructor.
    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

**********************************************************************
  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

**********************************************************************
  METHOD get_total_weight_in_tons.
    total_weight_in_tons = super->get_total_weight_in_tons( ).
    total_weight_in_tons += number_of_seats * '0.08'.
  ENDMETHOD.
ENDCLASS.
