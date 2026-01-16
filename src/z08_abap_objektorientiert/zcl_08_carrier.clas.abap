CLASS zcl_08_carrier DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE Z08_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING name TYPE string.


    METHODS add_airplane
      IMPORTING airplane type REF TO ZCL_08_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO ZCL_08_cargo_plane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.


  METHOD get_biggest_cargo_plane.
    "Deklaration
    data biggest_cargo TYPE i VALUE 0.
*    data airplane type ref to ZCL_08_airplane.
*    data cargo_plane type ref to ZCL_08_cargo_plane.

    "Schleife
    LOOP AT airplanes INTO data(airplane).
      IF airplane IS INSTANCE OF ZCL_08_cargo_plane and airplane->get_total_weight_in_tons( ) > biggest_cargo.
*        IF cargo_plane->get_total_weight_in_tons( ) > airplane->get_total_weight_in_tons(  ).
          biggest_cargo = biggest_cargo_plane->get_total_weight_in_tons( ).
          biggest_cargo_plane = cast #( airplane ).
*        ENDIF.
      ENDIF.
      ENDLOOP.
        ENDMETHOD.

ENDCLASS.
