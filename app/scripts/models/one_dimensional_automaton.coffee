angular.module('models').factory 'OneDimensionalAutomaton', ->
  class OneDimensionalAutomaton
    constructor: (params) ->
      seed = params.seed.split ''
      rule = params.rule

      binary = (numberOrString) ->
        parseInt(numberOrString).toString 2

      binaryArray = (numberOrString, length) ->
        pad(binary(numberOrString), length).split ''

      computeBit = (index) ->
        left = if index == 0 then '0' else seed[index - 1]
        center = seed[index]
        right = seed[index + 1] || '0'
        triplet = [left, center, right]
        ruleBits()[triplet]

      pad = (string, minLength) ->
        if string.length >= minLength
          string
        else
          pad "0#{string}", minLength

      ruleBits = ->
        result = {}
        for bit, index in binaryArray(rule, 8).reverse()
          result[binaryArray(index, 3)] = bit
        result

      @compute = ->
        result = []

        for _, index in seed
          result.push computeBit(index)

        result.join ''

    ruleMin = 0
    ruleMax = 255

    @rules: ->
      [ruleMin..ruleMax]
