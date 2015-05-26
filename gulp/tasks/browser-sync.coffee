gulp              = require 'gulp'
browsersync       = require 'browser-sync'
config            = require '../config'

###
# Run the build task and start a server with BrowserSync
###

gulp.task 'browsersync', ['build:dev'], ->

  browsersyncConfig = config.browsersync.development
  watchConfig = config.watch

  browsersync(browsersyncConfig)

  # TODO: remove debug logs when required watch patterns are exist and stable
  gulp.watch watchConfig.gulpfiles, ['build:dev'], (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...')

  gulp.watch watchConfig.coffeescript, ['coffee:dev'], (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...')

  gulp.watch watchConfig.sass, ['sass:dev'], (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...')

  gulp.watch watchConfig.html, ['html:dev'], (event)->
    console.log('File ' + event.path + ' was ' + event.type + ', running tasks...')

gulp.task 'serve', ['browsersync']