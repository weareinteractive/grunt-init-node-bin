###
{%= name %}
{%= homepage %}

Copyright (c) {%= grunt.template.today('yyyy') %} {%= author_name %}
Licensed under the {%= licenses.join(', ') %} license{%= licenses.length === 1 ? '' : 's' %}.
###

"use strict"

class {%= class_name %}

  run: (value) ->
    return value

module.exports = new {%= class_name %}