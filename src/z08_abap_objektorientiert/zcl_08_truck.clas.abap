CLASS zcl_08_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_vehicle

  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA cargo_in_tons type i READ-ONLY.
  DATA is_transformed TYPE c length 1 READ-only.

  methods constructor
  importing
  make type string
  model type string
  cargo_in_tons TYPE i.

  methods transform.

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
    string = |{ make } { model } ({ speed_in_kmh }km/h), Frachkapazität: { cargo_in_tons }t|.
  ENDMETHOD.

  METHOD transform.
    if is_transformed = 'X'. "if is_transformed = abap_true.
    is_transformed = ''.
    else.
    is_transformed = 'X'.
    endif.

  ENDMETHOD.

ENDCLASS.
