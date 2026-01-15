CLASS zcl_08_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Deklaration interner Tabellen
    DATA connections TYPE Z08_connections. " Type [Tabellentyp]
    DATA connections2 TYPE TABLE OF Z08_connection. " Type table of [Strukturtyp]
    DATA connection TYPE Z08_connection.

    " Hinzufügen von Datensätzen
    connections = VALUE #(
    ( carrier_id = 'LH' connection_id = '0400' )
    ( carrier_id = 'UA' airport_from_id = 'FRA' )
    ( connection_id = '0401' airport_to_id = 'FRA' ) ).


    " Anfügen von Datensätzen
    connection = VALUE #( carrier_id = 'AZ'
                          connection_id = '0017'
                          airport_from_id = 'BER'
                          airport_to_id = 'ROM' ).

    connections = VALUE #( BASE connections ( connection ) ). "neue Variante

    APPEND connection TO connections. "alte Variante, aber noch zulässig



    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 3 ]. "per Index (Index 0 gibts ned)
      CATCH cx_sy_zerodivide.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ]. " per Schlüsselkomponente
    ENDIF.


    "Lesen von mehreren Datensätzen
    "wenn Struktur noch ned deklariert: LOOP AT connctions INTO DATA(connections2).
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    "Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    "Löschen
    DELETE connections WHERE airport_from_id = 'FRA'.
*    clear connections.  "Löscht ganze Tabelle


    "Ändern von Einzeldaten
    TRY.
        connections[ 3 ]-airport_from_id = 'FRA'. "per Index (Index 0 gibts ned)
      CATCH cx_sy_zerodivide.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. " per Schlüsselkomponente
    ENDIF.


    "Ändern von mehreren Datensätzen (per say-tabix)
    "wenn Struktur noch ned deklariert: LOOP AT connctions INTO DATA(connections2).
    LOOP AT connections INTO connection.
      connection-airport_to_id = 'JFK'.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    "Ändern von mehreren Datensätzen (per Datenreferenz)
    DATA connection2 TYPE REF TO Z08_connection. "erzeugt Referenz auf Struktur
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_to_id = 'BER'.
    ENDLOOP.

    "Ändern von mehreren Datensätzen (per Feldsymbol)
    FIELD-SYMBOLS <connection> TYPE Z08_connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.




    "Anzahl Datensätze
    out->write( lines( connections ) ).


    "Ausgaben
    out->write( connections ).
    out->write( connections2 ).




  ENDMETHOD.
ENDCLASS.
