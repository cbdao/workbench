@AbapCatalog.sqlViewName: 'ycds_ddls3_view'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Third DDLS object'
define view YCDS_DDLS3 as select from ycdtabl1 {
    key1 as field1,
    char10 as charfield,
    quan_fld as quantity,
    unit_fld as unit
} 
  
  
  
 