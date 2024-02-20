@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZJU_I_TRAVEL_M_000'
define root view entity ZJU_I_TRAVEL_M_000 as select from zju_travel_000
{
    key mykey as Mykey,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    booking_fee as BookingFee,
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt
}
