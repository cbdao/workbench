*----------------------------------------------------------------------*
***INCLUDE YCDMAINO01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_0100 OUTPUT.
   SET PF-STATUS '100'.
   SET TITLEBAR '100'.

ENDMODULE.                 " STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*&      Module  STATUS_0101  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_0101 OUTPUT.
   SET PF-STATUS '101'.
   SET TITLEBAR '101'.
   PERFORM GET_MAT_DETAILS USING MATNUM.
ENDMODULE.                 " STATUS_0101  OUTPUT
