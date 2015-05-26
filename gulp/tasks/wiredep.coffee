gulp            = require 'gulp'
wiredep         = require('wiredep').stream
config          = require '../config'

# inject bower dependencies
gulp.task 'wiredep', ->
  wiredepConfig = config.wiredep.config

  # process index.html
  gulp.src(config.wiredep.index.src)
  .pipe(wiredep(wiredepConfig))
  .pipe(gulp.dest(config.wiredep.index.dest))

  # process styles/main.scss
  gulp.src(config.wiredep.styles.src)
  .pipe(wiredep(wiredepConfig))
  .pipe(gulp.dest(config.wiredep.styles.dest))
