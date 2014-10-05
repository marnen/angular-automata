module.exports = ->
  chai = require 'chai'
  chai.use require 'chai-as-promised'
  @World.prototype.expect = chai.expect
