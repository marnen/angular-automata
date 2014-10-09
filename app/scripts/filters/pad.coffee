angular.module('filters').filter 'pad', ->
  (input, length) ->
    string = input.toString()
    padding = length - string.length
    if padding > 0
      ("0" for _ in [1..padding]).join('').concat string
    else
      string
