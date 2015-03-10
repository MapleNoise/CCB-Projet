var gulp = require('gulp'),
  browserSync = require('browser-sync'),
  $ = require('gulp-load-plugins')(),
  assetsDir = 'app/assets/',
  src = {
    javascripts: assetsDir + 'javascripts/',
    stylesheets: assetsDir + 'stylesheets/'
  },
  dest = {
    javascripts: 'public/assets/javascripts',
    css: 'public/assets/stylesheets'
  };


gulp.task('browser-sync', function() {
    browserSync({
        proxy: "localhost:3000",
        startPath: "/design.html",
        port: 8080,
        open: false,
        files: ["app/views/**/*.html.erb", 'public/*.html']
    });
});


gulp.task('scss', function(){

    var onError = function(err) {
        $.notify.onError({
            title:    "Gulp",
            subtitle: "Failure!",
            message:  "Errreur de compilation SCSS",
            sound:    "Beep"
        })(err);
        console.log(err);
    };

    return gulp.src(src.stylesheets + 'application.scss')
        // .pipe($.plumber({errorHandler: onError }))
        .pipe($.sass({
          onError: onError
        }))
        .pipe(gulp.dest(dest.css))
        .pipe($.size())
        .pipe(browserSync.reload({stream:true}))
        .pipe($.notify({ // Add gulpif here
           title: 'Gulp',
           subtitle: 'success',
           message: 'Fichiers SCSS compilé avec succes',
           sound: "Pop"
       }));
})


gulp.task('default', ['browser-sync'], function(){
       // gulp.watch('app/views/**/*.html.erb', browserSync.reload());
       // gulp.watch('public/*.html', browserSync.reload());
       gulp.watch(src.stylesheets + '**/*', ['scss']);
       gulp.watch(src.javascripts + '**/*', ['js']);
})


// Concatenate & Minify JS
gulp.task('js', function() {

    var onError = function(err) {
        $.notify.onError({
            title:    "Gulp",
            subtitle: "Failure!",
            message:  "Errreur de compilation javascript",
            sound:    "Beep"
        })(err);
        console.log(err);
    };


    return gulp.src([src.javascripts + 'rails.js', src.javascripts + '**/*.js'])
        .pipe($.plumber({errorHandler: onError }))
        .pipe($.concat('app.min.js'))
        .pipe($.uglify())
        .pipe(gulp.dest(dest.javascripts))
        .pipe($.notify({ // Add gulpif here
           title: 'Gulp',
           subtitle: 'success',
           message: 'Fichiers javascripts concaténés puis minifié',
           sound: "Pop"
       }));
});

// gulp.task('watch', ['scss', 'scripts'], function(){
//   	var server = livereload();
//   	gulp.watch(src.stylesheets + '**/*', ['scss']).on('change', function(file) {
//   		console.log('le fichier ' + file.path + ' changé');
//     	server.changed(file.path);
//   	});

//     gulp.watch(src.javascripts + '**/*', ['scripts']).on('change', function(file) {
//       console.log('le fichier ' + file.path + ' changé');
//       server.changed(file.path);
//     });
// })

// gulp.task('default', ['scss', 'scripts']);