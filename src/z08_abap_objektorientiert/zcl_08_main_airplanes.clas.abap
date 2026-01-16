CLASS zcl_08_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " ---------------------------------------------------------------------
    " Deklaration
    DATA airplane  TYPE REF TO ZCL_08_airplane.
*    DATA airplanes TYPE TABLE OF REF TO ZCL_08_airplane.


    " ---------------------------------------------------------------------
    " Instanzierung
    out->write( |Anzahl erzeugte Flugzeuge: { ZCL_08_airplane=>number_of_airplanes }| ).

    DATA carrier TYPE REF TO ZCL_08_carrier.
    carrier = NEW #( name = 'Lufthansa' ).



    " D-ABUK, Airbus A380-800, 277t
    TRY.
        airplane = NEW ZCL_08_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 250 ).

        carrier->add_airplane( airplane ).

*        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    " ---------------------------------------------------------------------
    " D-AIND, Airbus A320-200, 42t
    TRY.
        airplane = NEW ZCL_08_cargo_plane( id                   = 'D-AIND'
                                           plane_type           = 'Airbus A320-200'
                                           empty_weight_in_tons = 200
                                           cargo_in_tons        = 150 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    out->write( |Anzahl erzeugte Flugzeuge: { ZCL_08_airplane=>number_of_airplanes }| ).

    " ---------------------------------------------------------------------
    " D-AJKF, Boeing 747-400F, 166t
    TRY.
        airplane = NEW ZCL_08_passenger_plane( id                   = 'D-AJKF'
                                               plane_type           = 'Boeing 747-400F'
                                               empty_weight_in_tons = 200
                                               number_of_seats      = 150 ).

        carrier->add_airplane( airplane ).
        out->write( |Anzahl erzeugte Flugzeuge: { ZCL_08_airplane=>number_of_airplanes }| ).

        out->write( | | ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    " ---------------------------------------------------------------------
    " ---------------------------------------------------------------------

    " Ausgabe
    LOOP AT carrier->airplanes INTO airplane.
      out->write(
          |ID: { airplane->id }  Planetype: { airplane->plane_type } Empty weight: { airplane->empty_weight_in_tons }t Total weight: { airplane->get_total_weight_in_tons( ) }t| ).
    ENDLOOP.


    out->write( carrier ).
    out->write( carrier->get_biggest_cargo_plane( ) ).

  ENDMETHOD.
ENDCLASS.
