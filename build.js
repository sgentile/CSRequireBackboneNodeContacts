({
    appDir: '.',
    baseUrl: 'public/javascripts',
    //Uncomment to turn off uglify minification.
    //optimize: 'none',
    dir: 'demo-build',
    paths: {
        jquery: 'libs/jquery/jquery-min',
        jqueryvalidate: 'libs/jquery/jquery.validate',
	  	underscore: 'libs/underscore/underscore-min',
	  	backbone: 'libs/backbone/backbone-min',
	  	text: 'libs/require/text',
	    cs: 'cs'
    },
    //This pragma excludes the CoffeeScript compiler code
    //from the optimized source, since all CoffeeScript files
    //are converted and inlined into the main.js built file.
    //If you still want to allow dynamic loading of CoffeeScript
    //files after a build, comment out the pragmasOnSave section.
    pragmasOnSave: {
        excludeCoffeeScript: true
    },
    modules: [
        {
            name: "main"
        }
    ]
})
