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
    LEAVE SCREEN.
  ENDIF.

ENDMODULE.                 " USER_COMMAND_0100  INPUT
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
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0101 INPUT.

  PREV_DYNP = SY-DYNNR.
  IF SY-UCOMM = 'SAV'.
    UPDATE YCDMAT.
  ENDIF.

ENDMODULE.                 " USER_COMMAND_0101  INPUT
