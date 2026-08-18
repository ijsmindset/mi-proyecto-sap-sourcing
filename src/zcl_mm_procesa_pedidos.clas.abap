CLASS ZCL_MM_PROCESA_PEDIDOS DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_PROCESA_PEDIDOS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(lv_pedido_id) = '4500001234'.
    DATA(lv_centro)    = 'Madrid'.
    DATA(lv_importe)   = '12500'. "euros

    DATA(lv_prioridad) = COND string(
      WHEN lv_importe > 10000 THEN 'ALTA - Requiere aprobación de Gerencia'
      ELSE 'BAJA - Aprobación automática'
    ).

    out->write( |--- PROCESAMIENTO DE COMPRAS ---| ).
    out->write( |Pedido analizado: { lv_pedido_id }| ).
    out->write( |Centro logístico: { lv_centro }| ).
    out->write( |Importe total  : { lv_importe } EUR| ).
    out->write( |Prioridad       : { lv_prioridad }| ).

  ENDMETHOD.
ENDCLASS.
