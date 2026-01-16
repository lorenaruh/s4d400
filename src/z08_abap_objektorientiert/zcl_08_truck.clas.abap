CLASS zcl_08_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_vehicle
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA cargo_in_tons type i READ-ONLY.
    METHODS constructor
    importing
    make type string
    model type string
    cargo_in_tons type i.

    methods to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make = make model = model ).
    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ).
     string &&= |, Cargo: { cargo_in_tons }t|.
  ENDMETHOD.

ENDCLASS.
