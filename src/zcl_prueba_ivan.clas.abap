CLASS zcl_prueba_ivan DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun. " Interfaz necesaria para ejecutar en Cloud
    METHODS: hola_mundo RETURNING VALUE(rv_mensaje) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_prueba_ivan IMPLEMENTATION.

  METHOD hola_mundo.
    rv_mensaje = 'Hola Ivan, esto funciona en tu cloud'.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    " Llamamos al método y pasamos el resultado al objeto 'out' de la interfaz
    DATA(lv_texto) = me->hola_mundo( ).
    out->write( lv_texto ).
  ENDMETHOD.

ENDCLASS.


