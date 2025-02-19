CLASS zcm_28_movie DEFINITION
  PUBLIC
  INHERITING FROM zcm_abap
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS:
      BEGIN OF zcm_28_movie,
        msgid TYPE symsgid      VALUE 'Z28_MOVIE',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE 'FIELD',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcm_28_movie.

    DATA value TYPE string.
    DATA field TYPE string.

    METHODS constructor
      IMPORTING textid    LIKE if_t100_message=>t100key
                severity  TYPE if_abap_behv_message=>t_severity
                !previous LIKE previous OPTIONAL
                !value    TYPE string   OPTIONAL
                !field    TYPE string   OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_28_movie IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( textid   = textid
                        severity = severity
*                        previous =
    ).
    me->value = value.
    me->field = field.
  ENDMETHOD.
ENDCLASS.
