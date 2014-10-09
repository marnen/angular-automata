describe 'pad', ->
  beforeEach module 'filters'

  pad = {}

  beforeEach inject ($filter) ->
    pad = $filter 'pad'

  describe 'input', ->
    describe 'string', ->
      describe 'shorter than given length', ->
        it 'pads it on the left with zeroes', ->
          expect(pad 'abc', 5).toEqual '00abc'

      describe 'equal to given length', ->
        it 'returns it unchanged', ->
          expect(pad 'abcdef', 6).toEqual 'abcdef'

      describe 'longer than given length', ->
        it 'returns it unchanged', ->
          expect(pad 'abcdefg', 2).toEqual 'abcdefg'

    describe 'not a string', ->
      it 'converts the input to a string before padding', ->
        expect(pad 12345, 10).toEqual pad '12345', 10
