CLASS zcl_08_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES ZIF_08_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_08_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO ZCL_08_vehicle.
ENDCLASS.


CLASS zcl_08_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_08_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.
ENDCLASS.
