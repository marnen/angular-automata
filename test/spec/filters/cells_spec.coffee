describe 'cells', ->
  beforeEach module 'filters'

  cells = {}
  input = {}
  unwrap = {}

  beforeEach inject ($filter, $sce) ->
    cells = $filter 'cells'
    unwrap = $sce.getTrustedHtml

  describe 'input', ->
    describe 'undefined', ->
      it 'returns an empty string', ->
        expect(unwrap cells undefined).toEqual ''

    describe 'string value', ->
      beforeEach ->
        input = Math.floor(Math.random() * 10 ** 10).toString()

      it 'creates a <span> of class "cell" for each character in the input string', ->
        console.log unwrap cells(input)
        expect(unwrap(cells(input)).match(/<span\b[^>]*class=(['"])cell\1/g).length).toEqual input.length

      it "puts the original input character in the <span>'s data-value attribute", ->
        pattern = ("<span\\b[^>]*data-value=(['\"])#{char}\\#{index + 1}[^>]*>" for char, index in input.split('')).join '.*'
        expect(cells input).toMatch new RegExp pattern
