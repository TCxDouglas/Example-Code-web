var query = {
    allEvaluations : 'SELECT docente.idDocente, evaluaciones.idEvaluacion, docente.nombreDocente, evaluaciones.nombreEvaluacion, evaluaciones.descripcion, evaluaciones.materia, evaluaciones.tiempo ' +
     'FROM docente, evaluaciones WHERE docente.idDocente = evaluaciones.idDocente',
    
    getQuestionTest:(idEva) => { 
        getQuery = 'SELECT ' +
        'preguntas.idPregunta, evaluaciones.nombreEvaluacion, preguntas.pregunta, preguntas.opcion1, preguntas.opcion2, preguntas.opcion3, preguntas.respuesta ' +
        'FROM evaluaciones, preguntas WHERE evaluaciones.idEvaluacion = preguntas.idEvaluacion and evaluaciones.idEvaluacion =' + idEva

        return getQuery
    }
}

module.exports = query;