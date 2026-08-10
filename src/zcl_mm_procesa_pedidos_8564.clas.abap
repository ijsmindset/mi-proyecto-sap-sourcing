CLASS zcl_mm_procesa_pedidos_8564 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    " Estructura de mensajes para interactuar con capas Fiori / RAP
    TYPES: BEGIN OF TY_MESSAGE,
             type       TYPE c LENGTH 1,
             id         TYPE STRING,
             number     TYPE string,
             message_v1 TYPE string,
           END OF ty_message.
    TYPES ty_messages_tt TYPE STANDARD TABLE OF ty_message WITH EMPTY KEY.

    "Datos del pedido que simulan la entrada de una app
    TYPES: BEGIN OF ty_pedido,
             ebeln TYPE string,
             lifnr TYPE string, " ID del proveedor
             netpr TYPE decfloat34,
             waers TYPE string,
           END OF ty_pedido.

    METHODS procesar_pedido_mm
      IMPORTING
        is_pedido  TYPE ty_pedido
      RETURNING
        VALUE(rt_messages)  TYPE ty_messages_tt.
   PROTECTED SECTION.
   PRIVATE SECTION.
ENDCLASS.

CLASS zcl_mm_procesa_pedidos_8564 IMPLEMENTATION.

  METHOD procesar_pedido_mm.
  "limite estricto de presupuesto para el sourcing
    CONSTANTS lc_max_price TYPE decfloat34 VALUE '50000.00'.

    "1 VALIDACION   real en base de datos (ABAP CLOUD standard)
    " Buscamos si el codigo de proveedor (LIFNR) existe en la CDS View liberada
    SELECT SINGLE FROM I_BusinessPartner
    FIELDS BusinessPartner
    WHERE BusinessPartner = @is_pedido-lifnr
    INTO @DATA(lv_partner_exist).

  IF sy-subrc <> 0.
   "si el select no encuentra nada sy-subrc es distinto a 0 , devolvemos un error
    rt_messages = VALUE #(  (
      type       = 'E'
      id         = 'ZMM_VALIDACIONES'
      number     = '001'
     ) ).
     RETURN.
  ENDIF.

  "2 VALIDACION   de precio
  IF is_pedido-netpr > lc_max_price.
    rt_messages = VALUE #( (
      type       = 'E'
      id         = 'ZMM_VALIDACIONES'
      number     = '002'
      message_v1 = |{ is_pedido-netpr } { is_pedido-waers }|
    ) ).
    RETURN.
  ENDIF.

    " 3. CONTROL DE ÉXITO
    rt_messages = VALUE #( (
      type       = 'S'
      id         = 'ZMM_VALIDACIONES'
      number     = '200'
      message_v1 = is_pedido-ebeln
    ) ).

  ENDMETHOD.


ENDCLASS.



