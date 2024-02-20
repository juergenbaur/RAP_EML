@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Student 001'
define root view entity zju_i_rap_student_001 as select from zju_student_001

{
    key id as Id,
    firstname as Firstname,
    lastname as Lastname,
    age as Age,
    course as Course,
    courseduration as Courseduration,
    status as Status,
    gender as Gender,
    dob as Dob,
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat
}
