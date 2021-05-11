SELECT docente.idDocente, evaluaciones.idEvaluacion, docente.nombre, evaluaciones.nombreEvaluacion, evaluaciones.descripcion, evaluaciones.materia, evaluaciones.tiempo 
FROM docente, evaluaciones WHERE docente.idDocente = evaluaciones.idDocente

--CALIFICACIONES DE ESTUDIANTES
SELECT 
calificaciones.idCalificacion, usuarios.nombre, evaluaciones.nombreEvaluacion, calificaciones.Puntaje
FROM calificaciones, usuarios, evaluaciones WHERE 
calificaciones.idAlumno = usuarios.id and evaluaciones.idEvaluacion = calificaciones.idEvaluacion

--Obtener las preguntas del test
    SELECT 
    evaluaciones.idEvaluacion, preguntas.idPregunta, evaluaciones.nombreEvaluacion, preguntas.pregunta, preguntas.opcion1, preguntas.opcion2, preguntas.opcion3, preguntas.respuesta
    FROM evaluaciones, preguntas WHERE evaluaciones.idEvaluacion = preguntas.idEvaluacion

--Obtener las respuestas de los alumnos
SELECT calificaciones.idCalificacion, respuestas.idRespuesta, preguntas.idPregunta,
preguntas.pregunta, respuestas.respuesta, respuestas.estado
FROM 
calificaciones, preguntas, respuestas
WHERE calificaciones.idCalificacion = respuestas.idCalificacion and preguntas.idPregunta = respuestas.idPregunta