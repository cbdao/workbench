*----------------------------------------------------------------------*
***INCLUDE YCDMAINF01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  VALIDATE_ORDNO
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_YCDORDERS_ORDNO  text
*----------------------------------------------------------------------*
FORM GET_PRICES      "SING    P_OBJECT
                     CHANGING P_RC.

   CALL FUNCTION 'YCD_GET_PRICES'
     EXPORTING
       OBJ_TYPE       = 'MATL'
       OBJ_NAME       = YCDITEMS-MATNO
     IMPORTING
       PRICE          = YCDMATPRICE-PRICE
       CURRENCY       = YCDMATPRICE-CURRKEY
     EXCEPTIONS
       NOTFOUND       = 1
       OTHERS         = 2
             .
   IF SY-SUBRC <> 0.
      P_RC = 4.
   ENDIF.

ENDFORM.                    " VALIDATE_ORDNO
*&---------------------------------------------------------------------*
*&      Form  GET_MATDESC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_GT_ITEMS_MATNO  text
*----------------------------------------------------------------------*
FORM GET_MATDESC  USING    P_MATNO.
  SELECT SINGLE * FROM YCDMAT
                  WHERE MATNO = P_MATNO.
ENDFORM.                    " GET_MATDESC

FORM TEST.
   MOVE 1 TO CONTENT_DISPLAY.
ENDFORM.
