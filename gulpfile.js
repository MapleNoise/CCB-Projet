var gulp = require('gulp'),
  livereload = require('gulp-livereload'),
  plumber = require('gulp-plumber'),
  uglify = require('gulp-uglify'),
  concat = require('gulp-concat'),
  newer = require('gulp-newer'),
  changed = require('gulp-changed'),
  cache = require('gulp-cached'),
	sass = require('gulp-ruby-sass');


var assetsDir = 'app/assets/';

var src = {
  javascript: assetsDir + 'javascripts/',
  stylesheets: assetsDir + 'stylesheets/'
};

var dest = {
  javascript: 'public/javascripts',
  css: 'public/stylesheets'
};

gulp.task('scss', function(){
    return gulp.src(src.stylesheets + 'application.scss')
        .pipe(changed(dest.css))
        .pipe(cache('scss'))
        .pipe(plumber())
        .pipe(sass({
        	sourcemap: false,
          cacheLocation: assetsDir + '.sass-cache/'
        }))
        .pipe(gulp.dest(dest.css));
})


// Concatenate & Minify JS
gulp.task('scripts', function() {
    return gulp.src(src.javascripts + '**/*.js')
        .pipe(cache('scripts'))
        .pipe(plumber())
        .pipe(concat('app.js'))
        .pipe(gulp.dest(dest.javascripts))
        .pipe(rename('app.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest(dest.javascripts));
});

gulp.task('watch', ['scss'], function(){
  	var server = livereload();
  	gulp.watch(src.stylesheets + '**/*', ['scss']).on('change', function(file) {
  		console.log('le fichier ' + file.path + ' changé');
    	server.changed(file.path);
  	});

    gulp.watch(src.javascripts + '**/*', ['scripts']).on('change', function(file) {
      console.log('le fichier ' + file.path + ' changé');
      server.changed(file.path);
    });
})

gulp.task('default', ['scss']);