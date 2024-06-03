*"* use this source file for your ABAP unit test classes
CLASS ltcl_test DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      first_test FOR TESTING RAISING cx_static_check,
      second_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD first_test.

    IF sy-uname NE 'DEXY'.

      DATA(lr_cx) = NEW zju_cx_tmp_messages(
                                             textid   = zju_cx_tmp_messages=>user_not_found
*                                         attr1    = attr1
*                                         attr2    = attr2
*                                         attr3    = attr3
*                                         attr4    = attr4
*                                         previous = previous
                                             uname    = sy-uname
                                          ).
    ENDIF.

    DATA(lv_error) = lr_cx->get_text( ).
    cl_abap_unit_assert=>fail( lv_error ).
  ENDMETHOD.

  METHOD second_test.
    TRY.
        IF sy-uname NE 'DEXY'.
          MESSAGE e003(ZJU_STUDENT_MESSAGES) WITH sy-uname INTO DATA(msg).
          RAISE EXCEPTION TYPE zju_cx_tmp_messages
            MESSAGE ID sy-msgid
            TYPE sy-msgty
            NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.

      CATCH zju_cx_tmp_messages INTO DATA(oref).
        DATA(lv_error) = oref->get_text( ).
        cl_abap_unit_assert=>fail( lv_error ).
    ENDTRY.
  ENDMETHOD.

endclass.
