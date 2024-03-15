*&---------------------------------------------------------------------*
*& Report YCD_READ_CDS_VIEWS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YCD_READ_CDS_VIEWS.
DATA: ls_temp type ycdmat,
      ls_wa   type ycdview1,
      l_var   TYPE YCDDETL_CHAR10.

START-OF-SELECTION.

SELECT * FROM ycds_ddls1_view INTO TABLE @DATA(lt_result).

SELECT SINGLE * FROM ycdmat INTO ls_temp.

SELECT SINGLE * FROM ycdview1 INTO ls_wa.
