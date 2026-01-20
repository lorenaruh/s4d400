CLASS zcl_08_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  select from Z08_CustomerWithTravels
  fields CustomerId, FirstName, LastName, Title, Street, PostalCode, City, \_Travels-begin_date
  into table @Data(customer).

  out->write( customer ).

  ENDMETHOD.
ENDCLASS.
