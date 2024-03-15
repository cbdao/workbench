*&---------------------------------------------------------------------*
*&  Include           YCDMAINTOP                                       *
*&---------------------------------------------------------------------*
PROGRAM YCDMATPROG MESSAGE-ID /ICORP/ZH.

TABLES: YCDMAT.

DATA: MATNUM TYPE MATNR,
      FVAL  TYPE MATNR,
      PREV_DYNP LIKE SY-DYNNR,
      RC    LIKE SY-SUBRC.
