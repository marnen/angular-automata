angular.module('automata').controller 'AutomatonController', ['$scope', 'OneDimensionalAutomaton', ($scope, OneDimensionalAutomaton) ->
  ((->
    @update = =>
      @output = new OneDimensionalAutomaton(@automaton).compute()
  ).bind $scope)()
]
