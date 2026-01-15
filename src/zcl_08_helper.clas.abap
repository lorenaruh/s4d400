CLASS zcl_08_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
**********************************************************************
    CLASS-METHODS get_travel_with_customer
      IMPORTING
                travel_id                  TYPE /dmo/travel_id
      RETURNING VALUE(customer_and_travel) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

**********************************************************************
    CLASS-METHODS get_travels
      IMPORTING
                customer_id    TYPE /dmo/customer_id

      RETURNING VALUE(travels) TYPE z08_travels
      RAISING   zcx_abap_no_data.

**********************************************************************

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_helper IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.


**********************************************************************

  METHOD get_travel_with_customer.

*Option 1

**    travel = zcl_abap_helper=>get_travel( travel_id ).
*    SELECT SINGLE FROM /dmo/travel
*    FIELDS *
*    WHERE travel_id = @travel_id
*    INTO @DATA(travel).
*
*    IF sy-subrc <> 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'Travel_id' table = '/dmo/travel' value = CONV #( travel_id ) ).
*    ENDIF.
*
*
**    customer = zcl_abap_helper=>get_customer( customer_id = travel-customer_id ).
*    SELECT SINGLE FROM /dmo/customer
*        FIELDS *
*        WHERE customer_id = @travel-customer_id
*        INTO @DATA(customer).
*
*    IF sy-subrc <> 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'Travel_id' table = '/dmo/travel' value = CONV #( travel_id ) ).
*    ENDIF.

*    travel = CORRESPONDING #( travel ).
*    customer_and_travel = CORRESPONDING #( BASE ( travel ) customer ).

*    DATA customer_and_travel TYPE zabap_travel_with_customer.

**********************************************************************
*   Option2 mit Join
    SELECT FROM /dmo/travel
    INNER JOIN /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
    FIELDS *
    WHERE travel_id = @travel_id
    INTO CORRESPONDING FIELDS OF @customer_and_travel.

      IF sy-subrc <> 0.
        RAISE EXCEPTION NEW zcx_abap_no_data( field = 'Travel_id' table = '/dmo/travel' value = CONV #( travel_id ) ).
      ENDIF.
ENDSELECT.
    ENDMETHOD.

**********************************************************************


    METHOD get_travels.
*    travels = zcl_abap_helper=>get_travels( customer_id ).
      SELECT FROM /dmo/travel
  FIELDS *
  WHERE customer_id = @customer_id
  INTO TABLE @travels.
*travels = CORRESPONDING #( customer_and_travels ).

        IF sy-subrc <> 0.
          RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id' table = '/dmo/customer' value = CONV #( customer_id ) ).
        ENDIF.

*    IF lines( travels ) = 0.
*      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table '/dmo/travel' value = conv #( customer_id ) ).
*    ENDIF.
*
*

      ENDMETHOD.



ENDCLASS.
