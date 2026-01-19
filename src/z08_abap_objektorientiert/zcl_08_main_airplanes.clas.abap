CLASS zcl_08_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_08_airplane.

    DATA carrier type ref to ZCL_08_carrier.
    carrier = new #( name = 'Lufthansa' ).

    out->write( zcl_08_airplane=>number_of_airplanes ).

    " D-ABUK, Airbus A380-800, 277t, 100 Seats
    TRY.
        airplane = NEW zcl_08_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 100 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    " D-AIND, Airbus A320-200, 42t, 200t Cargo
    TRY.
        airplane = NEW zcl_08_cargo_plane( id                   = 'D-AIND'
                                           plane_type           = 'Airbus A320-200'
                                           empty_weight_in_tons = 42
                                           cargo_in_tons        = 200 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    " D-AJKF, Boeing 747-400F, 166t, 150 Seats
    TRY.
        airplane = NEW zcl_08_passenger_plane( id                   = 'D-AJKF'
                                               plane_type           = 'Boeing 747-400F'
                                               empty_weight_in_tons = 166
                                               number_of_seats      = 150 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    out->write( zcl_08_airplane=>number_of_airplanes ).

    LOOP AT carrier->airplanes INTO airplane.
      out->write(
          |{ airplane->id }, { airplane->plane_type }, { airplane->empty_weight_in_tons }t (Total weight: { airplane->get_total_weight_in_tons( ) }t)| ).
    ENDLOOP.

    "out->write( carrier ).
    out->write( carrier->get_biggest_cargo_plane(  ) ).




  ENDMETHOD.
ENDCLASS.
