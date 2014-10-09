describe 'OneDimensionalAutomaton', ->
  beforeEach module 'models'

  OneDimensionalAutomaton = {}

  beforeEach inject ($injector) ->
    OneDimensionalAutomaton = $injector.get 'OneDimensionalAutomaton'

  describe '#compute', ->
    afterEach ->
      automaton = new OneDimensionalAutomaton @params
      expect(automaton.compute @generations).toEqual @result

    describe 'generations not given', ->
      describe 'it computes one generation for the given seed and rule', ->
        specify = it

        specify 'rule 0', ->
          @params = seed: '10101', rule: '0'
          @result = ['00000']

        specify 'rule 255', ->
          @params = seed: '01010', rule: '255'
          @result = ['11111']

    describe 'generations given', ->
      it 'computes the specified number of generations', ->
        @params = seed: '10000', rule: '240'
        @generations = 3
        @result = ['01000', '00100', '00010']

  describe '.rules', ->
    it 'returns the permissible range of rule codes', ->
      expect(OneDimensionalAutomaton.rules()).toEqual [0..255]
