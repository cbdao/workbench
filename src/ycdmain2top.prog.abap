*&---------------------------------------------------------------------*
*&  Include           YCDMAINTOP                                       *
*&---------------------------------------------------------------------*
PROGRAM YCDMAINPROG MESSAGE-ID /ICORP/ZH.

TABLES: YCDORDERS,
        YCDITEMS,
        YCDMATPRICE,
        YCDMAT.

DATA:  GT_ITEMS LIKE YCDITEMS OCCURS 0 WITH HEADER LINE.

DATA:
* Tracks the current line in a loop on the screen
  CONTENT_DISPLAY LIKE SY-INDEX.
