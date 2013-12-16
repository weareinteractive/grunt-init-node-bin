###
grunt-init-node-bin
https://github.com/weareinteractive/grunt-init-node-bin

Copyright (c) 2013 We Are Interactive, "Cowboy" Ben Alman, contributors
Licensed under the MIT license.
###
"use strict"

path = require("path")
_s = require('underscore.string')

# Basic template description.
exports.description =
  """
  Create a Node.js module with Executable, CoffeeScript, Mocha, Chai & Bumber.
  """

# Template-specific notes to be displayed before question prompts.
exports.notes =
  """
  For more information about Grunt plugin best practices,
  please see the docs at http://gruntjs.com/creating-plugins
  """

# Template-specific notes to be displayed after question prompts.
exports.after =
  """
  You should now install project dependencies with _npm install_.
  After that, you may execute project tasks with _grunt_.
  For more information about installing and configuring Grunt,
  please see the Getting Started guide:

  http://gruntjs.com/getting-started
  """

# Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = "*"

# The actual init template.
exports.template = (grunt, init, done) ->

  init.process({type: "grunt"}, [
    # Prompt for these values.
    init.prompt('name', (value, props, done) ->
      done(null, value.replace(/^node-/, ""))
    )
    init.prompt("description", "The best Node.js module ever.")
    init.prompt("version", "0.1.0")
    init.prompt("repository")
    init.prompt("homepage")
    init.prompt("bugs")
    init.prompt("licenses")
    init.prompt("author_name")
    init.prompt("author_email")
    init.prompt("author_url")
    init.prompt('main')
    init.prompt('bin')
    init.prompt("node_version", grunt.package.engines.node)
  ], (err, props) ->
    props.keywords = []
    props.npm_test = "grunt test"
    props.class_name = _s.classify(props.name)
    props.devDependencies = {
      "chai": "~1.8.0"
      "grunt-coffeelint": "0.0.7"
      "grunt-contrib-coffee": "~0.7.0"
      "grunt-mocha-cov": "0.0.7"
      "coffee-script": "~1.6.3"
      "grunt-bumper": "~1.0.1"
    }

    # Files to copy (and process).
    files = init.filesToCopy(props)

    # Add properly-named license files.
    init.addLicenseFiles(files, props.licenses)

    # Actually copy (and process) files.
    init.copyAndProcess(files, props)

    # Generate package.json file.
    init.writePackageJSON("package.json", props)

    # empty directories will not be copied, so we need to create them manual
    grunt.file.mkdir(path.join(init.destpath(), "lib"))

    # All done!
    done()
  )