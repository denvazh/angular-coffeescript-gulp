gulp            = require 'gulp'
plumber         = require 'gulp-plumber'
sass            = require 'gulp-sass'
autoprefixer    = require 'gulp-autoprefixer'
sourcemaps      = require 'gulp-sourcemaps'
browsersync     = require 'browser-sync'
path            = require 'path'
config          = require '../config'

#
# Generate CSS from SCSS
#

# compile css for development (with sourcemaps)
gulp.task 'sass:dev', ['clean:sass'], ->

  browsersync.notify('Compiling Sass')

  gulp.src(config.sass.src)
  .pipe(plumber())
  .pipe(sourcemaps.init())
  .pipe(sass())
  .pipe(autoprefixer(config.autoprefixer))
  .pipe(sourcemaps.write())
  .pipe(plumber.stop())
  .pipe(gulp.dest(config.sass.dest))
  .pipe(browsersync.reload({ stream: true }))

# compile css ready for concatenation and minification (without sourcemaps)
gulp.task 'sass:package', ['clean:sass'], ->

  gulp.src(config.sass.src)
  .pipe(plumber())
  .pipe(sass())
  .pipe(autoprefixer(config.autoprefixer))
  .pipe(plumber.stop())
  .pipe(gulp.dest(config.sass.dest))

# default sass task
gulp.task 'sass', ['sass:dev']