"use strict"

chai = require('chai')
grunt = require('grunt')
{%= js_test_safe_name %} = require('../../')

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

module.exports =
  before: (done) ->
    # setup here if necessary
    done()
  "Test":
    "#run": (done) ->
      assert.equal {%= js_test_safe_name %}.run("bar"), "bar", "should be bar."
      done()
