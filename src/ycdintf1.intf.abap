*"* components of interface YCDINTF1
interface YCDINTF1
  public .


  constants I1_ATTR1 type YCDDETL_CHAR10 value 'ABC'. "#EC NOTEXT

  methods I1_METH1
    importing
      value(I1_METH1_PARM1) type CHAR10 optional
    exceptions
      NOTFOUND .
endinterface.
