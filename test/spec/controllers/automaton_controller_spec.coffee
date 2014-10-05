describe 'AutomatonController', ->
  beforeEach module 'automata'

  AutomatonController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AutomatonController = $controller 'AutomatonController', {
      $scope: scope
    }

  describe '#compute', ->
    it 'returns as many 0s as there are characters in the seed string', ->
      length = Math.floor(Math.random() * 10) + 1
      seed = (Math.floor(Math.random() * 10) for i in [1..length]).join('')

      expect(scope.compute {seed: seed}).toEqual ('0' for i in [1..length]).join('')
