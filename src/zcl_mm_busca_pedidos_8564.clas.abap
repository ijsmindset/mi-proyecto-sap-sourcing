CLASS zcl_mm_busca_pedidos_8564 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.
 
 
CLASS zcl_mm_busca_pedidos_8564 IMPLEMENTATION.

   METHOD if_oo_adt_classrun~main. " metodo = accion no olvidar

    " 0. Preparamos el motor de búsqueda
    out->write( '**************************************************' ).
    out->write( 'INICIO DEL BUSCADOR' ).
    out->write( '**************************************************' ).

    " 1. El modelo de datos 
    TYPES: BEGIN OF ty_pedido,
             ebeln TYPE string, " Número de Pedido (ID)
             ekorg TYPE string, " Organización de Compras
             ekgrp TYPE string, " Grupo de Compras (Comprador)
             netwr TYPE i,      " Valor Neto (Precio)
           END OF ty_pedido.

    " 2. Creamos el ArrayList (Tabla Interna en SAP)
    DATA lt_busca_pedidos TYPE STANDARD TABLE OF ty_pedido WITH EMPTY KEY.

    " Rellenamos la lista con datos ficticios para simular la base de datos
    lt_busca_pedidos = VALUE #(
      ( ebeln = '4500000001' ekorg = '1000' ekgrp = '001' netwr = 15000 )
      ( ebeln = '4500000002' ekorg = '1000' ekgrp = '999' netwr = 5000  )
      ( ebeln = '4500000003' ekorg = '2000' ekgrp = '001' netwr = 62000 )
    ).

    " 3. El motor de búsqueda y comparación
    out->write( '**************************************************' ).
    out->write( 'RESULTADO DEL BUSCADOR: COMPRADOR STANDARD 001' ).
    out->write( '**************************************************' ).

    " Bucle For para recorrer y buscar
    LOOP AT lt_busca_pedidos INTO DATA(ls_pedido).
    
      " Buscamos y comparamos si el atributo es igual al Grupo de Compras '001'
      IF ls_pedido-ekgrp = '001'.
        out->write( |[MATCH] Pedido Encontrado: { ls_pedido-ebeln }| ).
        out->write( |      Org. Compras : { ls_pedido-ekorg }| ).
        out->write( |      Importe Neto : { ls_pedido-netwr } EUR| ).
        out->write( '--------------------------------------------------' ).
      ENDIF.
      
    ENDLOOP.

  ENDMETHOD.
