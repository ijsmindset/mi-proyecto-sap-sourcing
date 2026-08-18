- Proyecto SAP ABAP - Framework RAP (RESTful Application Programming)

Este repositorio contiene desarrollos de práctica realizados en un entorno SAP Cloud compartiendo el sistema L02_EN, bajo el paquete de usuario ZLOCAL_CB9980008564. El objetivo del proyecto es implementar un flujo completo de gestión de viajes utilizando la arquitectura moderna de desarrollo en SAP.

-- Componentes del Proyecto
El desarrollo implementa la arquitectura RAP utilizando el paquete específico ZRAP100_CB9980008564, el cual incluye:

* Core Data Services (CDS Views): Definición del modelo de datos de negocio y capas de proyección con anotaciones de interfaz de usuario (UI annotations) personalizadas para la gestión de viajes (Travels - by Ivan Jimenez).
* Business Services: Exposición del servicio mediante un Service Definition y un Service Binding OData v4 (ZUI_RAP100_ATRAV564_04) listo para su consumo.
* Lógica de Negocio (ABAP Classes): Clases controladoras, validaciones y procesamiento de datos (ZCL_MM_PROCESA_PEDIDOS, ZCL_MM_BUSCA_PEDIDOS_8564).

-- Interfaz de Usuario (SAP Fiori Elements)
El servicio OData v4 expuesto ha sido probado y validado mediante componentes estándar de SAP Fiori, generando una aplicación funcional que incluye:
* Filtros de búsqueda avanzados (Travel ID, Agency ID, Customer ID, Editing Status).
* Tabla de resultados dinámica con campos de control (Starting Date, End Date, Total Price, Overall Status).
* Acciones nativas del framework (Create, Delete).

-- Tecnologías Utilizadas
* SAP ABAP Cloud / RAP Framework
* ABAP Development Tools (ADT) en Eclipse IDE
* OData v4 Protocols
* SAP Fiori Elements
* Gestión de código fuente con abapGit
