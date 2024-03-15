*&---------------------------------------------------------------------*
*& Report  YCDTEST                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*
*&                                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*

REPORT  YCDTEST                                 .

tables: KNA1.
DATA: L_COUNT TYPE I,
      LT_CUSTNO TYPE KUNNR OCCURS 0.

START-OF-SELECTION.

SELECT * FROM KNA1.
  CHECK KNA1-KUNNR NE SPACE.
  WRITE: / KNA1-KUNNR.
ENDSELECT.


IF SY-SUBRC NE 0.
*  WRITE: / 'No customer records'.
ENDIF.

SELECT  COUNT(*) KUNNR FROM KNA1
  INTO  (L_COUNT, KNA1-KUNNR)
  WHERE ORT01 LIKE 'PHILA%'
  GROUP BY KUNNR.

  APPEND KNA1-KUNNR TO LT_CUSTNO.

ENDSELECT.

SELECT * FROM KNA1.

CHECK KNA1-KUNNR = 0.

ENDSELECT.
