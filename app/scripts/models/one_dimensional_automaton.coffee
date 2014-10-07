angular.module('models').factory 'OneDimensionalAutomaton', ->
  class OneDimensionalAutomaton
    constructor: (params) ->
      seed = params.seed

      @compute = ->
        ('0' for i in [1..seed.length]).join('')
