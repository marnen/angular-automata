'use strict'

###*
 # @ngdoc overview
 # @name automata
 # @description
 # # automata
 #
 # Main module of the application.
###
angular
  .module('automata', [
    # 'ngAnimate',
    # 'ngCookies',
    # 'ngResource',
    'ngRoute',
    # 'ngSanitize',
    # 'ngTouch'
    'models'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

