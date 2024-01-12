const express = require('express')
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient()
const app = express.Router()
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/api/docentes', async (req, res) => {
    const docente = await prisma.docente.findMany()
    res.json(docente)
  })

  app.get('/api/docentes/:carnet', async (req, res) => {
    const docente = await prisma.docente.findUnique({
      where:{
        carnet: String(req.params.carnet),
      }
    })
    res.json(docente)
  })

app.post('/api/docentes', async (req, res) => {
    const { nombre, apellido, telefono, carnet, password } = req.body;
  
    try {
      const newDocente = await prisma.docente.create({
        data: {
          nombre,
          apellido,
          telefono,
          carnet,
          password,
        }
      });
  
      res.status(201).json(newDocente);
    } catch (error) {
      // Handle the error appropriately, e.g., send an error response
      console.error(error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  
  app.put('/api/docentes/:carnet', async (req, res) => {
    const { carnet } = req.params
    const docente = await prisma.docente.update({
      where: { carnet },
      data:  req.body ,
    })
    res.json(docente)
  })
  
  app.delete('/api/docentes/:carnet', async (req, res) => {
    const { carnet } = req.params; // Removed unnecessary String() call
    try {
      const docente = await prisma.docente.delete({
        where: {
          carnet: carnet // Specify the carnet value to uniquely identify the docente
        }
      });
  
      res.json({ message: 'Docente deleted successfully', docente });
    } catch (error) {
      res.status(500).json({ error: 'An error occurred while deleting the docente' });
    }
  });
 
  
  
  
  
  
  







module.exports = app