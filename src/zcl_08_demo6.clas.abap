CLASS zcl_08_demo6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo6 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE z08_connection.
    DATA flight TYPE Z08_flight.
    DATA flight_with_connection TYPE Z08_flight_with_connection.


    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.


    flight-carrier_id = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date = '20260113'.

    flight_with_connection = corresponding #( flight ). "Corresponding kopiert gleich-namige "Spalten"
                                         " # steht für Z08_flight_with_connection, kann sich ABAP selber "denken"
    flight_with_connection = corresponding #( base ( flight_with_connection ) connection ). "base kopiert auf Basis von flight_with_connection
*    flight_with_connection = flight.
*    flight_with_connection-airport_from_id = connection-airport_from_id.
*    flight_with_connection-airport_to_id = connection-airport_to_id.

    out->write( flight_with_connection ).

  ENDMETHOD.
ENDCLASS.
