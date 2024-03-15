class YCDCLAS1_CLONE definition
  public
  inheriting from YCDCLAS0
  final
  create public .

*"* public components of class YCDCLAS1_CLONE
*"* do not include other source files here!!!
public section.

  methods CONSTRUCTOR .
  methods CL1_METH1
    importing
      value(IN_STRC) type YCDMAT optional .
  class-methods CL1_STATIC_METH
    returning
      value(OUT_PARAM) type ref to YBFCLAS0 .
protected section.
*"* protected components of class YCDCLAS1_CLONE
*"* do not include other source files here!!!

  class-data CL1_PRO_ATTR type YCDDETL_CHAR10 .

  methods PRO_INSTANCE_METH
    redefinition .
private section.
*"* private components of class YCDCLAS1_CLONE
*"* do not include other source files here!!!

  class-data CL1_ATTR1 type KUNNR .
ENDCLASS.



CLASS YCDCLAS1_CLONE IMPLEMENTATION.


method CL1_METH1 .

                CALL FUNCTION 'YCD_GET_PRICES'
                  EXPORTING
                    OBJ_TYPE       = 'ABAC'
                    OBJ_NAME       = 'TEST'
*                 IMPORTING
*                   PRICE          =
*                   CURRENCY       =
*                 EXCEPTIONS
*                   NOTFOUND       = 1
*                   OTHERS         = 2
                          .
                IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
                ENDIF.
  IF IN_STRC IS INITIAL.
    WRITE: 'NO INPUT'.
  ENDIF.
endmethod.


method CL1_STATIC_METH .
endmethod.


method CONSTRUCTOR .
 data: test type ycdstrc1.

 call method super->constructor.
endmethod.


method PRO_INSTANCE_METH .
*CALL METHOD SUPER->PRO_INSTANCE_METH
**  EXPORTING
**    IN_PARM =
*    .

* This code redefines the superclass method YCDCLAS0->PRO_INSTANCE_METH

write: 'redefined code'.
endmethod.
ENDCLASS.
