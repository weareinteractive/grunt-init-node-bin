###
{%= name %}
{%= homepage %}

Copyright (c) {%= grunt.template.today('yyyy') %} {%= author_name %}
Licensed under the {%= licenses.join(', ') %} license{%= licenses.length === 1 ? '' : 's' %}.
###

"use strict"

module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "src/**/*.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    coffee:
      lib:
        files:
          'lib/{%= name %}.js': ['src/**/*.coffee']

    # Unit tests.
    mochacov:
      options:
        bail: true
        ui: "exports"
        require: "coffee-script"
        compilers: ["coffee:coffee-script"]
        files: "test/specs/**/*.coffee"
      all:
        options:
          reporter: "spec"

    # Deployment
    bumper:
      options:
        tasks: ["default"]
        files: ["package.json"]
        updateConfigs: ["pkg"]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks "grunt-bumper"

  # Tasks
  grunt.registerTask "default", ["coffeelint", "coffee"]
  grunt.registerTask "test", ["default", "mochacov"]
