
import express from "express";
import path from "path";
import Evento from "./models/Event.js";
import { Client } from 'pg';
import { error } from "console";

const app = express();


const Database ={
 user: 'postgres',
 host: 'hostlocal',
 database: 'psql',
 password: '21062004',
 port: 5432,
};


const client = new Client(Database);




app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

//getters


const getUsers= async(req,res) =>{
  const sol = await client.query('SELECT * FROM usuarios');
  console.log(sol.rows);
}

//postters



const CreateUser = async(req,res) =>{
  const {name, email, password} = req.body;


  const sol = await client.query('INSERT INTO usuarios (name, email, password) VALUES ($1, $2, $3)', [name,email,password]);
  res.json({message:'Error interno al crear nuevo usuario'});


}
// investigar como obtener un nombre en especifico
// ademas tambien investigar datos en general, como usar where y join

const GetuserName = async(req,res) =>{
  const nombre= req.body.name;

  const sol = await client.query('SELECT usuarios.name FROM usuarios WHERE usuarios.name = $1', [nombre]);
  res.json({message:'Error interno al crear nuevo usuario'});
}



const CreateEvent = async(req,res) =>{
const name = req.body.name;
const fecha = req.body.date;
//const Candidatos = //usar misma tecnica que en la entrega 3, solicitar datos individuales y luego crear un arreglo
//crear la base de datos
const response = await client.query('INSERT INTO eventos name, fecha ');

res.json({message:'Error interno al crear nuevo Evento'});
}



module.exports = {
  getUsers,
  GetuserName,
  CreateEvent
}

export { app };