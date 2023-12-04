import express from "express";
import User from "../models/user.js";
import Evento from "../models/Event.js";
import  Jwt  from "jsonwebtoken";
import jwtAuthenticated from "../helpers/jwtAuthenticated.js";
import getCurrentUser from "../helpers/getCurrentUser.js";

const router = express.Router();





// const nuevoEvento = new Evento({
//   title: 'Votación Bancos',
//   description: 'Elige tu banco favorito',
//   date: new Date(),
//   fechaTermino: new Date('2023-11-01T07:35:00'),
//   options: ['Santander', 'Chile', 'Falabella', 'Itau'],
//   votes: new Map([
//       ['Santander', 0],
//       ['Chile', 0],
//       ['Falabella', 0],
//       ['Itau', 0],
//   ]),
// });


// //nuevoEvento.save()
// //.then((eventoGuardado) => {
// //  console.log('Evento guardado:', eventoGuardado);
// //})
// //.catch((error) => {
// //  console.error('Error al guardar el evento:', error);
// //});







// router.get("/Vote2", jwtAuthenticated ,(req, res) => {
//   // Recupera los datos de los eventos desde la base de datos
//   Evento.find({}, (err, eventos) => {
//     if (err) {
//       console.error(err);
//       res.status(500).send("Error interno del servidor");
//     } else {
//       // Renderiza la vista de Handlebars y pasa los datos de los eventos
//       res.render("user/Votaciones", { eventos });
//     }
//   });
// });

// //votar
// router.post("/Vote/:eventId", jwtAuthenticated,async (req, res) => {
//   const currentUser = await getCurrentUser(req);

//   const eventId = req.params.eventId;
//   const userId = currentUser.email;
//   const flexRadioDefault = req.body.flexRadioDefault;

//   // Recupera el evento específico por su ID
//   Evento.findById(eventId, (err, evento) => {

//     if (err) {
//       return res.status(500).send('Error al buscar el evento');
//     }

//     if (!evento) {
//       return res.status(404).send('Evento no encontrado');
//     }

//     if (evento.voters.includes(userId)) {
//       return res.status(400).render("user/repeat");
//     }

//     const votesMap = new Map(evento.votes);

//     if (evento.options.includes(flexRadioDefault)) {
      

//       const currentVotes = votesMap.get(flexRadioDefault);
//         votesMap.set(flexRadioDefault, currentVotes + 1);
          
 
//           evento.votes = votesMap;
//           evento.voters.push(userId); 

   

//       evento.save((err) => {
//         if (err) {
//           return res.status(500).send('Error al registrar el voto');
//         }
//         res.render("user/win");
//       });
//     } else {
      
//       res.status(400).send('Opción de voto no válida');
//     }
//   });
// });


// router.get("/Vote/:eventId", (req, res) => {
//   const eventId = req.params.eventId;
  
//   res.render("user/Vote", { eventId: eventId});
// });




// router.get("/Homi", jwtAuthenticated ,async (req, res) => {
//   const currentUser = await getCurrentUser(req);

// if(currentUser.email === "Admin"){
//   res.render("user/Home_Admin", {user: {name: currentUser.name}});
// }else
//   res.render("user/Home_user", {user: {name: currentUser.name}});
// });



// router.get("/Homi", jwtAuthenticated ,async (req, res) => {
//   const currentUser = await getCurrentUser(req);

//   res.render("user/Home_user", {user: {name: currentUser.name}});
// });


// router.get("/invitado", (req, res) => {
//   res.render("user/Home_inv");
//   res.clearCookie('jwt');

// });

// router.get("/Crear", jwtAuthenticated, (req,res) =>{
//   res.render("user/Crear");
// })







// router.get("/Vote", jwtAuthenticated,(req, res) => {

//   res.render("user/Vote");
  
//   });





// router.get("/create", (req, res) => {
//   res.render("user/create_user");
// });

// router.post("/create", (req, res) => {
//  User.create(req.body);
//   res.render("user/login");
// });



// // router.get("/login", (req, res) => {
// //   res.render("user/login");
// // })


// router.post("/login", async (req,res) => {
// const currentUser = await User.findOne({email: req.body.email});

// if(!currentUser || currentUser.password !== req.body.password) {

//   res.status(401).send("Usuario o contraseña incorrecta");
  

//   return;
// }
// else {


//   const payload =currentUser["_doc"];

//   delete payload.password;

// const signedJWT = Jwt.sign(payload, process.env.JWT_PASSWORD, {expiresIn: "1h"});



//   res.cookie("jwt", signedJWT).redirect("/user/Homi");


// }
// })


// router.get('/erase', (req, res) => {

//   res.clearCookie('jwt');

  

// });




// router.post('/crear-evento', (req, res) => {
//   const { title, description, date, fechaTermino, options } = req.body;
  
//   const optionsArray = options.split(',').map(option => option.trim());

//   const nuevoEvento = new Evento({
//       title,
//       description,
//       date,
//       fechaTermino,
//       options: optionsArray,
//       votes: new Map(optionsArray.map(option => [option, 0])),
//   });

//   nuevoEvento.save()
//       .then(eventoGuardado => {
//           console.log('Evento guardado:', eventoGuardado);
//           res.render('user/evento-true'); // Redirige a una página de éxito
//       })
//       .catch(error => {
//           console.error('Error al guardar el evento:', error);
//           res.render('user/evento-false'); // Redirige a una página de error
//       });
// });


// router.get('/Detalle/:eventId', async (req, res) => {
 
//   const eventId = req.params.eventId;

//   try {
   
//     const evento = await Evento.findById(eventId);

    
//     res.render('user/Detalle', { evento });
//   } catch (error) {
   
//     res.status(500).send('Error al buscar el evento');
//   }
// });




// router.get("/list_all",   async (req, res) => {

  
//   const users = await User.find({});
// res.render("user/list_all", {
//     allUsers: users.map((current) => {
//       return {
//         name: current.name,
//         lastName: current.lastName,
//         email: current.email,
//         address: current.address,
//         age: current.age,
//       };
//     }),
//   });
  
 

 

  
// });




router.get("/list",   async (req, res) => {
  res.json()
});









export default router;