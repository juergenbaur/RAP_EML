CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.
    METHODS validateage FOR VALIDATE ON SAVE
      IMPORTING keys FOR student~validateage.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validateAge.

  READ ENTITIES OF zju_i_rap_student_001 IN LOCAL MODE
      ENTITY Student
        FIELDS ( age )
        WITH CORRESPONDING #( keys )
      RESULT DATA(studets).

    LOOP AT studets INTO DATA(student).

      IF student-age > 77.  "you are too old

        APPEND VALUE #( %tky = student-%tky ) TO failed-student.

        APPEND VALUE #( %tky = student-%tky
                        %msg = NEW zju_cx_student_messages(
                                   textid     = zju_cx_student_messages=>begin_date_bef_end_date
                                   severity   = if_abap_behv_message=>severity-error
*                                  age        = student-age
*                                  id         = student-age
)
                        %element-age          = if_abap_behv=>mk-on
                     ) TO reported-student.

      ELSEIF student-age < 66.  "you are too young

        APPEND VALUE #( %tky        = student-%tky ) TO failed-student.

        APPEND VALUE #( %tky = student-%tky
                        %msg = NEW zju_cx_student_messages(
                                    textid   = zju_cx_student_messages=>begin_date_on_or_bef_sysdate
                                    severity = if_abap_behv_message=>severity-error )
                        %element-age  = if_abap_behv=>mk-on
                      ) TO reported-student.
      ENDIF.

  ENDLOOP.

  ENDMETHOD.

ENDCLASS.
