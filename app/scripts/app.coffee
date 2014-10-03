'use strict'

###*
 # @ngdoc overview
 # @name angularAutomataApp
 # @description
 # # angularAutomataApp
 #
 # Main module of the application.
###
angular
  .module('angularAutomataApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

