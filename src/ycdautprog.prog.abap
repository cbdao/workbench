*&---------------------------------------------------------------------*
*& Report YCDAUTPROG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YCDAUTPROG.
CLASS lcl_sums2 DEFINITION.
  PUBLIC SECTION.
    METHODS: ADD2 IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_add) TYPE i,
             MINUS2 IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_minus) TYPE i,
             MULTIPLY2 IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_multiply) TYPE i.
ENDCLASS.                    "lcl_sums DEFINITION
*

*
CLASS lcl_sums DEFINITION.
  PUBLIC SECTION.
    METHODS: ADD IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_add) TYPE i,
             MINUS IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_minus) TYPE i,
             MULTIPLY IMPORTING iv_1 TYPE i
                 RETURNING VALUE(rv_multiply) TYPE i.
ENDCLASS.                    "lcl_sums DEFINITION
*
START-OF-SELECTION.
   CALL METHOD YCDCLAS1=>CL1_STATIC_METH.
*
*
CLASS lcl_sums IMPLEMENTATION.
  METHOD add.
    rv_add = iv_1 + 4.
  ENDMETHOD.                    "add
  METHOD minus.
    rv_minus = iv_1 - 3.
  ENDMETHOD.                    "minus
  METHOD multiply.
    data: zero type i.
    rv_multiply = iv_1 / zero.  "forces exception error during test
  ENDMETHOD.                    "multiply
ENDCLASS.                    "lcl_sums IMPLEMENTATION
*
CLASS lcl_sums2 IMPLEMENTATION.
  METHOD add2.
    data: message type i value 6.
    call function 'TH_POPUP' exporting
      client = sy-mandt
      user = sy-uname
      MESSAGE = message.
    rv_add = iv_1 + 4.
  ENDMETHOD.                    "add
  METHOD minus2.
    rv_minus = iv_1 - 8.
  ENDMETHOD.                    "minus
  METHOD multiply2.
    rv_multiply = iv_1 * 2.  "
  ENDMETHOD.                    "multiply
ENDCLASS.                    "lcl_sums IMPLEMENTATION


*
CLASS lcl_test DEFINITION FOR TESTING
  "#AU Risk_Level Harmless
  "#AU Duration   Short
.
  PUBLIC SECTION.
    METHODS: m_add FOR TESTING,
    m_minus FOR TESTING,
    m_multiply FOR TESTING.

ENDCLASS.                    "lcl_test DEFINITION
*
*
CLASS lcl_test IMPLEMENTATION.
  METHOD m_add.
    DATA: o_cut TYPE REF TO lcl_sums.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->add( 3 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 6
        act                  = lv_result
        msg                  = 'something wrong sdd test1'
           ).
  ENDMETHOD.                    "m_add

  METHOD m_minus.
    DATA: o_cut TYPE REF TO lcl_sums.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->minus( 5 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 2
        act                  = lv_result
        msg                  = 'something wrong minus test1'
           ).
  ENDMETHOD.                    "m_minus

  METHOD m_multiply.
    DATA: o_cut TYPE REF TO lcl_sums.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->multiply( 3 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 9
        act                  = lv_result
        msg                  = 'something wrong multiply test1'
           ).
  ENDMETHOD.                    "m_add

ENDCLASS.                    "lcl_test IMPLEMENTATION

*
CLASS lcl_test2 DEFINITION FOR TESTING
  "#AU Risk_Level Harmless
  "#AU Duration   Short
.
  PUBLIC SECTION.
    METHODS: m_add2 FOR TESTING,
    m_minus2 FOR TESTING,
    m_multiply2 FOR TESTING.

ENDCLASS.                    "lcl_test DEFINITION
*
*
CLASS lcl_test2 IMPLEMENTATION.
  METHOD m_add2.
    DATA: o_cut TYPE REF TO lcl_sums2.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->add2( 3 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 6
        act                  = lv_result
        msg                  = 'something wrong add test2'
           ).
  ENDMETHOD.                    "m_add

  METHOD m_minus2.
    DATA: o_cut TYPE REF TO lcl_sums2.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->minus2( 5 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 2
        act                  = lv_result
        msg                  = 'something wrong minus test2'
           ).
  ENDMETHOD.                    "m_minus

  METHOD m_multiply2.
    DATA: o_cut TYPE REF TO lcl_sums2.
    DATA: lv_result TYPE i.
*
    CREATE OBJECT o_cut.
    lv_result = o_cut->multiply2( 3 ).
*
    cl_aunit_assert=>assert_equals(
        EXP                  = 6
        act                  = lv_result
        msg                  = 'something wrong multiply test2'
           ).
  ENDMETHOD.                    "m_add

ENDCLASS.                    "lcl_test2 IMPLEMENTATION
