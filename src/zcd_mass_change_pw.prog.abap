*&---------------------------------------------------------------------*
*& Report ZCD_MASS_CHANGE_PW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCD_MASS_CHANGE_PW
        NO STANDARD PAGE HEADING
        LINE-SIZE 120.

TYPE-POOLS: truxs.
TABLES: USR02.
TYPES : BEGIN OF ty_intab,
          bname     TYPE xubname,       "User Name in User Master Record
          passwd(8) TYPE c,             "New password
        END OF ty_intab.

DATA: lt_intab         TYPE STANDARD TABLE OF ty_intab INITIAL SIZE 0,
      wa_intab         LIKE LINE OF lt_intab,
      gen_password(8)  TYPE c,
      password_bapi    LIKE bapipwd,
      return           TYPE STANDARD TABLE OF bapiret2 INITIAL SIZE 0,
      wa_retun         LIKE LINE OF return,
      lt_message       TYPE STANDARD TABLE OF bapiret2 INITIAL SIZE 0.

*SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME TITLE text-001.
*PARAMETERS: p_pname  LIKE rlgrap-filename.    "File name
*SELECTION-SCREEN END OF BLOCK blk1.
SELECT-OPTIONS UNAME FOR USR02-BNAME DEFAULT SY-UNAME.
PARAMETERS: P_NEWPW(30) TYPE C DEFAULT 'INITPASS'.

*AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_pname.
* select the path and the file name
*  PERFORM select_pc_path.

START-OF-SELECTION.
* Upload excel file from presentation server.
*  PERFORM upload_tab.

* LOOP AT lt_intab INTO wa_intab.
  LOOP AT UNAME.
*    MOVE wa_intab-passwd TO gen_password.
*    TRANSLATE gen_password TO UPPER CASE.
*    MOVE gen_password TO password_bapi.
    MOVE P_NEWPW TO password_bapi.
    CALL FUNCTION 'BAPI_USER_CHANGE'
      EXPORTING
*        username  = wa_intab-bname
        username  = uname-low
        password  = password_bapi
        passwordx = 'X'
      TABLES
        return    = return.

    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
        wait = 'X'.

*Remove standard message from BAPI
    DELETE return WHERE type = 'S' AND id = '01' AND number = '039'.
    LOOP AT return INTO wa_retun.
      APPEND wa_retun TO lt_message.
    ENDLOOP.

    UPDATE USR02 SET PWDSTATE = 1 WHERE BNAME = UNAME-LOW.
    IF SY-SUBRC = 0.
       WRITE: / 'Password for user ', uname-low, ' has been reset'.
    ENDIF.
  ENDLOOP.

END-OF-SELECTION.
*-----------------------------------------------------------------------
* End of Program
*-----------------------------------------------------------------------
  LOOP AT lt_message INTO wa_retun.
    WRITE wa_retun-message.
  ENDLOOP.

*&---------------------------------------------------------------------*
*&      Form  SELECT_PC_PATH
*&---------------------------------------------------------------------*
*FORM select_pc_path.
**F4 help for fetching file name.
*  CALL FUNCTION 'KD_GET_FILENAME_ON_F4'
*    EXPORTING
*      mask      = ',All Files,.'                          "#EC NOTEXT
*      static    = 'X'
*    CHANGING
*      file_name = p_pname.
*
*ENDFORM.                    " select_pc_path
*&---------------------------------------------------------------------*
*&      Form  UPLOAD_TAB
*&---------------------------------------------------------------------*
FORM upload_tab .
  DATA: ltab_data TYPE truxs_t_text_data.

* Upload data from the Excel sheet
*  CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
*    EXPORTING
*      i_tab_raw_data       = ltab_data
*      i_filename           = p_pname
*    TABLES
*      i_tab_converted_data = lt_intab
*    EXCEPTIONS
*      conversion_failed    = 1
*      OTHERS               = 2.

  IF sy-subrc <> 0.
    LEAVE LIST-PROCESSING.
  ENDIF.
ENDFORM.                    " UPLOAD_TAB
