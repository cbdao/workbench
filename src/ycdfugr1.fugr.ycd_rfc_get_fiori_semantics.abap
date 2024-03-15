FUNCTION YCD_RFC_GET_FIORI_SEMANTICS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      OUT_SEMANTICS STRUCTURE  /ICORP/O2APPLFIORISEMANTIC OPTIONAL
*"      IN_APPLNAME STRUCTURE  /ICORP/O2APPLNAME OPTIONAL
*"----------------------------------------------------------------------
*{   INSERT         S4HK910580                                        1
  DATA: s_applname LIKE LINE OF in_applname.

  DATA: BEGIN OF s_chip,
          wapa_name LIKE in_applname-applname,
          id        TYPE /ICORP/YVPRCHIP_ID_PBC, "/UI2/CHIP_ID_PBC,
          tabname   type tabname,
        END OF s_chip.
  DATA: t_chip LIKE TABLE OF s_chip.

  DATA: t_wapaurl TYPE TABLE OF string.
  DATA: l_lines LIKE sy-index.

*---------------------------------------

  "DATA: test TYPE /ui2/pb_c_chip. "structure in fiori system

  FIELD-SYMBOLS: <test>  type any, "use to read table /UI2/PC_C_CHIP
                 <testm> type any. "use to read table /UI2/PC_C_CHIPM
  data: dref  type ref to data,
        drefm type ref to data.


  data: begin of test,
          id TYPE  /ICORP/YVPRCHIP_ID_PBC, "/UI2/CHIP_ID_PBC
          configuration TYPE string,
          upper_conf type string,
       end of test.

  DATA: temp  TYPE string,
        temp2 TYPE string,
        dummy TYPE c.
  DATA: offset TYPE i,
        count  TYPE i.

DEFINE APPEND_CHIP.
    MOVE temp2 TO s_chip-wapa_name.
    MOVE test-id TO s_chip-id.
    MOVE &1  TO s_chip-tabname.
   APPEND s_chip TO t_chip.
END-OF-DEFINITION.

 DEFINE FIND_CHIP.
   TRANSLATE test-configuration TO UPPER CASE.
   TRANSLATE s_applname TO UPPER CASE.
   IF    test-configuration CS s_applname
     and test-configuration CS 'URL'.
     CLEAR s_chip.
     PERFORM get_wapa_from_url USING test-configuration
                            CHANGING temp2.
     IF temp2 = s_applname.  "we found our WAPA
       APPEND_CHIP &1.
     ENDIF.
   ENDIF.

 END-OF-DEFINITION.
  CLEAR t_chip.
  REFRESH t_chip.

* field symbols and work area for table
  create data dref type ('/UI2/PB_C_CHIP').
  assign dref->* to <test>.
  create data drefm type ('/UI2/PB_C_CHIPM').
  assign drefm->* to <testm>.

* Sort
  SORT in_applname.
  DELETE ADJACENT DUPLICATES FROM in_applname.

  IF lines( in_applname ) > 0.
* First off, read CHIP table URL section to restrict to WAPAs
    LOOP AT in_applname INTO s_applname.
      SELECT * FROM ('/UI2/PB_C_CHIP') into <test>.

        MOVE-CORRESPONDING <test> to test.

*        TRANSLATE test-configuration TO UPPER CASE.
*        TRANSLATE s_applname TO UPPER CASE.
*        IF test-configuration CS s_applname
*          and test-configuration CS 'URL'.
*
*          CLEAR s_chip.
*
*          PERFORM get_wapa_from_url USING test-configuration
*                                    CHANGING temp2.
*
*          IF temp2 = s_applname.  "we found our WAPA
*            MOVE temp2 TO s_chip-wapa_name.
*            MOVE test-id TO s_chip-id.
*            APPEND s_chip TO t_chip.
*          ENDIF.
*
*        ENDIF.
        FIND_CHIP 'CHIP'.
      ENDSELECT.
    ENDLOOP.
      LOOP AT in_applname INTO s_applname.
      SELECT * FROM ('/UI2/PB_C_CHIPM') into <testm>.
        MOVE-CORRESPONDING <testm> to test.
        FIND_CHIP 'CHIPM'.
      ENDSELECT.
    ENDLOOP.
ELSE.
    SELECT * FROM ('/UI2/PB_C_CHIP') into <test>.

      MOVE-CORRESPONDING <test> to test.

      CLEAR s_chip.

      move test-configuration to test-upper_conf.
      translate test-upper_conf to UPPER CASE.

      IF test-upper_conf CS 'URL'.

        PERFORM get_wapa_from_url USING test-configuration
                                  CHANGING temp2.

        TRANSLATE temp2 TO UPPER CASE.
* clean up by checking to see if this is a real WAPA name
        TABLES: o2appl.
        SELECT SINGLE applname FROM o2appl INTO o2appl-applname
            WHERE applname = temp2.
        IF sy-subrc = 0.
          APPEND_CHIP 'CHIP'.
        ENDIF.

      ENDIF.

    ENDSELECT.
        SELECT * FROM ('/UI2/PB_C_CHIPM') into <testm>.

      MOVE-CORRESPONDING <testm> to test.

      CLEAR s_chip.

      move test-configuration to test-upper_conf.
      translate test-upper_conf to UPPER CASE.

      IF test-upper_conf CS 'URL'.

        PERFORM get_wapa_from_url USING test-configuration
                                  CHANGING temp2.

        TRANSLATE temp2 TO UPPER CASE.
* clean up by checking to see if this is a real WAPA name
        SELECT SINGLE applname FROM o2appl INTO o2appl-applname
            WHERE applname = temp2.
        IF sy-subrc = 0.
          APPEND_CHIP 'CHIPM'.
        ENDIF.

      ENDIF.

    ENDSELECT.
  ENDIF.
* Using CHIP list, read the other values

*WRITE: 'TITLE', 30 'SEM_OBJ', 50 'SEM_ACTION', 75 'URL'.
  LOOP AT t_chip INTO s_chip.

* Build a where-clause to use the CHIP-ID in the SELECT...
    data: s_clause(500) type c.
    concatenate 'ID = ''' s_chip-id '''' into s_clause.
    IF s_chip-tabname = 'CHIP'.
      SELECT SINGLE * FROM ('/UI2/PB_C_CHIP') INTO <test>
           WHERE (s_clause).

      MOVE-CORRESPONDING <test> to test.
    ELSE.
      SELECT SINGLE * FROM ('/UI2/PB_C_CHIPM') INTO <testm>
           WHERE (s_clause).

      MOVE-CORRESPONDING <testm> to test.
    ENDIF.
      CLEAR out_semantics.

      move test-configuration to test-upper_conf.
      translate test-upper_conf to UPPER CASE.

      IF test-upper_conf CS s_chip-wapa_name.

        IF test-configuration CS 'display_title_text'.
          offset = sy-fdpos + 23.
          temp = test-configuration+offset(*).
          SPLIT temp AT '\' INTO temp2 dummy.
*      write : / temp2.
          MOVE temp2 TO out_semantics-title.
        ENDIF.
        IF test-configuration CS 'semantic_object'.
          offset = sy-fdpos + 20.
          temp = test-configuration+offset(*).
          SPLIT temp AT '\' INTO temp2 dummy.
*      write :  temp2 UNDER 'SEM_OBJ'.
*      ADD 1 TO COUNT.
          MOVE temp2 TO out_semantics-sem_obj.
        ENDIF.
        IF test-configuration CS 'semantic_action'.
          offset = sy-fdpos + 20.
          temp = test-configuration+offset(*).
          SPLIT temp AT '\' INTO temp2 dummy.
*      write :  temp2 UNDER 'SEM_ACTION'.
          MOVE temp2 TO out_semantics-sem_action.
        ENDIF.
        IF test-configuration CS 'url'.
          offset = sy-fdpos + 8.
          temp = test-configuration+offset(*).
          SPLIT temp AT '\' INTO temp2 dummy.
*      write :  temp2 UNDER 'URL'.
          MOVE temp2 TO out_semantics-url.
        ENDIF.


        MOVE s_chip-wapa_name TO out_semantics-wapa_name.
        APPEND out_semantics.

      ENDIF.

  ENDLOOP.

  sort: out_semantics.
  DELETE ADJACENT DUPLICATES FROM OUT_SEMANTICS.
ENDFUNCTION.

*&---------------------------------------------------------------------*
*&      Form  get_wapa_from_url
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->IN_URL     text
*      -->OUT_WAPA   text
*----------------------------------------------------------------------*
FORM get_wapa_from_url USING in_url CHANGING out_wapa.

  DATA: temp  TYPE string,
        temp2 TYPE string,
        dummy TYPE c.
  DATA: offset TYPE i.
  DATA: t_wapaurl TYPE TABLE OF string.
  DATA: l_lines LIKE sy-index.

  offset = sy-fdpos + 8.
  temp = in_url+offset(*).
  SPLIT temp AT '\' INTO temp2 dummy.

* find the last occurence of the / to get the WAPA NAME
  REFRESH t_wapaurl.
  SPLIT temp2 AT '/' INTO TABLE t_wapaurl.
  DESCRIBE TABLE t_wapaurl LINES l_lines.
  READ TABLE t_wapaurl INDEX l_lines INTO out_wapa.



ENDFORM.                    "get_wapa_from_url
*}   INSERT
