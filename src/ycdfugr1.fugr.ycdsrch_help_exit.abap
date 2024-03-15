FUNCTION YCDSRCH_HELP_EXIT.
*"--------------------------------------------------------------------
*"*"Local interface:
*"       TABLES
*"              SHLP_TAB TYPE  SHLP_DESCT
*"              RECORD_TAB STRUCTURE  SEAHLPRES
*"       CHANGING
*"             REFERENCE(SHLP) TYPE  SHLP_DESCR
*"             REFERENCE(CALLCONTROL) LIKE  DDSHF4CTRL
*"  STRUCTURE  DDSHF4CTRL
*"--------------------------------------------------------------------
*{   INSERT         S4HK910566                                        1
DATA: VAR1 TYPE KNA1.
*}   INSERT

submit ycdprog2.



ENDFUNCTION.
