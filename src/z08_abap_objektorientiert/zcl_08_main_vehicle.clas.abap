CLASS zcl_08_main_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_main_vehicle IMPLEMENTATION.




  METHOD if_oo_adt_classrun~main.


    "Deklaration
    DATA vehicle TYPE REF TO ZCL_08_vehicle.
    DATA vehicles TYPE TABLE OF REF TO ZCL_08_vehicle.

    "Instanzierung
    vehicle = NEW #( make = 'Porsche' model = '911' ). "Aufruf von Konstruktur
*    vehicle->set_make( 'Porsche' ).
*    vehicle->set_model( '911' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    vehicle = NEW #( make = 'MAN' model = 'TGX' ).
*    vehicle->set_make( 'MAN' ).
*    vehicle->set_model( 'TGX' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    vehicle = NEW #( make = 'VW' model = 'Kombi' ).
*    vehicle->set_make( 'VW' ).
*    vehicle->set_model( 'Kombi' ).
    APPEND vehicle TO vehicles.
    out->write( |Gesamt Anzahl Autos: { vehicle->NUMBER_OF_vehicels }| ).

    out->write( | | ).

    "Ausgabe
    LOOP AT vehicles INTO vehicle.
    TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 20 ).
        vehicle->accelerate( 300 ).
      CATCH zcx_08_valuetoohigh into data(x).
        "handle exception
        out->write( x->get_text( ) ).
    ENDTRY.
      out->write( |{ vehicle->make } { vehicle->model } { vehicle->speed_in_kmh }| ).
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
