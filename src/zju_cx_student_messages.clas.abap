CLASS zju_cx_student_messages DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*/dmo/cm_flight_messages
    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      gc_msgid TYPE symsgid VALUE 'ZJU_STUDENT_MESSAGES',

      BEGIN OF you_are_too_old,
        msgid TYPE symsgid VALUE 'ZJU_STUDENT_MESSAGES',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_ID',
        attr2 TYPE scx_attrname VALUE 'MV_AGE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF you_are_too_old,

      BEGIN OF you_are_too_young,
        msgid TYPE symsgid VALUE 'ZJU_STUDENT_MESSAGES',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_ID',
        attr2 TYPE scx_attrname VALUE 'MV_AGE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF you_are_too_young.


    METHODS constructor
      IMPORTING
        textid                LIKE if_t100_message=>t100key OPTIONAL
        attr1                 TYPE string OPTIONAL
        attr2                 TYPE string OPTIONAL
        attr3                 TYPE string OPTIONAL
        attr4                 TYPE string OPTIONAL
        previous              LIKE previous OPTIONAL
        id                    type string OPTIONAL
        age                   TYPE n OPTIONAL
        severity              TYPE if_abap_behv_message=>t_severity OPTIONAL
        uname                 TYPE syuname OPTIONAL.


    DATA:
      mv_attr1                 TYPE string,
      mv_attr2                 TYPE string,
      mv_attr3                 TYPE string,
      mv_attr4                 TYPE string,
      my_id                    type string,
      mv_age                   TYPE n.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cx_student_messages IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(  previous = previous ) .

    me->mv_attr1                 = attr1.
    me->mv_attr2                 = attr2.
    me->mv_attr3                 = attr3.
    me->mv_attr4                 = attr4.
    me->mv_age                   = age.
    me->my_id                    = id.

    if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
