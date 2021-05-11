var query = {
    allEvaluations : 'SELECT docente.idDocente, evaluaciones.idEvaluacion, docente.nombreDocente, evaluaciones.nombreEvaluacion, evaluaciones.descripcion, evaluaciones.materia, evaluaciones.tiempo ' +
     'FROM docente, evaluaciones WHERE docente.idDocente = evaluaciones.idDocente'
}

module.exports = query;