CLASS zcl_08_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo_10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from Z08_Demo08
  fields CarrierId, ConnectionId, \_Carrier-name
  into table @Data(connections).

  out->write( connections ).

  ENDMETHOD.
ENDCLASS.
