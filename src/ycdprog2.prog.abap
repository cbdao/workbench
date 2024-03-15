*&---------------------------------------------------------------------*
*& Report  YCDPROG2                                                    *
*&                                                                     *
*&---------------------------------------------------------------------*
*&                                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*

REPORT  YCDPROG2                                                    .

DATA: INTTAB TYPE YCDSTRC1.
data: VAR  TYPE REF TO YCDINTF1.
data: VAR1 TYPE REF TO YCDCLAS1_CLONE.

INCLUDE YCDCOMMON.

START-OF-SELECTION.

CALL METHOD YCDCLAS1=>CL1_static_METH.


PERFORM SUBR_IN_INCL3.

INCLUDE YCDINCL3.
