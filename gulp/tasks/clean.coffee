gulp            = require 'gulp'
path            = require 'path'
del             = require 'del'
config          = require '../config'

# cleanup compiled files
gulp.task 'clean:dest', (callback)->
  del([
    path.join(config.app.dest,'*')
  ], callback)

# cleanup compiled coffeescript files
gulp.task 'clean:coffee', (callback)->
  del([
    path.join(config.sass.dest, 'scripts')
  ], callback)

# cleanup compiled sass files
gulp.task 'clean:sass', (callback)->
  del([
    config.sass.dest
  ], callback)

# combine all clean tasks into one
gulp.task 'clean', [
  'clean:dest'
  'clean:coffee'
  'clean:sass'
]