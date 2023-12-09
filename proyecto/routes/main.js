import { Router } from "express";
import { getallUsers,GetuserData,CreateEvent,DeleteEvent,ChangePassword,UserLogin,Vote,getEvents} from "./app.js"
const router = Router();




router.get('/users', getallUsers);
router.get('/userdata/:id/',GetuserData);
router.get('/events', getEvents);

router.post('/createEvent', CreateEvent);
router.post('/deleteEvent', DeleteEvent);
router.post('/changePassword', ChangePassword);
router.post('/userLogin', UserLogin);
router.post('/vote', Vote);

