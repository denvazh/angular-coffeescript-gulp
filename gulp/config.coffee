path            = require 'path'
project         = require '../project'
src             = project.build.config.src
dest            = project.build.config.dest
bowerDir        = project.build.config.bowerDir

# configuration for each gulp task
module.exports =

  # project metadata
  project: project

  # application source and build destination
  app:
    src: src
    dest: dest

  # compiles coffeescript to javascript
  coffeescript:
    src: path.join(src, '**/*.coffee')
    dest: path.join(dest, '/')

  # compiles sass to css
  sass:
    src: path.join(src, 'styles/**/*.{sass,scss}')
    dest: path.join(dest, 'styles')

  # adds browser specific css prefix
  autoprefixer:
    browsers: [
      'last 2 version'
      'safari 5'
      'ie 8'
      'ie 9'
      'opera 12.1'
      'ios 6'
      'android 4'
    ]
    cascade: true

  # automatically inject dependencies installed with bower
  wiredep:
    config:
      directory: bowerDir
      bowerJson: require('../bower.json')
    index:
      src: path.join(src, 'index.html')
      dest: path.join(src, '/')
    styles:
      src: path.join(src, 'styles', '**/*.{sass,scss}')
      dest: path.join(src, 'styles', '/')

  # RESERVED: gulp task is not implemented
  usemin:
    src: path.join(src, 'index.html')
    dest: path.join(dest, '/')

  # RESERVED: gulp task is not implemented
  copy:
    html:
      src: [
        path.join(src, '*.html')
      ]
      dest: path.join(dest, '/')
    views:
      src: [
        path.join(src, 'views', '**/*.html')
      ]
      dest: path.join(dest, 'views')
    assets:
      src: path.join(src, '*.{ico,png,txt}')
      dest: path.join(dest, '/')
    fonts:
      src: [
        path.join(src, 'fonts/*.{eot,svg,ttf,woff}')
      ]
      dest: path.join(dest, 'fonts')
    images:
      src: [
        path.join(src, 'images', '*')
      ]
      dest: path.join(dest, 'images')
    i18n:
      src: [
        path.join(src, 'i18n', '**/*.json')
      ]
      dest: path.join(dest, 'i18n')
    contents:
      src: [
        path.join(src, 'contents', '**/*.json')
      ]
      dest: path.join(dest, 'contents')

  # serve compiled assets for development preview
  browsersync:
    development:
      server:
        baseDir: [ src, dest ]
        routes:
          "/bower_components": "./#{bowerDir}"
      port: 8000
      ghostMode: true
      files: [
        path.join(dest, 'styles', '*.css')
        path.join(dest, 'scripts', '*.js')
        path.join(dest, 'images/**')
        path.join(dest, 'fonts/*')
      ]

  # watch files for changes
  watch:
    gulpfiles: 'gulp/**/*.coffee'
    coffeescript: "#{src}/scripts/**/*.coffee"
    sass: "#{src}/styles/**/*.{sass,scss}"
    html: ["#{src}/index.html","#{src}/**/*.html"]
