CLASS zcl_08_main_vehicle DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_08_main_vehicle IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration
    DATA vehicle  TYPE REF TO ZCL_08_vehicle.
    DATA vehicles TYPE TABLE OF REF TO ZCL_08_vehicle.
    DATA truck    TYPE REF TO Zcl_08_truck. " Variable typ Truck, damit Downcast möglich

    " Instanzierung
    vehicle = NEW ZCL_08_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ). " Aufruf von Konstruktur/Upcast
*    vehicle->set_make( 'Porsche' ).
*    vehicle->set_model( '911' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    vehicle = NEW ZCL_08_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 20 ). " Upcast
*    vehicle->set_make( 'MAN' ).
*    vehicle->set_model( 'TGX' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    vehicle = NEW ZCL_08_car( make  = 'VW'
                              model = 'Kombi'
                              seats = 9 ). " Upcast
*    vehicle->set_make( 'VW' ).
*    vehicle->set_model( 'Kombi' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    out->write( | | ).

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 20 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_08_valuetoohigh INTO DATA(x).
          " handle exception
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF ZCL_08_truck.
        " truck = vehicle. geht nicht so einfach, weil vehicle kann auch car sein
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X' THEN 'LKW ist Autobot' ELSE 'LKW ist LKW' ) }| ).
      ENDIF.
*      out->write( |{ vehicle->make } { vehicle->model } { vehicle->speed_in_kmh }| ).
      out->write( vehicle->to_string( ) ). "(Dynamische) Polymorphie in Java gibt's au Statische siehe Sysoutln (10 versch.)

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
