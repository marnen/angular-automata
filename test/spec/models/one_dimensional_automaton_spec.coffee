describe 'OneDimensionalAutomaton', ->
  beforeEach module 'models'

  OneDimensionalAutomaton = {}

  beforeEach inject ($injector) ->
    OneDimensionalAutomaton = $injector.get 'OneDimensionalAutomaton'

  describe '#compute', ->
    it 'returns as many 0s as there are characters in the seed string', ->
      length = Math.floor(Math.random() * 10) + 1
      seed = (Math.floor(Math.random() * 10) for i in [1..length]).join('')
      automaton = new OneDimensionalAutomaton {seed: seed}

      expect(automaton.compute()).toEqual ('0' for i in [1..length]).join('')
