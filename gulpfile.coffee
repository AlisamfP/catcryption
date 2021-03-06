gulp           = require 'gulp'
concat         = require 'gulp-concat'
plumber        = require 'gulp-plumber'
sourcemaps     = require 'gulp-sourcemaps'
coffee         = require 'gulp-coffee'
webserver      = require 'gulp-webserver'

gulp.task 'coffee:compile', ->
  files = ['./app/**/*.coffee']

  gulp.src files
      .pipe plumber()
      .pipe coffee(bare: true)
      .pipe concat('application.js')
      .pipe sourcemaps.write('.')
      .pipe gulp.dest('./public/dist/')

gulp.task 'webserver', ->
  gulp.src './public'
      .pipe webserver({
        host: '0.0.0.0'
        port: 8888
        livereload: false
        directoryListing: false
        open: false
        fallback: 'index.html'
      })

gulp.task 'default', ['coffee:compile'], ->

gulp.task 'watch', ['default', 'webserver'], ->
  gulp.watch ['./app/**/*.coffee','./config/**/*.coffee'], ['coffee:compile']
