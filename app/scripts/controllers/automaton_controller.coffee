angular.module('automata').controller 'AutomatonController', ['$scope', 'OneDimensionalAutomaton', ($scope, OneDimensionalAutomaton) ->
  do (->
    @parseInt = parseInt
    @rules = OneDimensionalAutomaton.rules()

    @update = =>
      @output = new OneDimensionalAutomaton(@automaton).compute @generations
  ).bind $scope
]
