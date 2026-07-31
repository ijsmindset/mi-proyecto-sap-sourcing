CLASS ZCL_MM_VALIDA_PRECIOS_8564 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_mm_valida_precios_8564 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lv_material)        = 'Licencias ERP Cloud'.
    DATA(lv_precio_neto)     = 75000.
    DATA(lv_nivel_aprobador) = |SISTEMA AUTOMATICO|.

    IF lv_precio_neto <= 10000.
      lv_nivel_aprobador = 'No requiere (Aprobacion Automatica)'.
    ELSEIF lv_precio_neto > 10000 AND lv_precio_neto < 50000.
      lv_nivel_aprobador = 'MANAGER DE COMPRAS (NIVEL 1)'.
    ELSE.
    lv_nivel_aprobador =  'DIRECTOR DE OPERACIONES (NIVEL 2)'.
    ENDIF.

    out->write( '***********************************************************' ).
    out->write( |Material Evaluado: { lv_material }| ).
    out->write( |Importe Neto     : { lv_precio_neto } EUR | ).
    out->write( |Responsable Autorizado  : { lv_nivel_aprobador }| ).
    out->write( '***********************************************************' ).
  ENDMETHOD.
ENDCLASS.

