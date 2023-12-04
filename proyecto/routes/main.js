import express from "express";
import jwtAuthenticated from "../helpers/jwtAuthenticated";
import getCurrentUser from "../helpers/getCurrentUser";
import Evento from "../models/Event.js";
import User from "../models/user.js";
import  Jwt  from "jsonwebtoken";
const router = express.Router();



router.get("/home", jwtAuthenticated,(req, res) => {
  
  const currentUser = getCurrentUser(req);
  
  
  res.render("partials/home"), {user: {name: currentUser.name}};
});




//mostrar todos los eventos
router.get("/eventos",  async (req, res) => {

 const eventos = await Evento.find({});
 res.json({

allEvents: eventos.map((current) => {

return {
  id: current._id,
title: current.title,
description: current.description,
date: current.date,
fechaTermino: current.fechaTermino,
options: current.options,
voters: current.voters,
votes: current.votes,
activo: current.activo,
};

}),

 });

});




//datos del evento

router.get("/eventos/:id/", async (req, res) => {
  const eventId = req.params.id;
  
  const eventoid = await Evento.findById(eventId);
  res.json({
    id: eventoid._id,
  Titulo: eventoid.title,
  descripcion: eventoid.description,
  Fecha_Inicio: eventoid.date,
  fecha_Termino: eventoid.fechaTermino,
  Candidatos: eventoid.options,
  Votantes: eventoid.voters,
  votos: eventoid.votes,
  activo: eventoid.activo,
  
  
  
  
   });



  });



//votar
router.post("/eventos/:id/votar", async (req, res) => {
  const eventId = req.params.id;
  const flexRadioDefault = req.body.numCandidato;

  try {
    const evento = await Evento.findById(eventId);

    if (!evento) {
      return res.status(404).json({ error: 'Evento no encontrado' });
    }

    const posicionCandidato = parseInt(flexRadioDefault);
    const candidatoIndex = posicionCandidato - 1;

    const votesMap = new Map(evento.votes);

    if (candidatoIndex >= 0 && candidatoIndex < evento.options.length) {
      const candidato = evento.options[candidatoIndex];

      const currentVotes = votesMap.get(candidato) || 0;
      votesMap.set(candidato, currentVotes + 1);

      evento.votes = Object.fromEntries(votesMap);

      await evento.save();
      res.json({ success: true, message: 'Voto incrementado con éxito.' });
    } else {
      res.status(400).json({ error: 'Posición de candidato no válida' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error interno del servidor', details: error.message });
  }
});









router.post("/eventos/actualizarEstado", async (req, res) => {
  try {
    const estado = Object.values(req.body).find(value => typeof value === 'boolean');

    if (estado === undefined) {
      return res.status(400).json({ error: "Se requiere un valor booleano para cambiar el estado de los eventos." });
    }

    await Evento.updateMany({}, { $set: { activo: estado } });
    res.status(200).json({ mensaje: true });
  } catch (error) {
    console.error(error);
    res.status(500).json({ mensaje: false, error: "Error interno del servidor" });
  }
});










//Hecho por felipe



//  router.post("/usuarios/login", async (req,res) => {
 
//   const currentUser = await User.findOne({email: req.body.email});

//   console.log("currentUser",currentUser)
  
//   if(!currentUser || currentUser.password !== req.body.password) {
  
//   res.json({ success: false, message: "Usuario o contraseña incorrecta"})   //se cambio o agrego
  
//     //res.status(401).send("Usuario o contraseña incorrecta");
    
  
//     return;
//   }
//   else {
//     const payload = currentUser["_doc"];
//     delete payload.password;
//     const signedJWT = Jwt.sign(payload, process.env.JWT_PASSWORD, { expiresIn: "24h" });

    
//     //res.cookie("jwt", signedJWT).redirect("/user/Homi");
//     res.json({success:true , jwt: signedJWT});
  
//   }})





  router.get("/usuarios/corriente", jwtAuthenticated , async (req, res) => {

  
    const currentUser = await getCurrentUser(req);
  res.json({success:true, nombreDeUsuario: currentUser.name});
    
   
  });





  //hecho por francisco

//   router.get("/usuarios/corriente", async (req,res) => {
//     try {
//         //obtener el usuario actual
//         const currentUser = await getCurrentUser(req);

//         res.send(JSON.stringify(
//             {
//                 "nombreDeUsuario": currentUser.name
//             }
//         ))

//     }catch(_e){
//         console.log(_e)
//         res.json({"errir":"error interno"})
//     }

// })



router.post("/usuarios/crear", async (req, res) => {
  try {
    const { nombre, correo, contraseña } = req.body;
    if (!nombre || !correo || !contraseña) {
      res.send(JSON.stringify({ success: false }));
      return;
    }

    const checkUser = await User.find({
      email: correo
    }).exec();

    if (checkUser && checkUser.length > 0) {
      res.send(JSON.stringify({
        success: false,
        message: "Ya existe un usuario con ese correo"
      }));
      return;
    }

    const user = await User.create({
      email: correo,
      password: contraseña,
      name: nombre,
      lastname: "",
      age: 1,
      address: "ejercito 441",
    });

    res.send(JSON.stringify({
      success: true,
      message: `Usuario:${user.name} creado exitosamente`
    }));

  } catch (error) {
    console.error("Error al crear usuario:", error);
    res.send(JSON.stringify({
      success: false,
      message: "Error al crear usuario"
    }));
  }
});




router.post("/usuarios/ingresar", async (req,res) => {
  try{
      const {correo, contraseña} = req.body
      if(!correo || !contraseña){
          res.send(JSON.stringify({success:false}))
          return
      }

      //verificar si el usuario ya existe
      const checkUser = User.find({
          email:correo
      }).exec()

      if(!checkUser){
          res.send(JSON.stringify({
              success:false,
              message: "No existe un usuario con ese correo"
          }))
          return 
      }

      //logueamos al usuario
      const currentUser = await User.findOne({email: correo});

      if(!currentUser){
          res.send("ERROR INTERNO")
          return
      }

      const payload = currentUser["_doc"]; //esto creo que no deberia de funcionar , TODO: Verificar
      //btw "delete payload.password" no es necesario ya que el gc se encargaria de eso

      const signedJWT = Jwt.sign(payload, process.env.JWT_PASSWORD, {expiresIn: "1h"});

      res.send(JSON.stringify(
          {
              success:true,
              message: `Usuario ${currentUser.name}`,
              jwt: signedJWT,
              expirationTime: "1h"
          }
      ))


  }catch(_e){
      console.log(_e)
      res.send("SUPER ERROR INTERNO POR FAVOR NO DECIR")
  }
})





router.get("/register", (req, res) => {
  res.render("user/register");
});

router.get("/login", (req, res) => {
  res.render("user/login");
});



router.post("/eventos/crear", async (req, res) => {
  try {
    const {  titulo, candidatoUno, candidatoDos, candidatoTres } = req.body;

    if (!titulo || (!candidatoUno && !candidatoDos && !candidatoTres)) {
      return res.status(400).json({ error: "Se requieren título y candidatos para crear un evento." });
    }
    const nuevoEvento = new Evento({
      title: titulo,
      options: [candidatoUno, candidatoDos, candidatoTres].filter(Boolean),
    });

   
    await nuevoEvento.save();

    res.status(201).json({ mensaje: "Evento creado exitosamente", id: nuevoEvento._id });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error interno del servidor" });
  }





});




// const jwt = require('jsonwebtoken');

// const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNlMjQzOGI3MGIzYTdmMjk0M2JmYTgiLCJlbWFpbCI6InBlcGUiLCJuYW1lIjoicGFwYSIsImFnZSI6MjAsImFkZHJlc3MiOiJjaGFuYW5hIiwiX192IjowLCJpYXQiOjE3MDAzMzAyMDUsImV4cCI6MTcwMDMzMzgwNX0.9FR3tHiCUU_RvLgReyLfdL_na0XCOZK0GIY1bMyxd3Q'; // Reemplaza con tu token JWT
// const claveSecreta = 'secret'; // La misma clave que se utilizó para firmar el token

// try {
//   const decodedToken = jwt.verify(token, claveSecreta, { algorithms: ['HS256'] });
//   console.log('Token verificado con éxito:', decodedToken);
// } catch (error) {
//   console.error('Error de verificación del token:', error.message);
// }



export default router;