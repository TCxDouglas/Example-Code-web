# INSTRUCCIONES DEL BACKEND

Corres el scripts sql en el PHPMy Admin de Xamp

## Ejecutar 
```bash
NPM install
```

## Modo Desarrollador 
```bash
npm run dev
```
## Modo Normal
```bash
npm start
```

## Login: 
Peticion por get -> http://localhost:3900/api/login/(Email)/(Pass)
Return -> message, dataUser

## Nuevo Usuario
Peticion por Post -> http://localhost:3900/api/new
Enviar json por x-Form {nombre, apellido, email, pass, telefono, tipo}
return -> message, status

## Todos los usuarios
Peticion por get -> http://localhost:3900/api/data
return -> message, users


## Obtener los examenes por nombre de materia
peticion por get -> http://localhost:3900/api/listEvaluations/(Materia)
return -> Message, evaluations

## Obtener las preguntas del Test correspondiente
peticion por get -> http://localhost:3900/api/getQuestionTest/(ID de la Evaluacion o test)
Return -> Message, Test

## Crear el registro de la evaluacion del estudiante
Peticion por Post -> http://localhost:3900/api/saveScore
Enviar Json por x-Form { idAlumno, idEvaluacion, puntaje }

## Guardar las respuestas de los alumnos
Peticion por post -> http://localhost:3900/api/saveAnswers
ENviar Json por x-form { idCalificacion, idPregunta, respuesta, estado }
Return test.insertId -> ID Calificacion recien creada

## Obtener la calificacion de un estudiante
Peticion por get -> http://localhost:3900/api/getEvaluation/(idAlumno)/(idEvaluacion)
Return -> Message, evaluations

## Obtener las respuestas de un estudiante
peticion por get -> http://localhost:3900/api/getAnswers/(idCalificacion)
return -> Message, evaluations

## Obtener todas las evaluaciones realizadas por un estudiante
Peticion por Get -> http://localhost:3900/api/getEvaluationStudent/(idAlumno)
return -> Message, evaluations


## Obtener las evaluaciones de un estudiante por materia
peticion por GET -> http://localhost:3900/api/getEvaluationForMateria/(idAlumno)/(Materia)
return -> Message, evaluations

## TEST AÑADIDOS
Matematica
Lenguaje
Ciencia
Sociales