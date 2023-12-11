import { Router } from "express";
const { getallUsers,GetuserData,CreateEvent,DeleteEvent,ChangePassword,UserLogin,Vote,getEvents,CreateUser}= require('/home/damian/Documentos/GitHub/Base-de-Datos/proyecto/app');
const router = Router();




router.get('/users', getallUsers);
router.get('/userdata/:id',GetuserData);
router.get('/events', getEvents);
router.post('/createUser', CreateUser);
router.post('/createEvent', CreateEvent);
router.post('/deleteEvent', DeleteEvent);
router.post('/changePassword', ChangePassword);
router.post('/userLogin', UserLogin); 
router.post('/vote/:id', Vote);


export default router;





