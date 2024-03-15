class YCL_IM_CD_BADI_IMPL definition
  public
  final
  create public .

*"* public components of class YCL_IM_CD_BADI_IMPL
*"* do not include other source files here!!!
public section.

  interfaces IF_ABAP_GZIP_BINARY_HANDLER .

  methods BADI_METH
    importing
      !IN_PARM type YCDSTRC1 .
protected section.
*"* protected components of class ZCL_IM_CBD_BADI_IMPL
*"* do not include other source files here!!!
private section.
*"* private components of class YCL_IM_CD_BADI_IMPL
*"* do not include other source files here!!!

  data TEST_ATTR type YCDDTEL_SHLP .
ENDCLASS.



CLASS YCL_IM_CD_BADI_IMPL IMPLEMENTATION.


method BADI_METH .
endmethod.


method IF_ABAP_GZIP_BINARY_HANDLER~USE_OUT_BUF .
endmethod.
ENDCLASS.
