-- =========================
-- Tabla Empresa
-- =========================

INSERT INTO EMPRESA 
    (ID_EMPRESA, NOMBRE_EMPRESA, RUT_EMPRESA, EMPRESA_ACTIVA, REGISTRADA_EN)
VALUES 
    (1, 'Mohala SpA', '76.123.456-7', TRUE, NOW());

-- =========================
-- Tabla Departamento
-- =========================

INSERT INTO DEPARTAMENTO
    (ID_DEPARTAMENTO, NOMBRE_DEPARTAMENTO, EMPRESA_ID_EMPRESA)
VALUES
    (1, 'Gerencia General', 1),
    (2, 'Recursos Humanos', 1),
    (3, 'Tecnología de la Información', 1);

-- =========================
-- Tabla Nivel Jerarquico
-- =========================

INSERT INTO NIVEL_JERARQUICO
    (ID_NIVEL_JERARQUICO, NOMBRE_NIVEL_JERARQUICO, EMPRESA_ID_EMPRESA)
VALUES
    (1, 'Operativo', 1),
    (2, 'Táctico', 1),
    (3, 'Estratégico', 1);

-- =========================
-- Tabla Escala
-- =========================

INSERT INTO ESCALA
    (ID_ESCALA, VALOR, DESCRIPCION, EMPRESA_ID_EMPRESA)
VALUES
    (1, 1, 'No Logra lo Esperado', 1),
    (2, 2, 'Logra Parcialmente lo Esperado', 1),
    (3, 3, 'Logra lo Esperado', 1),
    (4, 4, 'Supera lo Esperado', 1);

-- =========================
-- Tabla Dimension
-- =========================

INSERT INTO DIMENSION 
    (ID_DIMENSION, NOMBRE_DIMENSION, EMPRESA_ID_EMPRESA) 
VALUES 
    (1, 'Organizacionales', 1),
    (2, 'Funcionales', 1);

-- =========================
-- Tabla Competencia
-- =========================

-- Competencias Organizacionales (Dimension 1)
INSERT INTO COMPETENCIA 
    (ID_COMPETENCIA, NOMBRE_COMPETENCIA, DIMENSION_ID_DIMENSION, EMPRESA_ID_EMPRESA)    
VALUES
    (1, 'Creatividad e Innovación', 1, 1),
    (2, 'Enfoque de Negocio', 1, 1),
    (3, 'Identificación Cultural', 1, 1),
    (4, 'Trabajo en Equipo', 1, 1),
    (5, 'Visión Global y Sistemática', 1, 1);

-- Competencias Funcionales (Dimension 2)
INSERT INTO COMPETENCIA 
    (ID_COMPETENCIA, NOMBRE_COMPETENCIA, DIMENSION_ID_DIMENSION, EMPRESA_ID_EMPRESA) 
VALUES
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
-- Tabla Cargo
-- =========================

-- Cargos Operativos (Nivel 1)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (1, 'Analista', 1, 1),
    (2, 'Asistente Administrativo', 1, 1);

-- Cargos Tácticos (Nivel 2)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (3, 'Jefe de Recursos Humanos', 1, 2),
    (4, 'Coordinador de Proyectos', 1, 2);

-- Cargos Estratégicos (Nivel 3)
INSERT INTO CARGO 
    (ID_CARGO, NOMBRE_CARGO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES
    (5, 'Gerente General', 1, 3),
    (6, 'Gerente de Innovación', 1, 3);

-- =========================
-- Tabla Textos Evaluación
-- =========================

-- 1. CREATIVIDAD E INNOVACIÓN (ID_COMPETENCIA: 1)
INSERT INTO TEXTOS_EVALUACION 
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (1, 'CIO1.1', 'Trabaja con mecanismos conocidos y rutinarios.', 1, 1, 1, 1),
    (2, 'CIO1.2', 'Se mueve con facilidad en situaciones conocidas con pautas de acción prefijadas.', 1, 1, 1, 1),
    (3, 'CIO1.3', 'Implementa ideas y soluciones que le permiten resolver situaciones rutinarias y complejas.', 1, 1, 1, 1),
    (4, 'CIT1.1', 'Promueve un estilo de gestión innovador y de vinculación con su entorno, brindando a su equipo herramientas para que trabajen con el mismo enfoque.', 1, 1, 1, 2),
    (5, 'CIT1.2', 'Estructura equipos de alto rendimiento, que suelen tener formatos atípicos utilizando las formas más adecuadas para la consecución de sus objetivos.', 1, 1, 1, 2),
    (6, 'CIT1.3', 'Lidera la implementación de nuevas ideas y soluciones dentro del negocio, es requerido por su aporte de creatividad y visión innovadora, que le permiten resolver situaciones complejas que otros no han podido solucionar.', 1, 1, 1, 2),
    (7, 'CIE1.1', 'Es consultado por pares y subordinados porque se le reconoce por su habilidad de abordar desde nuevos enfoques los problemas y dificultades, pudiendo plantear alternativas impensadas.', 1, 1, 1, 3),
    (8, 'CIE1.2', 'Es intelectualmente curioso, le gusta estar informado y mantenerse en constante aprendizaje para aplicar los conocimientos a la organización.', 1, 1, 1, 3),
    (9, 'CIE1.3', 'Plantea mejoras o soluciones nuevas a problemas sencillos y complejos, garantizando su efectividad y calidad.', 1, 1, 1, 3);

-- 2. ENFOQUE DE NEGOCIO (ID_COMPETENCIA: 2)
INSERT INTO TEXTOS_EVALUACION 
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (10, 'ENO2.1', 'Comprende las peculiaridades de los servicios.', 1, 1, 2, 1),
    (11, 'ENO2.2', 'Conoce las estrategias, principios y valores corporativos.', 1, 1, 2, 1),
    (12, 'ENO2.3', 'Invierte tiempo adicional para identificar y capturar oportunidades de crecimiento y desarrollo de la empresa.', 1, 1, 2, 1),
    (13, 'ENT2.1', 'Es capaz de establecer relaciones interpersonales en cualquier contexto, promoviendo los servicios a través del networking.', 1, 1, 2, 2),
    (14, 'ENT2.2', 'Es hábil para adaptarse rápidamente y funcionar con eficacia en nuevos contextos laborales.', 1, 1, 2, 2),
    (15, 'ENT2.3', 'Promueve en todas las áreas de trabajo, la capacidad para comprender las peculiaridades de los servicios.', 1, 1, 2, 2),
    (16, 'ENE2.1', 'Desarrolla dentro y fuera de la organización la capacidad de adecuar productos, servicios y procedimientos organizacionales, a fin de amoldarse a nuevos contextos de acuerdo con la estrategia del negocio.', 1, 1, 2, 3),
    (17, 'ENE2.2', 'Es un referente dentro y fuera de la organización por su capacidad de identificar y desarrollar oportunidades de negocio.', 1, 1, 2, 3),
    (18, 'ENE2.3', 'Es reconocido por su expertise, su alto conocimiento cultural y estrategias de relacionamiento.', 1, 1, 2, 3);

-- 6. ANÁLISIS Y SOLUCIÓN DE PROBLEMAS (ID_COMPETENCIA: 6) 
INSERT INTO TEXTOS_EVALUACION  
    (ID_TEXTOS_EVALUACION, CODIGO_EXCEL, TEXTO, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO) 
VALUES 
    (19, 'ASO1.1', 'Resuelve problemas rutinarios de forma efectiva.', 1, 2, 6, 1),
    (20, 'ASO1.2', 'Acude a sus superiores o pares para crear alternativas que le permitan resolver los problemas con mayor grado de dificultad.', 1, 2, 6, 1),
    (21, 'ASO1.3', 'Logra detectar las variables que influyen en el problema de forma oportuna.', 1, 2, 6, 1),
    (22, 'AST1.1', 'Utiliza eficazmente datos históricos y actuales como ayuda para prever tendencias futuras, siendo efectivo en crear contingencias para que no afecten los resultados.', 1, 2, 6, 2),
    (23, 'AST1.2', 'Analiza las relaciones entre las distintas partes y causales de un problema, anticipándose a los obstáculos y creando alternativas.', 1, 2, 6, 2),
    (24, 'AST1.3', 'Aporta soluciones validas para la situación en tiempo y forma, responsabilizándose de ellas.', 1, 2, 6, 2),
    (25, 'ASE1.1', 'Realiza análisis complejos utilizando hipótesis y diferentes escenarios, logrando rescatar los aspectos más significativos.', 1, 2, 6, 3),
    (26, 'ASE1.2', 'Comprende problemas complejos y los define en torno a principios y estrategias organizacionales.', 1, 2, 6, 3),
    (27, 'ASE1.3', 'Se anticipa a las situaciones, previendo y planteando respuestas adecuadas y rentables antes que se presente la situación. ', 1, 2, 6, 3);


-- =========================
-- Tabla Código Evaluación
-- =========================

INSERT INTO CODIGO_EVALUACION
    (ID_CODIGO_EVALUACION, EMPRESA_ID_EMPRESA, DIMENSION_ID_DIMENSION, COMPETENCIA_ID_COMPETENCIA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, TEXTOS_EVALUACION_CODIGO_EXCEL, TEXTOS_EVALUACION_EMPRESA_ID_EMPRESA)
VALUES
    -- Creatividad e Innovación: Operativo
    (1,  1, 1, 1, 1, 'CIO1.1', 1),
    (2,  1, 1, 1, 1, 'CIO1.2', 1),
    (3,  1, 1, 1, 1, 'CIO1.3', 1),
    -- Creatividad e Innovación: Táctico
    (4,  1, 1, 1, 2, 'CIT1.1', 1),
    (5,  1, 1, 1, 2, 'CIT1.2', 1),
    (6,  1, 1, 1, 2, 'CIT1.3', 1),
    -- Creatividad e Innovación: Estratégico
    (7,  1, 1, 1, 3, 'CIE1.1', 1),
    (8,  1, 1, 1, 3, 'CIE1.2', 1),
    (9,  1, 1, 1, 3, 'CIE1.3', 1),
    -- Enfoque de Negocio: Operativo
    (10, 1, 1, 2, 1, 'ENO2.1', 1),
    (11, 1, 1, 2, 1, 'ENO2.2', 1),
    (12, 1, 1, 2, 1, 'ENO2.3', 1),
    -- Enfoque de Negocio: Táctico
    (13, 1, 1, 2, 2, 'ENT2.1', 1),
    (14, 1, 1, 2, 2, 'ENT2.2', 1),
    (15, 1, 1, 2, 2, 'ENT2.3', 1),
    -- Enfoque de Negocio: Estratégico
    (16, 1, 1, 2, 3, 'ENE2.1', 1),
    (17, 1, 1, 2, 3, 'ENE2.2', 1),
    (18, 1, 1, 2, 3, 'ENE2.3', 1),
    -- Análisis y Solución de Problemas: Operativo
    (19, 1, 2, 6, 1, 'ASO1.1', 1),
    (20, 1, 2, 6, 1, 'ASO1.2', 1),
    (21, 1, 2, 6, 1, 'ASO1.3', 1),
    -- Análisis y Solución de Problemas: Táctico
    (22, 1, 2, 6, 2, 'AST1.1', 1),
    (23, 1, 2, 6, 2, 'AST1.2', 1),
    (24, 1, 2, 6, 2, 'AST1.3', 1),
    -- Análisis y Solución de Problemas: Estratégico
    (25, 1, 2, 6, 3, 'ASE1.1', 1),
    (26, 1, 2, 6, 3, 'ASE1.2', 1),
    (27, 1, 2, 6, 3, 'ASE1.3', 1);

-- =========================
-- Tabla Descripción Respuesta
-- =========================

-- Competencia: Creatividad / Nivel: Operativo

-- CIO1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (1, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIO1.1', 1),
    (2, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.1', 2),
    (3, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.1', 3),
    (4, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIO1.1', 4);

-- CIO1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (5, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIO1.2', 1),
    (6, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.2', 2),
    (7, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.2', 3),
    (8, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIO1.2', 4);

-- CIO1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (9, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIO1.3', 1),
    (10, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.3', 2),
    (11, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIO1.3', 3),
    (12, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIO1.3', 4);

-- Competencia: Creatividad / Nivel: Táctico

-- CIT1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (13, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIT1.1', 1),
    (14, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.1', 2),
    (15, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.1', 3),
    (16, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIT1.1', 4);

-- CIT1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (17, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIT1.2', 1),
    (18, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.2', 2),
    (19, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.2', 3),
    (20, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIT1.2', 4);

-- CIT1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (21, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIT1.3', 1),
    (22, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.3', 2),
    (23, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIT1.3', 3),
    (24, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIT1.3', 4);

-- Competencia: Creatividad / Nivel: Estratégico

-- CIE1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (25, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIE1.1', 1),
    (26, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.1', 2),
    (27, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.1', 3),
    (28, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIE1.1', 4);

-- CIE1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (29, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIE1.2', 1),
    (30, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.2', 2),
    (31, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.2', 3),
    (32, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIE1.2', 4);

-- CIE1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (33, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'CIE1.3', 1),
    (34, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.3', 2),
    (35, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'CIE1.3', 3),
    (36, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'CIE1.3', 4);

-- Competencia: Enfoque de Negocio / Nivel: Operativo

-- ENO2.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (37, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENO2.1', 1),
    (38, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.1', 2),
    (39, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.1', 3),
    (40, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENO2.1', 4);

-- ENO2.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (41, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENO2.2', 1),
    (42, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.2', 2),
    (43, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.2', 3),
    (44, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENO2.2', 4);

-- ENO2.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (45, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENO2.3', 1),
    (46, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.3', 2),
    (47, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENO2.3', 3),
    (48, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENO2.3', 4);

-- Competencia: Enfoque de Negocio / Nivel: Táctico

-- ENT2.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (49, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENT2.1', 1),
    (50, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.1', 2),
    (51, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.1', 3),
    (52, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENT2.1', 4);

-- ENT2.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (53, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENT2.2', 1),
    (54, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.2', 2),
    (55, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.2', 3),
    (56, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENT2.2', 4);

-- ENT2.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (57, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENT2.3', 1),
    (58, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.3', 2),
    (59, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENT2.3', 3),
    (60, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENT2.3', 4);

-- Competencia: Enfoque de Negocio / Nivel: Estratégico

-- ENE2.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (61, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENE2.1', 1),
    (62, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.1', 2),
    (63, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.1', 3),
    (64, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENE2.1', 4);

-- ENE2.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (65, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENE2.2', 1),
    (66, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.2', 2),
    (67, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.2', 3),
    (68, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENE2.2', 4);

-- ENE2.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (69, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ENE2.3', 1),
    (70, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.3', 2),
    (71, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ENE2.3', 3),
    (72, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ENE2.3', 4);

-- Competencia: Análisis y Solución de Problemas / Nivel: Operativo

-- ASO1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (73, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASO1.1', 1),
    (74, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.1', 2),
    (75, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.1', 3),
    (76, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASO1.1', 4);

-- ASO1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (77, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASO1.2', 1),
    (78, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.2', 2),
    (79, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.2', 3),
    (80, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASO1.2', 4);

-- ASO1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (81, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASO1.3', 1),
    (82, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.3', 2),
    (83, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASO1.3', 3),
    (84, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASO1.3', 4);

-- Competencia: Análisis y Solución de Problemas / Nivel: Táctico

-- AST1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (85, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'AST1.1', 1),
    (86, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.1', 2),
    (87, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.1', 3),
    (88, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'AST1.1', 4);

-- AST1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (89, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'AST1.2', 1),
    (90, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.2', 2),
    (91, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.2', 3),
    (92, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'AST1.2', 4);

-- AST1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (93, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'AST1.3', 1),
    (94, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.3', 2),
    (95, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'AST1.3', 3),
    (96, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'AST1.3', 4);

-- Competencia: Análisis y Solución de Problemas / Nivel: Estratégico

-- ASE1.1
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (97, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASE1.1', 1),
    (98, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.1', 2),
    (99, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.1', 3),
    (100, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASE1.1', 4);

-- ASE1.2
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (101, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASE1.2', 1),
    (102, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.2', 2),
    (103, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.2', 3),
    (104, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASE1.2', 4);

-- ASE1.3
INSERT INTO DESCRIPCION_RESPUESTA 
    (ID_DESCRIPCION_RESPUESTA, TITULO, DESCRIPCION, EMPRESA_ID_EMPRESA, TEXTOS_EVALUACION_CODIGO_EXCEL, ESCALA_ID_ESCALA) 
VALUES 
    (105, 'No Logra lo Esperado', 'No cumple con los comportamientos y resultados mínimos definidos para la competencia.', 1, 'ASE1.3', 1),
    (106, 'Logra Parcialmente lo Esperado', 'Cumple solo en forma incompleta o inconsistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.3', 2),
    (107, 'Logra lo Esperado', 'Cumple de manera consistente con los comportamientos y resultados definidos para la competencia.', 1, 'ASE1.3', 3),
    (108, 'Supera lo Esperado', 'Supera de forma sostenida los comportamientos y resultados definidos para la competencia, agregando valor más allá de lo requerido.', 1, 'ASE1.3', 4);

-- =========================
-- Tabla Trabajador
-- =========================

-- NIVEL 3: Estratégico (No tienen Jefe)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (1, '10.234.567-1', NULL, 'Roberto', 'Méndez', 'Castro', 'r.mendez@mohala.cl', 'Masculino', 1, 3, 5, 1),
    (2, '12.456.789-2', NULL, 'Patricia', 'Lorca', 'Vial', 'p.lorca@mohala.cl', 'Femenino', 1, 3, 6, 1);

-- NIVEL 2: Táctico (Reportan al ID 1 y 2)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (3, '13.567.890-4', 1, 'Mónica', 'Sánchez', 'Paz', 'm.sanchez@mohala.cl', 'Femenino', 1, 2, 4, 3),
    (4, '11.345.678-3', 2, 'Andrés', 'Tapia', 'Ruiz', 'a.tapia@mohala.cl', 'Masculino', 1, 2, 3, 2);

-- NIVEL 1: Operativo (Reporta al ID 3 y 4)
INSERT INTO TRABAJADOR 
    (ID_TRABAJADOR, RUT, ID_JEFE_DIRECTO, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, GENERO, EMPRESA_ID_EMPRESA, NIVEL_JERARQUICO_ID_NIVEL_JERARQUICO, CARGO_ID_CARGO, DEPARTAMENTO_ID_DEPARTAMENTO)
VALUES 
    (5, '18.456.789-9', 3, 'Valeria', 'Cáceres', 'Pinto', 'v.caceres@mohala.cl', 'Femenino', 1, 1, 1, 3),
    (6, '19.567.890-0', 4, 'Sebastián', 'Marín', 'Rojas', 's.marin@mohala.cl', 'Masculino', 1, 1, 2, 2);
