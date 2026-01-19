CLASS zcx_08_value_too_high DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF zcx_08_value_too_high,
        msgid TYPE symsgid      VALUE 'Z08',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_08_value_too_high.

    DATA value TYPE i.

    METHODS constructor
      IMPORTING !previous LIKE previous OPTIONAL
                !value    TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcx_08_value_too_high IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = zcx_08_value_too_high.
    me->value = value.
  ENDMETHOD.
ENDCLASS.
