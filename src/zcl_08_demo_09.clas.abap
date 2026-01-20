CLASS zcl_08_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from Z00_Demo07( p_carrierid = 'LH' ) ", p_deadline = @sy-datum ) kann man dazu machen, muss aber nicht
  fields *
*  where CarrierId = 'LH'
  into table @Data(flights).

  out->write( flights ).

  ENDMETHOD.
ENDCLASS.
