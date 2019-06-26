const express = require('express');
const router = express.Router();

const Pelicula = require("../models/pelicula");
const Productora = require("../models/productora");


//Route to Pages
router.get('/', (req, res) => {
    res.render('IngresarPelicula');
});

router.get('/PeliculaNombre', (req, res) => {
    const peliculas = [];
    res.render('PeliculaNombre', {         
        peliculas
    });    
});

router.get('/PeliculasFranquicia', (req, res) => {
    const peliculas = [];
    res.render('PeliculasFranquicia', {         
        peliculas
    });    
});

router.get('/PeliculasProductora', (req, res) => {
    const peliculas = [];
    res.render('PeliculasProductora', {            
        peliculas
    });    
});

router.get('/PeliculasRango', (req, res) => {
    const peliculas = [];
    res.render('PeliculasRango', {            
        peliculas
    });    
});

router.get('/EstadisticasProductora', (req, res) => {
    const peliculas = []
    res.render('EstadisticasProductora', {
        peliculas
    });
});

router.get('/IngresarPelicula', (req, res) => {
    res.render('IngresarPelicula');
});

router.get('/IngresarProductora', (req, res) => {
    Productora.find({}, [], function(err, productoras) {
        res.render('IngresarProductora', {
            productoras
        });
    });
});

//Route to data transaction
router.post('/searchPelicula', (req, res) => {
    //console.log(req.body);
    Pelicula.find(req.body,[],function(err,peliculas) {
        res.render('PeliculaNombre', {
            peliculas
        });
      });
});

router.post('/searchPeliculasProductora', (req, res) => {
    //console.log(req.body);
    Pelicula.find(req.body,[],function(err,peliculas) {
        res.render('PeliculasProductora', {
            peliculas
        });
      });
});

router.post('/searchPeliculasRango', (req, res) => {
    //console.log(req.body);
    Pelicula.find({ano: req.body},[],function(err,peliculas) {
        res.render('PeliculasRango', {
            peliculas
        });
      });
});

router.post('/searchPeliculasFranquicia', (req, res) => {
    //console.log(req.body);
    Pelicula.find(req.body,[],function(err,peliculas) {
        res.render('PeliculasFranquicia', {
            peliculas
        });
      });
});


router.post('/estadisticas', (req, res) => {
    Pelicula.find(req.body,[],function(err,peliculas) {
        res.render('EstadisticasProductora', {
            peliculas
        });
      });
});

router.post('/addPelicula', (req, res) => {
    const Pel = new Pelicula(req.body);
    Pel.save();
    res.redirect('/IngresarPelicula');
})

router.post('/addProductora', (req, res) => {
    const Prod = new Productora(req.body);
    Prod.save();
    res.redirect('/IngresarProductora');
});

module.exports = router;