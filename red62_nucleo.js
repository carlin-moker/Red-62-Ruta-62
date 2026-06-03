// Ruta raíz principal que soluciona el "Cannot GET /"
app.get('/', (req, res) => {
    // Te redirige en caliente al gateway local con tu CID consolidado
    res.redirect('http://127.0.0.1:8080/ipfs/QmUf9uuWpPQjQDcLaTE39jQLED8zScmyvXyhwFVYzj69sB');
});

