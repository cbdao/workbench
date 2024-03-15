*"* local class implementation for public class
*"* use this source file for the implementation part of
*"* local helper classes


CLASS lcl_static_nested_class DEFINITION.
  PUBLIC SECTION.
*    INTERFACES zif_global_interface.
*    ALIASES get_message FOR zif_global_interface~get_message.
*    ALIASES report FOR zif_global_interface~report.
    METHODS constructor IMPORTING message TYPE string.
  PRIVATE SECTION.
    DATA message TYPE string.
ENDCLASS.

CLASS lcl_static_nested_class IMPLEMENTATION.
  METHOD constructor.
*{   INSERT         S4HK910702                                        1
   WRITE: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'.
*}   INSERT
    me->message = message.
  ENDMETHOD.
ENDCLASS.
