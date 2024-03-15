*&---------------------------------------------------------------------*
*&  Include           YCDINCL1                                         *
*&---------------------------------------------------------------------*

FORM LOG_MSG USING P_MSG.
     CALL FUNCTION 'RSLG_WRITE_SYSLOG_ENTRY'
       EXPORTING
            SL_MESSAGE_AREA    = G_AREA
            SL_MESSAGE_SUBID   = G_SUBID
            PRE_PARAM_LONG     = P_MSG
       EXCEPTIONS
            DATA_MISSING       = 1
            DATA_WORDS_PROBLEM = 2
            OTHER_PROBLEM      = 3
            PRE_PARAMS_PROBLEM = 4
            OTHERS             = 5.


ENDFORM.
