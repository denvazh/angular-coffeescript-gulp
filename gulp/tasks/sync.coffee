gulp            = require 'gulp'
jsoneditor      = require 'gulp-json-editor'
project         = require('../config').project

gulp.task 'sync:bower', ->
  gulp.src 'bower.json'
  .pipe jsoneditor(
    (json)->
      json.name = project.name
      json.version = project.version
      json.description = project.description
      json.authors = [project.author]
      json.homepage = project.homepage
      json.private = project.private
      return json
  )
  .pipe gulp.dest(".")

gulp.task 'sync:package', ->
  gulp.src 'package.json'
  .pipe jsoneditor(
    (json)->
      json.name = project.name
      json.version = project.version
      json.description = project.description
      json.author = project.author
      json.homepage = project.homepage
      json.keywords = project.keywords
      json.private = project.private
      return json
  )
  .pipe gulp.dest(".")

gulp.task 'sync:config', ['sync:bower', 'sync:package']