CLASS zcl_08_cargo_plane DEFINITION
  PUBLIC
*FINAL "Auskommentiert, damit "Open Closed" erfüllt
  INHERITING FROM zcl_08_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    "Deklaration
    DATA cargo_in_tons TYPE i READ-ONLY.

**********************************************************************
    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                cargo_in_tons        TYPE i
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


CLASS zcl_08_cargo_plane IMPLEMENTATION.
**********************************************************************
  METHOD constructor.
    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.
**********************************************************************
  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
**********************************************************************

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = super->get_total_weight_in_tons( empty_weight_in_tons = empty_weight_in_tons ).
    total_weight_in_tons += cargo_in_tons.
  ENDMETHOD.
**********************************************************************
ENDCLASS.
