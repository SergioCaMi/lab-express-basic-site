const express = require('express');
const app = express();
const port = 3000;
const path = require('path');

const homePage = path.join(__dirname, 'views', 'home.html');
const aboutPage = path.join(__dirname, 'views', 'about.html');
const worksPage = path.join(__dirname, 'views', 'works.html');

app.use(express.static('public'))//Indicamos a Express que cuando le hagan un GET, mire si el recurso que piden está en la carpeta public.


app.get('/', (req, res)=>{
    res.sendFile(homePage);
});

app.get('/about', (req, res)=>{
    res.sendFile(aboutPage);
});

app.get('/works', (req, res)=>{
    res.sendFile(worksPage);
});


app.listen(port,()=>{
    console.log('Server is running at http:localhost:3000');
});
