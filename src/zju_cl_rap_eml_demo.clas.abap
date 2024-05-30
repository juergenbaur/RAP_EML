CLASS zju_cl_rap_eml_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cl_rap_eml_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  data: it_student type table for create zju_i_rap_student_001.
    it_student = VALUE #( ( %cid = 'First Test'
                          Firstname = 'Junge'
                          Lastname = 'Lastname'
                               Age = 66
                            Course = 'C'
                    Courseduration = 4
                            Status = abap_true
                          %control = VALUE #( Firstname = if_abap_behv=>mk-on
                                               Lastname = if_abap_behv=>mk-on
                                                    Age = if_abap_behv=>mk-on
                                                 Course = if_abap_behv=>mk-on
                                         Courseduration = if_abap_behv=>mk-on ) ) ).

    MODIFY ENTITIES OF zju_i_rap_student_001
    ENTITY Student
    CREATE FROM it_student
    MAPPED DATA(lt_mapped)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).
    IF lt_failed IS NOT INITIAL.
      out->write( EXPORTING
                    data = lt_failed
                    name = 'FAILED' ).
    ELSE.
      COMMIT ENTITIES.
      SELECT FROM zju_i_rap_student_001
      FIELDS id, firstname, lastname, age, course, courseduration, status
      ORDER BY id
      INTO TABLE @DATA(lt_out).
      IF sy-subrc = 0.
        out->write( EXPORTING
                      data = lt_out ).
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
