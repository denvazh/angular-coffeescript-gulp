coffee = require 'coffee-script'
requireDir = require 'require-dir'

# recursively require all tasks in gulp/tasks and its subfolders
requireDir './gulp/tasks', { recurse: true }