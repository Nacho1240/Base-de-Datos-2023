import { Router } from "express";
const { DeleteUser,eventsData,getallUsers,GetuserData,CreateEvent,DeleteEvent,ChangePassword,UserLogin,Vote,getEvents,CreateUser,ChangeEmail}= require('C:/Users/damia/Desktop/Cosas/universidad/Base de Datos/proyecto/app');



const router = Router();

router.get('/users', getallUsers);
router.get('/userdata/:id',GetuserData);
router.get('/events', getEvents);
router.get('/eventsdata/:id', eventsData);
router.post('/createUser', CreateUser);
router.post('/createEvent', CreateEvent);
router.post('/deleteEvent', DeleteEvent);
router.post('/changeEmail', ChangeEmail);
router.post('/changePassword', ChangePassword);
router.post('/vote/:id', Vote);
router.post('/userLogin', UserLogin); 
router.post('/deleteUser', DeleteUser);

export default router;





