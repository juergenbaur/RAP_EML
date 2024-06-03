CLASS zju_cx_tmp_messages DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      gc_msgid TYPE symsgid VALUE 'ZJU_STUDENT_MESSAGES',

      BEGIN OF user_not_found,
        msgid TYPE symsgid VALUE 'ZJU_STUDENT_MESSAGES',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'MV_UNAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF user_not_found.


    METHODS constructor
      IMPORTING
        textid                LIKE if_t100_message=>t100key OPTIONAL
        attr1                 TYPE string OPTIONAL
        attr2                 TYPE string OPTIONAL
        attr3                 TYPE string OPTIONAL
        attr4                 TYPE string OPTIONAL
        previous              LIKE previous OPTIONAL
        uname                 TYPE syuname OPTIONAL.
*       severity              TYPE if_abap_behv_message=>t_severity OPTIONAL



    DATA:
      mv_attr1                 TYPE string,
      mv_attr2                 TYPE string,
      mv_attr3                 TYPE string,
      mv_attr4                 TYPE string,
      mv_uname                 type syuname.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cx_tmp_messages IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(  previous = previous ) .

    me->mv_attr1                 = attr1.
    me->mv_attr2                 = attr2.
    me->mv_attr3                 = attr3.
    me->mv_attr4                 = attr4.
    me->mv_uname                 = uname.

*   if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
