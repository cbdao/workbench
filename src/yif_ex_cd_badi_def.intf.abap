*"* components of interface YIF_EX_CD_BADI_DEF
interface YIF_EX_CD_BADI_DEF
  public .


  class-data BADI_INTF_ATTR1 type YCDDETL_CHAR10 read-only .

  class-methods BADI_INTF_METH
    importing
      !IN_PARM type YCDSTRC1 .
endinterface.
