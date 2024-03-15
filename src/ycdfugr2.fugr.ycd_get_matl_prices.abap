FUNCTION YCD_GET_MATL_PRICES.
*"----------------------------------------------------------------------
*"*"Global Interface:
*"  IMPORTING
*"     VALUE(MATNR) TYPE  MATNR
*"  EXPORTING
*"     REFERENCE(PRICE) TYPE  KBETR
*"     REFERENCE(CURRENCY) TYPE  WAERS
*"  EXCEPTIONS
*"      NOTFOUND
*"----------------------------------------------------------------------

data: rc like sy-subrc.

perform read_prices changing rc.
if rc ne 0.
*{   REPLACE        S21K900016                                        1
*\  raise notfound.
  raise NOTFOUND.
*}   REPLACE
endif.


ENDFUNCTION.
