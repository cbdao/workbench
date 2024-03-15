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
FORM VALIDATE_ORDNO  USING    P_ORDNO.

   SELECT SINGLE * FROM YCDORDERS
                   WHERE ORDNO = P_ORDNO.
   IF SY-SUBRC EQ 0.
     SELECT * FROM YCDITEMS INTO TABLE GT_ITEMS
              WHERE ORDNO = P_ORDNO.
   ELSE.
     MESSAGE E000 WITH 'Invalid Order Number.'.
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
