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

    " step 1 - READ
*    READ ENTITIES OF ZJU_I_TRAVEL_M_000
*      ENTITY travel
*        FROM VALUE #( ( mykey = '02D5290E594C1EDA93815057FD946624' ) )
*      RESULT DATA(travels).
*          out->write( travels ).

    " step 2 - READ specific fields
*    READ ENTITIES OF ZJU_I_TRAVEL_M_000
*      ENTITY travel
*        FIELDS ( agency_id customer_id )
*        WITH VALUE #( ( mykey = '02D5290E594C1EDA93815057FD946624' ) )
*      RESULT DATA(travels).
*    out->write( travels ).

    " step 3
*        READ ENTITIES OF ZJU_I_TRAVEL_M_000
*      ENTITY travel
*        ALL FIELDS
*        WITH VALUE #( ( mykey = '02D5290E594C1EDA93815057FD946624' ) )
*      RESULT DATA(travels).
*    out->write( travels ).

    " step 4 READ by association - can't be done

    " step 5 Failure handling in READ operations
*         READ ENTITIES OF ZJU_I_TRAVEL_M_000
*       ENTITY travel
*         ALL FIELDS WITH VALUE #( ( mykey = '11111111111111111111111111111111' ) )
*       RESULT DATA(travels)
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*     out->write( travels ).
*     out->write( failed ).    " complex structures not supported by the console output
*     out->write( reported ).  " complex structures not supported by the console output

    " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZJU_I_TRAVEL_M_000
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( mykey = '02D5290E594C1EDA93815057FD946624'
*                  Description = 'I like ABAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*     out->write( 'Update done' ).
*
*     " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZJU_I_TRAVEL_M_000
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

    " step 7 - MODIFY 1 = "Create an entity"
*       MODIFY ENTITIES OF ZJU_I_TRAVEL_M_000
*        ENTITY travel
*          CREATE
*            SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 agency_id    = '70012'
*                 customer_id  = '14'
*                 begin_date   = cl_abap_context_info=>get_system_date( )
*                 end_date     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I created this!' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*
*    COMMIT ENTITIES
*      RESPONSE OF ZJU_I_TRAVEL_M_000
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

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
