angular.module('models', ['filters']).factory 'OneDimensionalAutomaton', ['$filter', ($filter) ->
  class OneDimensionalAutomaton
    constructor: (params) ->
      seed = params.seed.split ''
      rule = params.rule

      binary = (numberOrString) ->
        parseInt(numberOrString, 10).toString 2

      binaryArray = (numberOrString, length) ->
        ($filter('pad'))(binary(numberOrString), length).split ''

      computeBit = (index) ->
        left = if index == 0 then '0' else seed[index - 1]
        center = seed[index]
        right = seed[index + 1] || '0'
        triplet = [left, center, right]
        ruleBits()[triplet]

      ruleBits = ->
        result = {}
        for bit, index in binaryArray(rule, 8).reverse()
          result[binaryArray(index, 3)] = bit
        result

      @compute = ->
        (computeBit(index) for _, index in seed).join ''

    ruleMin = 0
    ruleMax = 255

    @rules: ->
      [ruleMin..ruleMax]
]
