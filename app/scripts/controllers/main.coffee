'use strict'

###*
 # @ngdoc function
 # @name angularAutomataApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the angularAutomataApp
###
angular.module('angularAutomataApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
