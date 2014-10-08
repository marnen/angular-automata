angular.module('automata').controller 'AutomatonController', ['$scope', 'OneDimensionalAutomaton', ($scope, OneDimensionalAutomaton) ->
  do (->
    @rules = OneDimensionalAutomaton.rules()

    @update = =>
      @output = new OneDimensionalAutomaton(@automaton).compute()
  ).bind $scope
]
