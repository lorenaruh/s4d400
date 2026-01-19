CLASS zcl_08_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING model TYPE string
                make  TYPE string
                seats TYPE i.

    methods to_string redefinition.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_08_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).

    me->seats = seats.

  ENDMETHOD.
  method to_string.
  string = |{ make } { model } ({ speed_in_kmh }km/h, { seats } Sitzplätze)|.
  endmethod.
ENDCLASS.
