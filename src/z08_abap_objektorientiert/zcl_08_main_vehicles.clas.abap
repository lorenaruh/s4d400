CLASS zcl_08_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA vehicle  TYPE REF TO zcl_08_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_08_vehicle.
    DATA truck    TYPE REF TO zcl_08_truck.

    DATA rental   TYPE REF TO zcl_08_rental.
    DATA carrier  TYPE REF TO ZCL_08_carrier.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA partners TYPE TABLE OF REF TO ZIF_08_partner.

    " Instanzierung
    vehicle = NEW zcl_08_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_08_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ). " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_08_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.

    out->write( zcl_08_vehicle=>number_of_vehicles ).

    rental = NEW #( ).
    carrier = NEW #( 'Lufthansa' ).

    APPEND rental TO partners. " Upcast
    APPEND carrier TO partners. " Upcast

    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 10 ).
          vehicle->accelerate( 30 ).
        CATCH zcx_08_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_08_truck.
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
        out->write(
            |{ COND #( WHEN truck->is_transformed = 'X' THEN 'Truck hat sich transformed' ELSE 'Zurück zum LKW' ) }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " (Dynamische) Polymorphie
    ENDLOOP.

    LOOP at partners into data(partner).
    out->write( partner->to_string(  ) ).

    if partner is INSTANCE of ZCL_08_carrier.
      carrier = CAST #( partner ).
      out->write( carrier->get_biggest_cargo_plane( ) ).
    endif.

    endloop.

  ENDMETHOD.
ENDCLASS.
