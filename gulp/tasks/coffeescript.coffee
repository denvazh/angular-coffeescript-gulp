gulp            = require 'gulp'
coffee          = require 'gulp-coffee'
plumber         = require 'gulp-plumber'
sourcemaps      = require 'gulp-sourcemaps'
browsersync     = require 'browser-sync'
path            = require 'path'
config          = require '../config'

#
# Generate Javascript from Coffeescript
#

# compile coffeescript with sourcemaps
gulp.task 'coffee:dev', ['clean:coffee'], ->

  browsersync.notify('Compiling coffee-script');

  gulp.src(config.coffeescript.src)
  .pipe(plumber())
  .pipe(sourcemaps.init())
  .pipe(coffee({bare: false}))
  .pipe(sourcemaps.write())
  .pipe(plumber.stop())
  .pipe(gulp.dest(config.coffeescript.dest))
  .pipe(browsersync.reload({ stream: true }))

# compile coffeescript ready for concatenation and minification
gulp.task 'coffee:package', ['clean:coffee'], ->
  gulp.src(config.coffeescript.src)
  .pipe(plumber())
  .pipe(coffee({bare: false}))
  .pipe(plumber.stop())
  .pipe(gulp.dest(config.coffeescript.dest))

# default coffeescript task
gulp.task 'coffee', ['coffee:dev']