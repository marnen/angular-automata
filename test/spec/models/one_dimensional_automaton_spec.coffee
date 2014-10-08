describe 'OneDimensionalAutomaton', ->
  beforeEach module 'models'

  OneDimensionalAutomaton = {}

  beforeEach inject ($injector) ->
    OneDimensionalAutomaton = $injector.get 'OneDimensionalAutomaton'

  describe '#compute', ->
    describe 'computing one generation for the given seed and rule', ->
      specify = it

      afterEach ->
        automaton = new OneDimensionalAutomaton @params
        expect(automaton.compute()).toEqual @result

      specify 'rule 0', ->
        @params = seed: '10101', rule: '0'
        @result = '00000'

      specify 'rule 255', ->
        @params = seed: '01010', rule: '255'
        @result = '11111'

  describe '.rules', ->
    it 'returns the permissible range of rule codes', ->
      expect(OneDimensionalAutomaton.rules()).toEqual [0..255]
