*&---------------------------------------------------------------------*
*& Report YCDPROG4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YCDPROG4.
DATA: L_FUNCNAME TYPE RS38L_FNAM.

start-OF-SELECTION.

WRITE: 'this is a test.  This is only a test. It is really only a test for AAQ testing'.
CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    FORMNAME                 = 'ZCD_SMARTFORM'
*   VARIANT                  = ' '
*   DIRECT_CALL              = ' '
  IMPORTING
    FM_NAME                  = L_FUNCNAME
* EXCEPTIONS
*   NO_FORM                  = 1
*   NO_FUNCTION_MODULE       = 2
*   OTHERS                   = 3
          .
IF SY-SUBRC = 0.
  CALL FUNCTION L_FUNCNAME.
ELSE.
    WRITE: 'Smartform does NOT exist. This part is to make the line longer than ........80'.
ENDIF.
