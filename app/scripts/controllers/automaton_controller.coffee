angular.module('automata').controller 'AutomatonController', ['$scope', ($scope) ->
  ((->
    @compute = (automaton) ->
      ('0' for i in [1..automaton.seed.length]).join('')

    @update = =>
      @output = @compute(@automaton)
  ).bind $scope)()
]
