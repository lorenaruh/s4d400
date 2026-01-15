CLASS zcl_08_airplane DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
*    METHODS get_id                   RETURNING VALUE(id)                   TYPE string.
*
*    METHODS set_id                   IMPORTING i_id                        TYPE string.
*
*    METHODS get_plane_type           RETURNING VALUE(plane_type)           TYPE string.
*
*    METHODS set_plane_type           IMPORTING i_plane_type                TYPE string.
*
*    METHODS get_empty_weight_in_tons RETURNING VALUE(empty_weight_in_tons) TYPE i.

*    METHODS set_empty_weight_in_tons IMPORTING i_empty_weight_in_tons      TYPE i.

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    " Deklaration privat Attribute
    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    " ---------------------------------------------------------------------
ENDCLASS.


CLASS zcl_08_airplane IMPLEMENTATION.
  METHOD constructor.
    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'id' ).
    ENDIF.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'plane_type' ).
    ENDIF.

    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'empty_weight_in_tons' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_airplanes += 1.
  ENDMETHOD.
ENDCLASS.
