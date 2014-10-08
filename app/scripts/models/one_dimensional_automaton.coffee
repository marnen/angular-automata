angular.module('models').factory 'OneDimensionalAutomaton', ->
  class OneDimensionalAutomaton
    constructor: (params) ->
      seed = params.seed.split ''
      rule = params.rule

      pad = (string, minLength) ->
        if string.length >= minLength
          string
        else
          pad "0#{string}", minLength

      @compute = ->
        ruleBits = {}
        result = []
        for bit, index in pad(parseInt(params.rule).toString('2'), 8).split('').reverse()
          ruleBits[pad(index.toString('2'), 3).split('')] = bit

        for center, index in seed
          left = if index == 0 then '0' else seed[index - 1]
          right = seed[index + 1] || '0'
          triplet = [left, center, right]
          result.push ruleBits[triplet]

        result.join ''

    ruleMin = 0
    ruleMax = 255

    @rules: ->
      [ruleMin..ruleMax]
