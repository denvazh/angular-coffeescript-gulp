gulp              = require 'gulp'
config            = require '../config'

# build application in development mode
gulp.task 'build:dev', [
  'sync:config'
  'wiredep'
  'sass:dev'
  'coffee:dev'
]

gulp.task 'build', ['build:dev']