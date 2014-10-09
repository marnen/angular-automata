module.exports = ->
  expect = @World.prototype.expect

  @When /^I select rule (\d+)$/, (rule, next) ->
    $('select[name=rule]').element(`by`.xpath "//option[text()='#{rule}']").click()
    next()

  @When /^I enter "([^"]*)" as the seed$/, (seed, next) ->
    $('input[name=seed]').sendKeys seed
    next()

  @When /^I enter (\d+) generations$/, (generations, next) ->
    $('input[name=generations]').sendKeys generations
    next()

  @Then /^I should see "([^"]*)" in the output$/, (output, next) ->
    rowData = output.split ','
    selectors = (((".cell[data-value='#{char}']" for char in row.split('')).join ' + ') for row in rowData)

    element.all(`by`.css '#canvas .output .row').map((row, index) ->
      row.all(`by`.css selectors[index]).count().then (count) ->
        expect(count).not.to.equal 0
    ).then ->
      next()

  @Then /^I should see a graphical preview of rule (.*)$/, (rule, next) ->
    bitArray = parseInt(rule, 10).toString(2).split('').reverse()
    selectors = (".row.result[data-bit='#{bit}'] span.cell[data-value='#{bitArray[bit] || 0}']" for bit in [7..0])
    element.all(`by`.css '.rule-preview .case').map((caseDiv, index) ->
      caseDiv.all(`by`.css selectors[index]).count().then (count) ->
        expect(count).not.to.equal 0
    ).then ->
      next()
