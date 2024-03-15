*&---------------------------------------------------------------------*
*& Report  YCDPROG3                                                    *
*&                                                                     *
*&---------------------------------------------------------------------*
*&                                                                     *
*&                                                                     *
*&---------------------------------------------------------------------*

REPORT  YCDPROG3                                .

data: l_clsinst type ref TO YCDCLAS1_CLONE.


start-of-selection.

call method YCDCLAS1_CLONE=>PUB_STATIC_METH1.

create object l_clsinst.

call method L_CLSINST->CL1_METH1.

call method YCDCLAS1_CLONE=>CL1_STATIC_METH.
