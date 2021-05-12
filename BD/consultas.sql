SELECT docente.idDocente, evaluaciones.idEvaluacion, docente.nombre, evaluaciones.nombreEvaluacion, evaluaciones.descripcion, evaluaciones.materia, evaluaciones.tiempo 
FROM docente, evaluaciones WHERE docente.idDocente = evaluaciones.idDocente

--CALIFICACIONES DE ESTUDIANTES
SELECT 
calificaciones.idCalificacion, usuarios.nombre, usuarios.apellido, evaluaciones.nombreEvaluacion, evaluaciones.materia, calificaciones.Puntaje
FROM calificaciones, usuarios, evaluaciones WHERE 
calificaciones.idAlumno = usuarios.id and evaluaciones.idEvaluacion = calificaciones.idEvaluacion

--Obtener las preguntas del test
    SELECT 
    evaluaciones.idEvaluacion, preguntas.idPregunta, evaluaciones.nombreEvaluacion, preguntas.pregunta, preguntas.opcion1, preguntas.opcion2, preguntas.opcion3, preguntas.respuesta
    FROM evaluaciones, preguntas WHERE evaluaciones.idEvaluacion = preguntas.idEvaluacion

--Obtener las respuestas de los alumnos
SELECT respuestas.idRespuesta, calificaciones.idCalificacion , preguntas.idPregunta,
preguntas.pregunta, respuestas.respuesta, respuestas.estado
FROM 
calificaciones, preguntas, respuestas
WHERE calificaciones.idCalificacion = respuestas.idCalificacion AND preguntas.idPregunta = respuestas.idPregunta AND calificaciones.idCalificacion = '8'

