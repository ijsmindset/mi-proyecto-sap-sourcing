@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '##GENERATED Travel App (564) - by IVAN JIMENEZ'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZRAP100_ATRAV564'
}
@AccessControl.authorizationCheck: #MANDATORY
@Search.searchable: true
define root view entity ZC_RAP100_ATRAV564
  provider contract transactional_query
  as projection on ZR_RAP100_ATRAV564
  association [1..1] to ZR_RAP100_ATRAV564 as _BaseEntity on $projection.TravelID = _BaseEntity.TravelID
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key TravelID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' }, useForValidation: true }]
      AgencyID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  }, useForValidation: true }]
      CustomerID,

      BeginDate,
      EndDate,

      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      BookingFee,

      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,

      Description,

      @ObjectModel.text.element: ['OverallStatusText']
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }, useForValidation: true }]
      OverallStatus,

      _Agency.Name              as AgencyName,
      _Customer.LastName        as CustomerName,
      _OverallStatus._Text.Text as OverallStatusText : localized,

      Attachment,
      MimeType,
      FileName,

      @Semantics: {
        user.createdBy: true
      }
      CreatedBy,

      @Semantics: {
        systemDateTime.createdAt: true
      }
      CreatedAt,

      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,

      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,

      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt,

      _BaseEntity
}
