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
        files: ["app/views/**/*.html.erb", 'public/*.html']
    });
});


gulp.task('scss', function(){
    return gulp.src(src.stylesheets + 'application.scss')
        .pipe($.sass({
          onError: console.error.bind(console, 'SCSS error : ')
        }))
        .pipe(gulp.dest(dest.css))
        .pipe($.size())
        .pipe(browserSync.reload({stream:true}));
})


gulp.task('default', ['browser-sync'], function(){
       // gulp.watch('app/views/**/*.html.erb', browserSync.reload());
       // gulp.watch('public/*.html', browserSync.reload());
       gulp.watch(src.stylesheets + '**/*', ['scss']);
})


// Concatenate & Minify JS
// gulp.task('scripts', function() {
//     return gulp.src(src.javascripts + '**/*.js')
//         .pipe(cache('scripts'))
//         .pipe(plumber())
//         .pipe(concat('app.min.js'))
//         .pipe(uglify())
//         .pipe(gulp.dest(dest.javascripts));
// });

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