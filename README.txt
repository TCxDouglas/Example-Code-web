#INSTRUCCIONES DEL BACKEND

Corres el scripts sql en el PHPMy Admin de Xamp

##Ejecutar 
```bash
NPM install
```

##Modo Desarrollador 
```bash
npm run dev
```
##Modo Normal
```bash
npm start
```

##Login: 
Peticion por get -> http://localhost:3900/api/login/(Email)/(Pass)
Return -> message, dataUser

##Nuevo Usuario
Peticion por Post -> http://localhost:3900/api/new
Enviar json por x-Form {nombre, apellido, email, pass, telefono, tipo}
return -> message, status

##Todos los usuarios
Peticion por get -> http://localhost:3900/api/data
return -> message, users