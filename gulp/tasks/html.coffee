gulp              = require 'gulp'
browsersync       = require 'browser-sync'
config            = require '../config'

gulp.task 'html:dev', ->
  htmlConfig = config.watch.html

  gulp.src(htmlConfig)
  .pipe(browsersync.reload({ stream: true }))

gulp.task 'html', ['html:dev']