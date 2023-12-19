
import express from "express";
import { Client } from 'pg';





const Database ={
 user: 'postgres',
 host: 'localhost',
 database: 'proyecto',
 password: '21062004',
 port: 5432,
};










const client = new Client(Database);

//conexion a la base de datos.

client.connect()
  .then(() => console.log('Conectado a la base de datos'))
  .catch(err => console.error('Error al conectar a la base de datos', err));




//getters






//actualizado

const getallUsers= async(req,res) =>{
  const sol = await client.query('SELECT usuarios.id, usuarios.email FROM usuarios');
  res.send(sol.rows);
  console.log(sol.rows);
}



//actualizado
const GetuserData = async (req, res) => {
  try {
    const id = req.params.id;
    const result = await client.query('SELECT usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.rut FROM usuarios WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      res.status(404).send({ message: 'Usuario no encontrado' });
    } else {
      res.send(result.rows);
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
};



//actualizado
const getEvents = async(req,res)=>{
const sol = await client.query('SELECT eventos.id, eventos.titulo, eventos.fecha_inicio FROM eventos');
res.send(sol.rows);
console.log(sol.rows);
}


  
const eventsData = async (req, res) => {
  const id = req.params.id;
  try{
  const sol = await client.query('SELECT eventos.titulo, eventos.fecha_inicio, candidatos.nombre  FROM eventos JOIN candidatos_eventos ON eventos.id = candidatos_eventos.evento_id JOIN candidatos ON candidatos_eventos.candidato_id = candidatos.id WHERE eventos.id = $1 GROUP BY eventos.id,eventos.titulo, eventos.fecha_inicio, candidatos.nombre', [id]);
  res.send(sol.rows);
  }catch(e){
    console.log(e);
    res.send({message:'Error interno del servidor'});
  }
 };
 

   
//postters



//actualizado
const CreateUser = async(req,res) =>{
  const {rut, name, lastname, email, password} = req.body;

 try{

const verify = await client.query('SELECT rut FROM usuarios WHERE rut = $1', [rut]);
if(verify.rows.length == 1){
  return res.json('El rut ya esta registrado, favor ingrese con sus credenciales.');

 }else{
  const sol = await client.query('INSERT INTO usuarios (nombre,apellido, email, password,rut) VALUES ($1, $2, $3, $4,$5)', [name,lastname,email,password,rut]);
  res.json({message:'Usuario creado exitosamente', body:{user:{name,lastname, email, password,rut}}});
 }

  }catch(error){
    console.log(error);
    res.json({message:'Error interno al crear nuevo usuario'});
  }

}

//confirmado
const CreateEvent = async(req,res) =>{
  const {name, fecha, candidatos} = req.body;
  
  if (!name || !fecha|| !candidatos ||  candidatos.length === 0) {
    return res.status(400).send({ error: 'Datos de solicitud inválidos.' });
  }
  
  try{
  
  const response = await client.query('INSERT INTO eventos (titulo, fecha_inicio) VALUES ($1,$2) RETURNING id', [name,fecha]);
  
  
  console.log(response.rows[0].id);
  
  const eventoId = response.rows[0].id;
  const values = candidatos.map(candidatoId => [eventoId, candidatoId]);
  
  for (const [eventoId, candidatoId] of values) {
    await client.query('INSERT INTO candidatos_eventos (evento_id, candidato_id) VALUES ($1, $2)', [eventoId, candidatoId]);
   
  } res.send({message:'Evento creado exitosamente'});
  }catch(e){
    console.log(e);
    res.send({message:'Error interno al crear nuevo Evento'});
  }
  
  }



  const DeleteEvent = async(req,res) =>{

    const {rut, password, id} = req.body;
    const verify = await client.query('SELECT rut,password FROM usuarios WHERE rut =$1 AND password =$2',[rut,password]);
  try{
  if(verify.rows.length ==1){
    const del = await client.query('DELETE FROM candidatos_eventos WHERE evento_id = $1', [id]);
    const response = await client.query('DELETE FROM eventos WHERE id = $1', [id]);
    res.send('Verificacion Exitosa, se procedera a eliminar el evento con el id solicitado.');
  }else{
    res.send('No tienes autorizacion, favor abandone la solicitud.');
  }
  }catch(e){
    res.send('Error interno del Sistema.')
    console.log(e);
  }
  }
  




//actualizado y verificado
const ChangeEmail = async(req,res) =>{

  const{email, password, newEmail} = req.body;
  try{
  const verify = await client.query('SELECT email,password FROM usuarios WHERE email = $1 AND password = $2', [email,password]);
  if(verify.rows.length ==1){
   
    const action = await client.query('UPDATE usuarios SET email = $1 where email = $2', [newEmail,email])
    res.send({message:'Datos actualizados correctamente'})
  }else{
  
  res.send({message:'Error con las credenciales ingresadas, deben ser el email y la contraseña actual junto con el nuevo email'});
  }
    
  }catch(e){
    console.log(e);
    res.send({message:'Error interno del servidor'});
  }
  }








  //actualizado
const ChangePassword = async(req,res) =>{

  const{email, password, newpassword} = req.body;
  try{
  const verify = await client.query('SELECT email,password FROM usuarios WHERE email = $1 AND password = $2', [email,password]);
  if(verify.rows.length ==1){
   
    const action = await client.query('UPDATE usuarios SET password = $1 where email = $2', [newpassword,email])
    res.send({message:'Datos actualizados correctamente'})
  }else{
  
  res.send({message:'Error con las credenciales ingresadas'});
  }
    
  }catch(e){
    console.log(e);
    res.send({message:'Error interno del servidor'});
  }
  }
  




//votar por candidato
//actualizado
const Vote = async (req, res) => {
  const eventoId = req.params.id;
  const { rut, candidato_id } = req.body;

  try {
    if (!rut || !candidato_id || !eventoId) {
      return res.status(400).send({ error: 'Se requieren el rut del usuario, el ID de candidato y el ID de evento para votar.' });
    }

    const temp = await client.query('SELECT id FROM usuarios WHERE rut = $1', [rut]);

    if (temp.rows.length === 0) {
      return res.status(400).send({ error: 'Usuario no encontrado con el rut proporcionado.' });
    }

    const usuario_id = temp.rows[0].id;

    const verify = await client.query('SELECT usuario_id FROM votos JOIN candidatos_eventos ON votos.evento_id = candidatos_eventos.evento_id WHERE usuario_id =$1 AND candidatos_eventos.candidato_id =$2 AND candidatos_eventos.evento_id =$3;',
      [usuario_id, candidato_id, eventoId]);

    if (verify.rows.length === 1) {
      return res.status(400).send({ error: 'El usuario ya votó por este candidato en este evento.' });
    }

    const response = await client.query('INSERT INTO votos (usuario_id, evento_id) VALUES ($1, $2)', [usuario_id, eventoId]);

    res.send({ message: 'Voto realizado exitosamente', body: { voto: { usuario_id, eventoId } } });
  } catch (e) {
    console.error(e);
    res.send({ message: 'Error interno del servidor' });
  }
};





//ingresar usuario

const UserLogin = async(req,res) =>{
  const {email, password} = req.body;
  const sol = await client.query('SELECT email,password FROM usuarios WHERE email = $1 AND password = $2', [email,password]);
  if(sol.rows.length == 1){
    res.json({message:'Usuario logeado exitosamente', body:{user:{email, password}}});
  }else{
    res.json({message:'Error al iniciar sesion'});
  }

}










//actualizado




const DeleteUser = async(req,res) =>{

  const {rut, password, email} = req.body;
  const verify = await client.query('SELECT rut,password,email FROM usuarios WHERE rut =$1 AND password =$2 AND email =$3',[rut,password,email]);
try{
if(verify.rows.length ==1){
  const del = await client.query('DELETE FROM usuarios WHERE rut = $1', [rut]);
  res.send('Verificacion Exitosa, se procedera a eliminar el evento con el id solicitado.');
}else{
  res.send('No tienes autorizacion, favor abandone la solicitud.');
}
}catch(e){
  res.send('Error interno del Sistema.')
  console.log(e);
}
}




module.exports = {
  getallUsers,
  GetuserData,
  CreateEvent,
  DeleteEvent,
  ChangePassword,
  UserLogin,
  Vote,
  getEvents,
  CreateUser,
  ChangeEmail,
  eventsData,
  DeleteUser
}

