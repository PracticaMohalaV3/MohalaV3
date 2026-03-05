-- =========================
-- Tabla Empresa
-- =========================

INSERT INTO EMPRESA 
    (ID_EMPRESA, NOMBRE_EMPRESA, RUT_EMPRESA, EMPRESA_ACTIVA, REGISTRADA_EN)
VALUES 
    (2, 'Permify SpA', '74.123.456-7', TRUE, NOW());

-- =========================
-- Tabla Departamento
-- =========================

INSERT INTO DEPARTAMENTO
    (ID_DEPARTAMENTO, NOMBRE_DEPARTAMENTO, EMPRESA_ID_EMPRESA)
VALUES
    (4, 'Gerencia General', 2),
    (5, 'Recursos Humanos', 2),
    (6, 'Tecnología de la Información', 2);

-- =========================
-- Tabla Nivel Jerarquico
-- =========================

INSERT INTO NIVEL_JERARQUICO
    (ID_NIVEL_JERARQUICO, NOMBRE_NIVEL_JERARQUICO, EMPRESA_ID_EMPRESA)
VALUES
    (4, 'Colaborador', 2),
    (5, 'Supervisor', 2),
    (6, 'Directivo', 2);

-- =========================
-- Tabla Escala
-- =========================

INSERT INTO ESCALA
    (ID_ESCALA, VALOR, DESCRIPCION, EMPRESA_ID_EMPRESA)
VALUES
    (5, 1, 'Desempeño Insuficiente', 2),
    (6, 2, 'Desempeño en Desarrollo', 2),
    (7, 3, 'Desempeño Satisfactorio', 2),
    (8, 4, 'Desempeño Sobresaliente', 2);

-- =========================
-- Tabla Dimension
-- =========================

INSERT INTO DIMENSION 
    (ID_DIMENSION, NOMBRE_DIMENSION, EMPRESA_ID_EMPRESA) 
VALUES 
    (3, 'Corporativas', 2),
    (4, 'Técnicas', 2);

-- =========================
-- Tabla Competencia
-- =========================

-- Competencias Corporativas (Dimension 3)
INSERT INTO COMPETENCIA 
    (ID_COMPETENCIA, NOMBRE_COMPETENCIA, DIMENSION_ID_DIMENSION, EMPRESA_ID_EMPRESA)    
VALUES
    (16, 'Innovación y Creatividad', 3, 2),
    (17, 'Orientación al Cliente', 3, 2),
    (18, 'Cultura Organizacional', 3, 2),
    (19, 'Colaboración', 3, 2),
    (20, 'Pensamiento Estratégico', 3, 2);

-- Competencias Técnicas (Dimension 4)
INSERT INTO COMPETENCIA 
    (ID_COMPETENCIA, NOMBRE_COMPETENCIA, DIMENSION_ID_DIMENSION, EMPRESA_ID_EMPRESA) 
VALUES
    (21, 'Resolución de Problemas', 4, 2),
    (22, 'Aprendizaje Continuo', 4, 2),
    (23, 'Comunicación Efectiva', 4, 2),
    (24, 'Gestión de la Innovación', 4, 2),
    (25, 'Liderazgo de Equipos', 4, 2),
    (26, 'Desarrollo de Personas', 4, 2),
    (27, 'Gestión de Resultados', 4, 2),
    (28, 'Logro de Objetivos', 4, 2),
    (29, 'Planificación y Control', 4, 2),
    (30, 'Iniciativa', 4, 2);
-- =========================
-- Tabla Cargo
-- =========================

-- Cargos Operativos (Nivel 4)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (7, 'Analista', 2, 4),
    (8, 'Asistente Administrativo', 2, 4);

-- Cargos Tácticos (Nivel 5)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (9, 'Jefe de Recursos Humanos', 2, 5),
    (10, 'Coordinador de Proyectos', 2, 5);

-- Cargos Estratégicos (Nivel 6)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (11, 'Gerente General', 2, 6),
    (12, 'Gerente de Innovación', 2, 6);

-- =========================
-- Tabla Textos Evaluación
-- =========================

-- 16. INNOVACIÓN Y CREATIVIDAD (ID_COMPETENCIA: 16)
INSERT INTO TEXTOS_EVALUACION 
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (28, 'ICC1.1', 'Texto de prueba empresa 2.', 2, 3, 16, 4),
    (29, 'ICC1.2', 'Texto de prueba empresa 2.', 2, 3, 16, 4),
    (30, 'ICC1.3', 'Texto de prueba empresa 2.', 2, 3, 16, 4),
    (31, 'ICS1.1', 'Texto de prueba empresa 2.', 2, 3, 16, 5),
    (32, 'ICS1.2', 'Texto de prueba empresa 2.', 2, 3, 16, 5),
    (33, 'ICS1.3', 'Texto de prueba empresa 2.', 2, 3, 16, 5),
    (34, 'ICD1.1', 'Texto de prueba empresa 2.', 2, 3, 16, 6),
    (35, 'ICD1.2', 'Texto de prueba empresa 2.', 2, 3, 16, 6),
    (36, 'ICD1.3', 'Texto de prueba empresa 2.', 2, 3, 16, 6);

-- 17. ORIENTACIÓN AL CLIENTE (ID_COMPETENCIA: 17)
INSERT INTO TEXTOS_EVALUACION 
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (37, 'OCC1.1', 'Texto de prueba empresa 2.', 2, 3, 17, 4),
    (38, 'OCC1.2', 'Texto de prueba empresa 2.', 2, 3, 17, 4),
    (39, 'OCC1.3', 'Texto de prueba empresa 2.', 2, 3, 17, 4),
    (40, 'OCS1.1', 'Texto de prueba empresa 2.', 2, 3, 17, 5),
    (41, 'OCS1.2', 'Texto de prueba empresa 2.', 2, 3, 17, 5),
    (42, 'OCS1.3', 'Texto de prueba empresa 2.', 2, 3, 17, 5),
    (43, 'OCD1.1', 'Texto de prueba empresa 2.', 2, 3, 17, 6),
    (44, 'OCD1.2', 'Texto de prueba empresa 2.', 2, 3, 17, 6),
    (45, 'OCD1.3', 'Texto de prueba empresa 2.', 2, 3, 17, 6);

-- 21. RESOLUCIÓN DE PROBLEMAS (ID_COMPETENCIA: 21)
INSERT INTO TEXTOS_EVALUACION 
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (46, 'RPC1.1', 'Texto de prueba empresa 2.', 2, 4, 21, 4),
    (47, 'RPC1.2', 'Texto de prueba empresa 2.', 2, 4, 21, 4),
    (48, 'RPC1.3', 'Texto de prueba empresa 2.', 2, 4, 21, 4),
    (49, 'RPS1.1', 'Texto de prueba empresa 2.', 2, 4, 21, 5),
    (50, 'RPS1.2', 'Texto de prueba empresa 2.', 2, 4, 21, 5),
    (51, 'RPS1.3', 'Texto de prueba empresa 2.', 2, 4, 21, 5),
    (52, 'RPD1.1', 'Texto de prueba empresa 2.', 2, 4, 21, 6),
    (53, 'RPD1.2', 'Texto de prueba empresa 2.', 2, 4, 21, 6),
    (54, 'RPD1.3', 'Texto de prueba empresa 2.', 2, 4, 21, 6);


-- =========================
-- Tabla Código Evaluación
-- =========================

INSERT INTO CODIGO_EVALUACION
    (ID_CODIGO_EVALUACION, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, TEXTOS_EVALUACION_CODIGO_EXCEL, TEXTOS_EVALUACION_EMPRESA_ID_EMPRESA)
VALUES
    -- Innovación y Creatividad: Colaborador
    (28, 2, 3, 16, 4, 'ICC1.1', 2),
    (29, 2, 3, 16, 4, 'ICC1.2', 2),
    (30, 2, 3, 16, 4, 'ICC1.3', 2),
    -- Innovación y Creatividad: Supervisor
    (31, 2, 3, 16, 5, 'ICS1.1', 2),
    (32, 2, 3, 16, 5, 'ICS1.2', 2),
    (33, 2, 3, 16, 5, 'ICS1.3', 2),
    -- Innovación y Creatividad: Directivo
    (34, 2, 3, 16, 6, 'ICD1.1', 2),
    (35, 2, 3, 16, 6, 'ICD1.2', 2),
    (36, 2, 3, 16, 6, 'ICD1.3', 2),
    -- Orientación al Cliente: Colaborador
    (37, 2, 3, 17, 4, 'OCC1.1', 2),
    (38, 2, 3, 17, 4, 'OCC1.2', 2),
    (39, 2, 3, 17, 4, 'OCC1.3', 2),
    -- Orientación al Cliente: Supervisor
    (40, 2, 3, 17, 5, 'OCS1.1', 2),
    (41, 2, 3, 17, 5, 'OCS1.2', 2),
    (42, 2, 3, 17, 5, 'OCS1.3', 2),
    -- Orientación al Cliente: Directivo
    (43, 2, 3, 17, 6, 'OCD1.1', 2),
    (44, 2, 3, 17, 6, 'OCD1.2', 2),
    (45, 2, 3, 17, 6, 'OCD1.3', 2),
    -- Resolución de Problemas: Colaborador
    (46, 2, 4, 21, 4, 'RPC1.1', 2),
    (47, 2, 4, 21, 4, 'RPC1.2', 2),
    (48, 2, 4, 21, 4, 'RPC1.3', 2),
    -- Resolución de Problemas: Supervisor
    (49, 2, 4, 21, 5, 'RPS1.1', 2),
    (50, 2, 4, 21, 5, 'RPS1.2', 2),
    (51, 2, 4, 21, 5, 'RPS1.3', 2),
    -- Resolución de Problemas: Directivo
    (52, 2, 4, 21, 6, 'RPD1.1', 2),
    (53, 2, 4, 21, 6, 'RPD1.2', 2),
    (54, 2, 4, 21, 6, 'RPD1.3', 2);

-- =========================
-- Tabla Descripción Respuesta
-- =========================

-- Competencia: Innovación y Creatividad / Nivel: Colaborador

-- ICC1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (109, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICC1.1', 5),
    (110, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICC1.1', 6),
    (111, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICC1.1', 7),
    (112, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICC1.1', 8);

-- ICC1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (113, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICC1.2', 5),
    (114, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICC1.2', 6),
    (115, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICC1.2', 7),
    (116, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICC1.2', 8);

-- ICC1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (117, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICC1.3', 5),
    (118, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICC1.3', 6),
    (119, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICC1.3', 7),
    (120, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICC1.3', 8);

-- Competencia: Innovación y Creatividad / Nivel: Supervisor

-- ICS1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (121, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICS1.1', 5),
    (122, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICS1.1', 6),
    (123, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICS1.1', 7),
    (124, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICS1.1', 8);

-- ICS1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (125, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICS1.2', 5),
    (126, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICS1.2', 6),
    (127, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICS1.2', 7),
    (128, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICS1.2', 8);

-- ICS1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (129, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICS1.3', 5),
    (130, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICS1.3', 6),
    (131, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICS1.3', 7),
    (132, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICS1.3', 8);

-- Competencia: Innovación y Creatividad / Nivel: Directivo

-- ICD1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (133, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICD1.1', 5),
    (134, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICD1.1', 6),
    (135, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICD1.1', 7),
    (136, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICD1.1', 8);

-- ICD1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (137, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICD1.2', 5),
    (138, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICD1.2', 6),
    (139, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICD1.2', 7),
    (140, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICD1.2', 8);

-- ICD1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (141, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'ICD1.3', 5),
    (142, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'ICD1.3', 6),
    (143, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'ICD1.3', 7),
    (144, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'ICD1.3', 8);

-- Competencia: Orientación al Cliente / Nivel: Colaborador

-- OCC1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (145, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCC1.1', 5),
    (146, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCC1.1', 6),
    (147, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCC1.1', 7),
    (148, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCC1.1', 8);

-- OCC1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (149, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCC1.2', 5),
    (150, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCC1.2', 6),
    (151, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCC1.2', 7),
    (152, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCC1.2', 8);

-- OCC1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (153, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCC1.3', 5),
    (154, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCC1.3', 6),
    (155, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCC1.3', 7),
    (156, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCC1.3', 8);

-- Competencia: Orientación al Cliente / Nivel: Supervisor

-- OCS1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (157, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCS1.1', 5),
    (158, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCS1.1', 6),
    (159, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCS1.1', 7),
    (160, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCS1.1', 8);

-- OCS1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (161, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCS1.2', 5),
    (162, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCS1.2', 6),
    (163, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCS1.2', 7),
    (164, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCS1.2', 8);

-- OCS1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (165, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCS1.3', 5),
    (166, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCS1.3', 6),
    (167, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCS1.3', 7),
    (168, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCS1.3', 8);

-- Competencia: Orientación al Cliente / Nivel: Directivo

-- OCD1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (169, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCD1.1', 5),
    (170, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCD1.1', 6),
    (171, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCD1.1', 7),
    (172, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCD1.1', 8);

-- OCD1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (173, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCD1.2', 5),
    (174, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCD1.2', 6),
    (175, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCD1.2', 7),
    (176, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCD1.2', 8);

-- OCD1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (177, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'OCD1.3', 5),
    (178, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'OCD1.3', 6),
    (179, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'OCD1.3', 7),
    (180, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'OCD1.3', 8);

-- Competencia: Resolución de Problemas / Nivel: Colaborador

-- RPC1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (181, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPC1.1', 5),
    (182, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPC1.1', 6),
    (183, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPC1.1', 7),
    (184, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPC1.1', 8);

-- RPC1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (185, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPC1.2', 5),
    (186, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPC1.2', 6),
    (187, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPC1.2', 7),
    (188, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPC1.2', 8);

-- RPC1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (189, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPC1.3', 5),
    (190, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPC1.3', 6),
    (191, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPC1.3', 7),
    (192, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPC1.3', 8);

-- Competencia: Resolución de Problemas / Nivel: Supervisor

-- RPS1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (193, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPS1.1', 5),
    (194, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPS1.1', 6),
    (195, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPS1.1', 7),
    (196, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPS1.1', 8);

-- RPS1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (197, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPS1.2', 5),
    (198, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPS1.2', 6),
    (199, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPS1.2', 7),
    (200, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPS1.2', 8);

-- RPS1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (201, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPS1.3', 5),
    (202, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPS1.3', 6),
    (203, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPS1.3', 7),
    (204, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPS1.3', 8);

-- Competencia: Resolución de Problemas / Nivel: Directivo

-- RPD1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (205, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPD1.1', 5),
    (206, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPD1.1', 6),
    (207, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPD1.1', 7),
    (208, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPD1.1', 8);

-- RPD1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (209, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPD1.2', 5),
    (210, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPD1.2', 6),
    (211, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPD1.2', 7),
    (212, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPD1.2', 8);

-- RPD1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (213, 'Desempeño Insuficiente', 'No cumple estándares empresa 2.', 2, 'RPD1.3', 5),
    (214, 'Desempeño en Desarrollo', 'Cumple estándares de manera incompleta en empresa 2.', 2, 'RPD1.3', 6),
    (215, 'Desempeño Satisfactorio', 'Cumple de manera consistente en empresa 2.', 2, 'RPD1.3', 7),
    (216, 'Desempeño Sobresaliente', 'Supera de forma sostenida lo esperado en empresa 2.', 2, 'RPD1.3', 8);

-- =========================
-- Tabla Trabajador
-- =========================

-- NIVEL 3: Directivo (No tienen Jefe)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (7, '14.123.456-1', NULL, 'Carlos', 'Fuentes', 'Mora', 'c.fuentes@permify.cl', 'Masculino', 2, 6, 11, 4),
    (8, '15.234.567-2', NULL, 'Daniela', 'Vega', 'Soto', 'd.vega@permify.cl', 'Femenino', 2, 6, 12, 4);

-- NIVEL 2: Supervisor (Reportan al ID 7 y 8)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (9, '16.345.678-3', 7, 'Felipe', 'Rojas', 'Lima', 'f.rojas@permify.cl', 'Masculino', 2, 5, 9, 5),
    (10, '17.456.789-4', 8, 'Camila', 'Núñez', 'Ríos', 'c.nunez@permify.cl', 'Femenino', 2, 5, 10, 6);

-- NIVEL 1: Colaborador (Reportan al ID 9 y 10)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (11, '18.567.890-5', 9, 'Ignacio', 'Pérez', 'Blanc', 'i.perez@permify.cl', 'Masculino', 2, 4, 7, 6),
    (12, '19.678.901-6', 10, 'Javiera', 'Muñoz', 'Cerda', 'j.munoz@permify.cl', 'Femenino', 2, 4, 8, 5);
