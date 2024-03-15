FUNCTION YCD_GET_PRICES.
*"----------------------------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"     REFERENCE(OBJ_TYPE)
*"     REFERENCE(OBJ_NAME)
*"  EXPORTING
*"     REFERENCE(PRICE) TYPE  KBETR
*"     REFERENCE(CURRENCY) TYPE  WAERS
*"  EXCEPTIONS
*"      NOTFOUND
*"----------------------------------------------------------------------

  data: l_matno type matnr.

  case obj_type.
     when 'MATL'.
        l_matno = obj_name.
        CALL FUNCTION 'YCD_GET_MATL_PRICES'
          EXPORTING
            MATNR          = l_matno
          IMPORTING
            PRICE          = price
            CURRENCY       = currency
          EXCEPTIONS
            NOTFOUND       = 1
            OTHERS         = 2
                  .
        IF SY-SUBRC <> 0.
           raise notfound.
        ENDIF.

     when others.
  endcase.

ENDFUNCTION.
