FUNCTION YCD_FUNC1.
*"----------------------------------------------------------------------
*"*"Local interface:
*"  EXPORTING
*"     REFERENCE(OUT_STRC) TYPE  YCDSTRC1
*"----------------------------------------------------------------------

data: var1 type ycddetl_char10.

*{   REPLACE        S4HK910863                                        1
*\write: 'function referencing data element and structure'.
WRITE: 'function referencing data element '.
*}   REPLACE

PERFORM LOG_MSG USING VAR1.

PERFORM SUBR1.

ENDFUNCTION.
