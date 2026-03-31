-- =========================
-- Tabla empresa
-- =========================
INSERT INTO empresa 
    (id_empresa, nombre_empresa, rut_empresa, empresa_activa, registrada_en)
VALUES 
    (1, 'Mohala SpA', '76.123.456-7', TRUE, NOW());

-- =========================
-- Tabla departamento
-- =========================
INSERT INTO departamento
    (id_departamento, nombre_departamento, empresa_id_empresa)
VALUES
    (1, 'Gerencia General', 1),
    (2, 'Recursos Humanos', 1),
    (3, 'Tecnología de la Información', 1);

-- =========================
-- Tabla nivel_jerarquico
-- =========================
INSERT INTO nivel_jerarquico
    (id_nivel_jerarquico, nombre_nivel_jerarquico, empresa_id_empresa)
VALUES
    (1, 'Operativo', 1),
    (2, 'Táctico', 1),
    (3, 'Estratégico', 1);

-- =========================
-- Tabla escala
-- =========================
INSERT INTO escala
    (id_escala, valor, titulo, descripcion, empresa_id_empresa)
VALUES
    (1, 1, 'No Logra lo Esperado', 'No cumple con los comportamientos mínimos.', 1),
    (2, 2, 'Logra Parcialmente lo Esperado', 'Cumple de forma inconsistente.', 1),
    (3, 3, 'Logra lo Esperado', 'Cumple de manera consistente.', 1),
    (4, 4, 'Supera lo Esperado', 'Supera resultados y agrega valor.', 1);

-- =========================
-- Tabla dimension
-- =========================
INSERT INTO dimension 
    (id_dimension, nombre_dimension, empresa_id_empresa) 
VALUES 
    (1, 'Organizacionales', 1),
    (2, 'Funcionales', 1);

-- =========================
-- Tabla competencia
-- =========================
INSERT INTO competencia 
    (id_competencia, nombre_competencia, dimension_id_dimension, empresa_id_empresa)    
VALUES
    (1, 'Creatividad e Innovación', 1, 1),
    (2, 'Enfoque de Negocio', 1, 1),
    (3, 'Identificación Cultural', 1, 1),
    (4, 'Trabajo en Equipo', 1, 1),
    (5, 'Visión Global y Sistemática', 1, 1),
    (6, 'Análisis y Solución de Problemas', 2, 1),
    (7, 'Aprendizaje e Innovación', 2, 1),
    (8, 'Comunicación', 2, 1),
    (9, 'Innovación', 2, 1),
    (10, 'Liderazgo', 2, 1),
    (11, 'Liderazgo y Desarrollo de Equipos', 2, 1),
    (12, 'Orientación a la Rentabilidad', 2, 1),
    (13, 'Orientación al Logro', 2, 1),
    (14, 'Planificación Estratégica', 2, 1),
    (15, 'Proactividad', 2, 1);

-- =========================
-- Tabla cargo
-- =========================
INSERT INTO cargo 
    (id_cargo, nombre_cargo, empresa_id_empresa, nivel_jerarquico_id_nivel_jerarquico) 
VALUES
    (1, 'Analista', 1, 1),
    (2, 'Asistente Administrativo', 1, 1),
    (3, 'Jefe de Recursos Humanos', 1, 2),
    (4, 'Coordinador de Proyectos', 1, 2),
    (5, 'Gerente General', 1, 3),
    (6, 'Gerente de Innovación', 1, 3);

-- =========================
-- Tabla textos_evaluacion
-- =========================
INSERT INTO textos_evaluacion 
    (id_textos_evaluacion, codigo_excel, texto, empresa_id_empresa, dimension_id_dimension, competencia_id_competencia, nivel_jerarquico_id_nivel_jerarquico) 
VALUES 
    (1, 'CIO1.1', 'Trabaja con mecanismos conocidos y rutinarios.', 1, 1, 1, 1),
    (2, 'CIO1.2', 'Se mueve con facilidad en situaciones conocidas.', 1, 1, 1, 1),
    (3, 'CIO1.3', 'Implementa ideas y soluciones.', 1, 1, 1, 1),
    (4, 'CIT1.1', 'Promueve un estilo de gestión innovador.', 1, 1, 1, 2),
    (5, 'CIT1.2', 'Estructura equipos de alto rendimiento.', 1, 1, 1, 2),
    (6, 'CIT1.3', 'Lidera la implementación de nuevas ideas.', 1, 1, 1, 2),
    (7, 'CIE1.1', 'Es consultado por pares y subordinados.', 1, 1, 1, 3),
    (8, 'CIE1.2', 'Es intelectualmente curioso.', 1, 1, 1, 3),
    (9, 'CIE1.3', 'Plantea mejoras o soluciones nuevas.', 1, 1, 1, 3),
    (10, 'ENO2.1', 'Comprende las peculiaridades de los servicios.', 1, 1, 2, 1),
    (11, 'ENO2.2', 'Conoce las estrategias corporativas.', 1, 1, 2, 1),
    (12, 'ENO2.3', 'Invierte tiempo adicional para identificar oportunidades.', 1, 1, 2, 1),
    (13, 'ENT2.1', 'Establece relaciones interpersonales.', 1, 1, 2, 2),
    (14, 'ENT2.2', 'Se adapta rápidamente.', 1, 1, 2, 2),
    (15, 'ENT2.3', 'Promueve la capacidad de comprender servicios.', 1, 1, 2, 2),
    (16, 'ENE2.1', 'Desarrolla capacidad de adecuar productos.', 1, 1, 2, 3),
    (17, 'ENE2.2', 'Referente en identificar oportunidades.', 1, 1, 2, 3),
    (18, 'ENE2.3', 'Reconocido por su expertise.', 1, 1, 2, 3),
    (19, 'ASO1.1', 'Resuelve problemas rutinarios.', 1, 2, 6, 1),
    (20, 'ASO1.2', 'Acude a sus superiores.', 1, 2, 6, 1),
    (21, 'ASO1.3', 'Detecta variables oportunamente.', 1, 2, 6, 1),
    (22, 'AST1.1', 'Utiliza datos históricos.', 1, 2, 6, 2),
    (23, 'AST1.2', 'Analiza relaciones entre partes.', 1, 2, 6, 2),
    (24, 'AST1.3', 'Aporta soluciones válidas.', 1, 2, 6, 2),
    (25, 'ASE1.1', 'Realiza análisis complejos.', 1, 2, 6, 3),
    (26, 'ASE1.2', 'Comprende problemas complejos.', 1, 2, 6, 3),
    (27, 'ASE1.3', 'Se anticipa a las situaciones.', 1, 2, 6, 3);

-- =========================
-- Tabla codigo_evaluacion
-- =========================
INSERT INTO codigo_evaluacion
    (id_codigo_evaluacion, empresa_id_empresa, dimension_id_dimension, competencia_id_competencia, nivel_jerarquico_id_nivel_jerarquico, textos_evaluacion_codigo_excel, textos_evaluacion_empresa_id_empresa)
VALUES
    (1, 1, 1, 1, 1, 'CIO1.1', 1), (2, 1, 1, 1, 1, 'CIO1.2', 1), (3, 1, 1, 1, 1, 'CIO1.3', 1),
    (4, 1, 1, 1, 2, 'CIT1.1', 1), (5, 1, 1, 1, 2, 'CIT1.2', 1), (6, 1, 1, 1, 2, 'CIT1.3', 1),
    (7, 1, 1, 1, 3, 'CIE1.1', 1), (8, 1, 1, 1, 3, 'CIE1.2', 1), (9, 1, 1, 1, 3, 'CIE1.3', 1),
    (10, 1, 1, 2, 1, 'ENO2.1', 1), (11, 1, 1, 2, 1, 'ENO2.2', 1), (12, 1, 1, 2, 1, 'ENO2.3', 1),
    (13, 1, 1, 2, 2, 'ENT2.1', 1), (14, 1, 1, 2, 2, 'ENT2.2', 1), (15, 1, 1, 2, 2, 'ENT2.3', 1),
    (16, 1, 1, 2, 3, 'ENE2.1', 1), (17, 1, 1, 2, 3, 'ENE2.2', 1), (18, 1, 1, 2, 3, 'ENE2.3', 1),
    (19, 1, 2, 6, 1, 'ASO1.1', 1), (20, 1, 2, 6, 1, 'ASO1.2', 1), (21, 1, 2, 6, 1, 'ASO1.3', 1),
    (22, 1, 2, 6, 2, 'AST1.1', 1), (23, 1, 2, 6, 2, 'AST1.2', 1), (24, 1, 2, 6, 2, 'AST1.3', 1),
    (25, 1, 2, 6, 3, 'ASE1.1', 1), (26, 1, 2, 6, 3, 'ASE1.2', 1), (27, 1, 2, 6, 3, 'ASE1.3', 1);

-- =========================
-- Tabla trabajador
-- =========================
INSERT INTO trabajador 
    (id_trabajador, rut, id_jefe_directo, nombre, apellido_paterno, apellido_materno, email, genero, es_coordinador, empresa_id_empresa, nivel_jerarquico_id_nivel_jerarquico, cargo_id_cargo, departamento_id_departamento)
VALUES 
    (1, '10.234.567-1', NULL, 'Roberto', 'Méndez', 'Castro', 'r.mendez@mohala.cl', 'Masculino', FALSE, 1, 3, 5, 1),
    (2, '12.456.789-2', NULL, 'Patricia', 'Lorca', 'Vial', 'p.lorca@mohala.cl', 'Femenino', TRUE, 1, 3, 6, 1),
    (3, '13.567.890-4', 1, 'Mónica', 'Sánchez', 'Paz', 'm.sanchez@mohala.cl', 'Femenino', FALSE, 1, 2, 4, 3),
    (4, '11.345.678-3', 2, 'Andrés', 'Tapia', 'Ruiz', 'a.tapia@mohala.cl', 'Masculino', FALSE, 1, 2, 3, 2),
    (5, '18.456.789-9', 3, 'Valeria', 'Cáceres', 'Pinto', 'v.caceres@mohala.cl', 'Femenino', FALSE, 1, 1, 1, 3),
    (6, '19.567.890-0', 4, 'Sebastián', 'Marín', 'Rojas', 's.marin@mohala.cl', 'Masculino', FALSE, 1, 1, 2, 2);

-- ==========================================================
-- Sincronizar secuencias (IMPORTANTE para PostgreSQL)
-- ==========================================================
SELECT setval('empresa_id_empresa_seq', (SELECT MAX(id_empresa) FROM empresa));
SELECT setval('departamento_id_departamento_seq', (SELECT MAX(id_departamento) FROM departamento));
SELECT setval('nivel_jerarquico_id_nivel_jerarquico_seq', (SELECT MAX(id_nivel_jerarquico) FROM nivel_jerarquico));
SELECT setval('escala_id_escala_seq', (SELECT MAX(id_escala) FROM escala));
SELECT setval('dimension_id_dimension_seq', (SELECT MAX(id_dimension) FROM dimension));
SELECT setval('competencia_id_competencia_seq', (SELECT MAX(id_competencia) FROM competencia));
SELECT setval('cargo_id_cargo_seq', (SELECT MAX(id_cargo) FROM cargo));
SELECT setval('textos_evaluacion_id_textos_evaluacion_seq', (SELECT MAX(id_textos_evaluacion) FROM textos_evaluacion));
SELECT setval('codigo_evaluacion_id_codigo_evaluacion_seq', (SELECT MAX(id_codigo_evaluacion) FROM codigo_evaluacion));
SELECT setval('trabajador_id_trabajador_seq', (SELECT MAX(id_trabajador) FROM trabajador));