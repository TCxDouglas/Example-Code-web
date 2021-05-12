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
    saveScore: (idAlumno, idEvaluacion, puntaje) => {
        getQuery = 'INSERT INTO calificaciones (idAlumno, idEvaluacion, puntaje) VALUES ("' + idAlumno + '", "' + idEvaluacion + '", "' + puntaje + '")'

        return getQuery
    }
}

module.exports = query;