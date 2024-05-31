CLASS zju_cl_rap_eml_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cl_rap_eml_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Change UUID > mykey;
    " change entity to zi_travel_ve_m_XXX
    " use ZI, not ZC bcs BDEF refers to ZI
    " ENTITY travel = Behavior Definition

*    " step 1a - READ
*    READ ENTITIES OF zju_i_rap_student_001
*      ENTITY Student
*        FROM VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE' ) )
*      RESULT DATA(students).
*    out->write( students ).
*    " step 1b - READ
*    READ ENTITIES OF zju_i_rap_student_001
*      ENTITY Student
*        FROM VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE' ) )
*      RESULT DATA(students).
*   out->write( students ).
*    " step 2 - READ specific fields
*    READ ENTITIES OF zju_i_rap_student_001
*      ENTITY Student
*      FIELDS ( Firstname Lastname )
*        WITH VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE' ) )
*      RESULT Students.
*    out->write( students ).
*    " step 3
*    READ ENTITIES OF zju_i_rap_student_001
*      ENTITY Student
*      ALL FIELDS
*        WITH VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE' ) )
*      RESULT Students.
*    out->write( students ).
*
*    " step 4 READ by association - can't be done
*
*    " step 5 Failure handling in READ operations
*    READ ENTITIES OF zju_i_rap_student_001
*      ENTITY Student
*      FIELDS ( Firstname Lastname )
*        WITH VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B0000' ) )
*      RESULT Students
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*    out->write( Students ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output
*
*    " step 6 - MODIFY Update
    MODIFY ENTITIES OF zju_i_rap_student_001
      ENTITY Student
        UPDATE
          SET FIELDS WITH VALUE
            #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE'
                 age = '77' ) )
     FAILED data(failed)
     MAPPED data(mapped)
     REPORTED data(reported).

    READ ENTITIES OF zju_i_rap_student_001
      ENTITY Student
      ALL FIELDS
        WITH VALUE #( ( id = 'F6D07DF566731EDF87D1FE115C8B17AE' ) )
      RESULT data(Students).
*    out->write( 'Update done' ).
*
*     " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF zju_i_rap_student_001
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

    " step 7 - MODIFY 1 = "Create an entity"
*       MODIFY ENTITIES OF zju_i_rap_student_001
*        ENTITY Student
*          CREATE
*            SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 Firstname = 'Franz'
*                 Lastname = 'Kneer'
*                       Age = 95
*                            Course = 'C'
*                    Courseduration = 4
*                            Status = abap_true ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).

    out->write( mapped-student ).


    COMMIT ENTITIES
      RESPONSE OF zju_i_rap_student_001
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Create done' ).

*  data: it_student type table for create zju_i_rap_student_001.
*    it_student = VALUE #( ( %cid = 'First Test'
*                          Firstname = 'Junge'
*                          Lastname = 'Lastname'
*                               Age = 66
*                            Course = 'C'
*                    Courseduration = 4
*                            Status = abap_true
*                          %control = VALUE #( Firstname = if_abap_behv=>mk-on
*                                               Lastname = if_abap_behv=>mk-on
*                                                    Age = if_abap_behv=>mk-on
*                                                 Course = if_abap_behv=>mk-on
*                                         Courseduration = if_abap_behv=>mk-on ) ) ).
*
*    MODIFY ENTITIES OF zju_i_rap_student_001
*    ENTITY Student
*    CREATE FROM it_student
*    MAPPED DATA(lt_mapped)
*    FAILED DATA(lt_failed)
*    REPORTED DATA(lt_reported).
*    IF lt_failed IS NOT INITIAL.
*      out->write( EXPORTING
*                    data = lt_failed
*                    name = 'FAILED' ).
*    ELSE.
*      COMMIT ENTITIES.
*      SELECT FROM zju_i_rap_student_001
*      FIELDS id, firstname, lastname, age, course, courseduration, status
*      ORDER BY id
*      INTO TABLE @DATA(lt_out).
*      IF sy-subrc = 0.
*        out->write( EXPORTING
*                      data = lt_out ).
*      ENDIF.
*    ENDIF.
    " step 8 MODIFY 2 = "Delete an entry"
*    MODIFY ENTITIES OF ZJU_I_TRAVEL_M_000
*      ENTITY travel
*        DELETE FROM
*          VALUE
*            #( ( mykey  = '<your uuid>' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZJU_I_TRAVEL_M_000
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
