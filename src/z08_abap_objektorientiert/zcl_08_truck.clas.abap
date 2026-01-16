CLASS zcl_08_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_08_vehicle
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA cargo_in_tons type i READ-ONLY.
  data is_transformed type c length 1 READ-ONLY.

    METHODS constructor
    importing
    make type string
    model type string
    cargo_in_tons type i.

    methods to_string REDEFINITION.

    METHODS transform.

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

  METHOD transform.
    if is_transformed = 'X'. " if is_transformed abap_true
    is_transformed = ''. "if is transformed abap_false
    else.
    is_transformed = 'X'.
    endif.

  ENDMETHOD.

ENDCLASS.
