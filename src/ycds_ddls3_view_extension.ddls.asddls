@AbapCatalog.sqlViewAppendName: 'YCDS_DDLS3_EXT'
@EndUserText.label: 'Extend CDS View YCDS_DDLS3'

extend view YCDS_DDLS3 with YCDS_DDLS3_VIEW_EXTENSION
  { Ycdtabl1.key1 as fldext1}
