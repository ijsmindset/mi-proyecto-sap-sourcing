CLASS zcl_mm_valida_proveedor DEFINITION
    PUBLIC FINAL CREATE PUBLIC.

    PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_mm_valida_proveedor IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        " ID del pedido de compras simulado
        DATA(lv_ebeln) = '4500000022'.

        " Seleccionamos el proveedor (LIFNR) y su estado de bloqueo (SPERM)
        " Cruzamos la cabecera del pedido (EKKO) con el maestro de proveedores (LFA1)
        SELECT single 
            h~ebeln AS nro_pedido,
            h~lifnr AS proveedor,
            p~name1 AS nombre_proveedor,
            p~sperm AS bloqueado_compras
        FROM ekko AS h
        INNER JOIN lfa1 AS p ON h~lifnr = p~lifnr
        WHERE h~ebeln = @lv_ebeln
        INTO @DATA(ls_status_proveedor).

        IF sy-subrc <> 0.
            out->write( |Error: El pedido { lv_ebeln } no existe en el sistema.| ).
            RETURN.
        ENDIF.

        " Lógica de negocio: Validamos el campo de bloqueo SPERM
        " Si el campo tiene una 'X', el proveedor está vetado para compras
        IF ls_status_proveedor-bloqueado_compras = 'X'.
            out->write( |ALERTA: El proveedor { ls_status_proveedor-proveedor } | &&

                        |({ ls_status_proveedor-nombre_proveedor }) está BLOQUEADO. | &&
                        |No se puede procesar el pedido { ls_status_proveedor-nro_pedido }.| ).
        ELSE.
            out->write( |ÉXITO: Proveedor autorizado. Procediendo con el flujo de Procurement.| ).
        ENDIF.
    ENDMETHOD.
ENDCLASS.
