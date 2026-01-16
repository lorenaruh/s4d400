CLASS zcl_08_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data seats type i.

    METHODS constructor
      IMPORTING
        make TYPE string
        model TYPE string
        seats type i.

    methods to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_car IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).
    me->seats = seats.

  ENDMETHOD.

    method to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h, { seats } Sitze)|.
    ENDMETHOD.


ENDCLASS.
