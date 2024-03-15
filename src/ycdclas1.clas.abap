class YCDCLAS1 definition
  public
  final
  create public

  global friends YBFCLAS0 .

*"* public components of class YCDCLAS1
*"* do not include other source files here!!!
public section.

  interfaces IF_EX_RPM_FIN_INTF .
  interfaces YCDINTF1 .

  aliases CL1_PUB_ALIAS
    for IF_EX_RPM_FIN_INTF~PROCESS_R3_TASK_DATA .

  data CL1_PUB_ATTR type BUKRS .

  methods CL1_METH1
    importing
      value(IN_STRC) type YCDMAT optional
    exceptions
      NOT_FOUND .
  class-methods CL1_STATIC_METH
    exporting
      !STATIC_PARAM type KUNNR .
protected section.
*"* protected components of class YCDCLAS1
*"* do not include other source files here!!!

  aliases ALIAS_FOR_I1_ATTR1
    for YCDINTF1~I1_ATTR1 .

  types CL1_PRO_TYPE1 type VERSNO .

  class-data CL1_PRO_ATTR type YCDDETL_CHAR10 .

  class-events YCDEVENT1 .

  class-methods PRO_METH1
    importing
      value(PRO_METH1_PARA1) type CHAR10 default '1234'
    exporting
      !PRO_METH1_PARA2 type KUNNR
    exceptions
      PRO_METH1_EXCEPTION .
private section.
*"* private components of class YCDCLAS1
*"* do not include other source files here!!!

  aliases ALIAS_FOR_I1_METH1
    for YCDINTF1~I1_METH1 .
  aliases PUB_ALIAS_BUDGET_DATA
    for IF_EX_RPM_FIN_INTF~PROCESS_R3_BUDGET_DATA .

  class-data CL1_ATTR1 type KUNNR .

  methods PRIV_METH1
    exporting
      value(PRIVATE_METH1_PARAM1) type KUNNR
    exceptions
      PRIV_EXCEP1
      PRIVATE_EXCEPTION2 .
ENDCLASS.



CLASS YCDCLAS1 IMPLEMENTATION.


method CL1_METH1 .

  data: test type ref to ycdclas1_clone.
                CALL FUNCTION 'YCD_GET_PRICES'
                  EXPORTING
                    OBJ_TYPE       = 'ABAC'
*{   REPLACE        S4HK910526                                        1
*\                    OBJ_NAME       = 'TEST'
                    OBJ_NAME       = 'TEST'.
*}   REPLACE
*                 IMPORTING
*                   PRICE          =
*                   CURRENCY       =
*                 EXCEPTIONS
*                   NOTFOUND       = 1
*                   OTHERS         = 2
                          .
                IF SY-SUBRC <> 0.
                     WRITE: / 'Error Reading Prices'.
                ENDIF.

*  call method zcdclas1=>method2.
endmethod.


method CL1_STATIC_METH .
*{   INSERT         S21K900028                                        1
  CALL FUNCTION 'YTESTAUTFUNC1'.
*}   INSERT
endmethod.


method PRIV_METH1 .
* Private Method
  move '1234' to PRIVATE_METH1_PARAM1.
endmethod.


method PRO_METH1 .
* Protected Method
  data: test type c.
endmethod.


method YCDINTF1~I1_METH1 .

WRITE: 'HELLO'.
endmethod.
ENDCLASS.
