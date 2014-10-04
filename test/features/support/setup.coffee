module.exports = ->
  chai = require 'chai'
  @World.prototype.expect = chai.expect
