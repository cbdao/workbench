*----------------------------------------------------------------------*
***INCLUDE YCDMAINI01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.
  PREV_DYNP = SY-DYNNR.

  IF SY-UCOMM = 'DISP' OR
     SY-UCOMM = 'ENT'.
*    SET SCREEN 0.
   SET PARAMETER ID 'ORD' FIELD YCDORDERS-ORDNO.
    LEAVE SCREEN.
  ENDIF.

ENDMODULE.                 " USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*&      Module  CHECK_ORDER  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE CHECK_ORDER INPUT.
   PERFORM VALIDATE_ORDNO USING YCDORDERS-ORDNO.
ENDMODULE.                 " CHECK_ORDER  INPUT
*&---------------------------------------------------------------------*
*&      Module  USER_EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_EXIT INPUT.
   if sy-ucomm = 'BACK'.
      SET SCREEN PREV_DYNP.
   ELSE.
      SET SCREEN 0.
   ENDIF.
   LEAVE SCREEN.

ENDMODULE.                 " USER_EXIT  INPUT
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0103 INPUT.
  SET SCREEN 101.
  LEAVE SCREEN.
ENDMODULE.                 " USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0101 INPUT.

  PREV_DYNP = SY-DYNNR.
  IF SY-UCOMM = 'PRICE'.
    GET CURSOR FIELD FNAME VALUE FVAL.

    MOVE FVAL TO: YCDITEMS-MATNO,
                  YCDMAT-MATNO.
    PERFORM GET_PRICES(YCDMAINPROG2) CHANGING RC.

    call screen '103'.
  ELSEIF SY-UCOMM = 'DETAIL'.
    GET CURSOR FIELD FNAME VALUE FVAL.

    MOVE FVAL TO: YCDITEMS-MATNO,
                  YCDMAT-MATNO.
    ASSIGN YCDMAT-MATNO TO <MATNUM>.
    CALL DIALOG 'YCD_MATERIAL_DIALOG'
                EXPORTING
*                          MATNUM    FROM YCDMAT-MATNO
                          MATNUM    FROM <MATNUM>
                IMPORTING
                          O_MATDESC TO YCDMAT-MATDESC.
  ENDIF.

ENDMODULE.                 " USER_COMMAND_0101  INPUT
