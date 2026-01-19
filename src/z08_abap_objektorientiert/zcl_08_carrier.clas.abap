CLASS zcl_08_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  INTERFACES ZIF_08_partner.

    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z08_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO ZCL_08_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO ZCL_08_cargo_plane.
ENDCLASS.


CLASS zcl_08_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF ZCL_08_cargo_plane AND airplane->get_total_weight_in_tons( ) > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).

      ENDIF.
    ENDLOOP.
  ENDMETHOD.
  METHOD zif_08_partner~to_string.
    string = 'Ich bin eine Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
