*&---------------------------------------------------------------------*
*& Report  YCDPROG1                                                    *
*&                                                                     *
*&---------------------------------------------------------------------*
*&                                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*

REPORT  YCDPROG1                                                    .

data: test type c.
INCLUDE YCDCOMMON if found.

START-OF-SELECTION.

PERFORM SUBR_IN_INCL2 USING GT_TAB.

perform log_msg(saplycdfugr1) using test.

INCLUDE YCDINCL2.
