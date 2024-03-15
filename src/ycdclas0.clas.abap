class YCDCLAS0 definition
  public
  create public

  global friends YCDCLAS1 .

*"* public components of class YCDCLAS0
*"* do not include other source files here!!!
public section.

  interfaces YCDINTF1 .

  aliases CLS0_ATTR1
    for YCDINTF1~I1_ATTR1 .

  class-data CL0_ATTR1 type YCDDETL_CHAR10 .

  class-events CLAS0_EVT1 .

  methods CONSTRUCTOR .
  class-methods PUB_STATIC_METH1
    importing
      value(IMP_PARM) type YBFDTEL1 optional
    exporting
      !EXP_PARM type YCDITEMS
    exceptions
      INVALID_PARMS .
protected section.
*"* protected components of class YCDCLAS0
*"* do not include other source files here!!!

  methods PRO_INSTANCE_METH
    importing
      value(IN_PARM) type CHAR10 optional .
private section.
*"* private components of class YCDCLAS0
*"* do not include other source files here!!!

  aliases CLS0_METH1
    for YCDINTF1~I1_METH1 .
ENDCLASS.



CLASS YCDCLAS0 IMPLEMENTATION.


method CONSTRUCTOR .
  data: g_ind type ycditems.

endmethod.


method PRO_INSTANCE_METH .
* This is code implemented at class YCDCLAS0 level.
*{   INSERT         S21K900056                                        1
SELECT * FROM ycds_ddls2 INTO TABLE @DATA(lt_ddls).
*}   INSERT

  call function 'FUNC1'.
endmethod.


method PUB_STATIC_METH1 .

call function 'YBFFUNC1'.

write: 'This method is defined in YCDCLAS0,'.
write: 'which is a superclass of YCDCLAS1_CLONE'.
endmethod.
ENDCLASS.
