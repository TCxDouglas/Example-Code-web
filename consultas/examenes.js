var query = {
    listEvaluations : (materia) => {
        getQuery = 'SELECT docente.idDocente, evaluaciones.idEvaluacion, docente.nombreDocente, evaluaciones.nombreEvaluacion, evaluaciones.descripcion, evaluaciones.materia, evaluaciones.tiempo ' +
        'FROM docente, evaluaciones WHERE docente.idDocente = evaluaciones.idDocente AND evaluaciones.materia = "' + materia + '"'

        
        return getQuery;
    },
    getQuestionTest:(idEva) => { 
        getQuery = 'SELECT ' +
        'preguntas.idPregunta, evaluaciones.nombreEvaluacion, preguntas.pregunta, preguntas.opcion1, preguntas.opcion2, preguntas.opcion3, preguntas.respuesta ' +
        'FROM evaluaciones, preguntas WHERE evaluaciones.idEvaluacion = preguntas.idEvaluacion and evaluaciones.idEvaluacion =' + idEva

        return getQuery
    }, 
    saveScore: (idAlumno, idEvaluacion, puntaje, fecha) => {
        getQuery = 'INSERT INTO calificaciones (idAlumno, idEvaluacion, puntaje, fecha) VALUES ("' + idAlumno + '", "' + idEvaluacion + '", "' + puntaje + ', "' + fecha + '")'

        return getQuery
    },
    saveAnswers: (idCalificacion, idPregunta, respuesta, estado) => {
        getQuery = 'INSERT INTO respuestas (idCalificacion, idPregunta, respuesta, estado) VALUE ("' + idCalificacion + '", "' + idPregunta + '", "' + respuesta + '", "' + estado + '")'

        return getQuery
    },
    getEvaluations: (idAlumno, idEvaluacion) => {
        getQuery = 'SELECT ' + 
        'calificaciones.idCalificacion, usuarios.nombre, evaluaciones.nombreEvaluacion, evaluaciones.materia, calificaciones.Puntaje, calificaciones.fecha ' +
        'FROM calificaciones, usuarios, evaluaciones WHERE ' + 
        'calificaciones.idAlumno = usuarios.id and evaluaciones.idEvaluacion = calificaciones.idEvaluacion AND usuarios.id = "' + idAlumno + 
        '" AND evaluaciones.idEvaluacion = "' + idEvaluacion + '" ORDER by calificaciones.fecha DESC LIMIT 1'

        return getQuery
    },
    getAnswers: (idCalificacion) =>{
        getQuery = 'SELECT respuestas.idRespuesta, calificaciones.idCalificacion , preguntas.idPregunta, ' +
        'preguntas.pregunta, respuestas.respuesta, respuestas.estado ' +
        'FROM ' + 
        'calificaciones, preguntas, respuestas ' +
        'WHERE calificaciones.idCalificacion = respuestas.idCalificacion AND preguntas.idPregunta = respuestas.idPregunta AND calificaciones.idCalificacion = "' + idCalificacion + '"'

        return getQuery
    },
    getEvaluationsStudent: (idAlumno) =>{
        getQuery = 'SELECT ' +
        'calificaciones.idCalificacion, usuarios.nombre, evaluaciones.nombreEvaluacion, evaluaciones.materia, calificaciones.Puntaje, calificaciones.fecha ' +
        'FROM calificaciones, usuarios, evaluaciones WHERE ' +
        'calificaciones.idAlumno = usuarios.id and evaluaciones.idEvaluacion = calificaciones.idEvaluacion AND usuarios.id = "' + idAlumno + '"'

        return getQuery
    },
    getEvaluationForMateria: (idAlumno, materia) =>{
        getQuery = 'SELECT ' +
        'calificaciones.idCalificacion, usuarios.nombre, evaluaciones.nombreEvaluacion, evaluaciones.materia, calificaciones.Puntaje, calificaciones.fecha ' +
        'FROM calificaciones, usuarios, evaluaciones WHERE ' +
        'calificaciones.idAlumno = usuarios.id and evaluaciones.idEvaluacion = calificaciones.idEvaluacion AND usuarios.id = "' + idAlumno + '" AND evaluaciones.materia = "' + materia + '"';

        return getQuery
    }
}

module.exports = query;