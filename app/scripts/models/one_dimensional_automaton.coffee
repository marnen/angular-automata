angular.module('models', ['filters']).factory 'OneDimensionalAutomaton', ['$filter', ($filter) ->
  class OneDimensionalAutomaton
    constructor: (params) ->
      seed = params.seed.split ''
      rule = params.rule

      binary = (numberOrString) ->
        parseInt(numberOrString, 10).toString 2

      binaryArray = (numberOrString, length) ->
        ($filter('pad'))(binary(numberOrString), length).split ''

      computeBit = (index, options = {}) ->
        ancestor = options.ancestor || seed
        left = if index == 0 then '0' else ancestor[index - 1]
        center = ancestor[index]
        right = ancestor[index + 1] || '0'
        triplet = [left, center, right]
        ruleBits()[triplet]

      ruleBits = ->
        result = {}
        for bit, index in binaryArray(rule, 8).reverse()
          result[binaryArray(index, 3)] = bit
        result

      @compute = (generations = 1) =>
        results = []
        for generation in [1..generations]
          ancestor = results[results.length - 1] || seed
          current = (computeBit(index, ancestor: ancestor) for _, index in ancestor)
          results.push current

        (result.join('') for result in results)

    ruleMin = 0
    ruleMax = 255

    @rules: ->
      [ruleMin..ruleMax]
]
