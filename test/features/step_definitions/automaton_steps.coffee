module.exports = ->
  expect = @World.prototype.expect

  @When /^I select rule (\d+)$/, (rule, next) ->
    $('select[name=rule]').element(`by`.xpath "//option[text()='#{rule}']").click()
    next()

  @When /^I enter "([^"]*)" as the seed$/, (seed, next) ->
    $('input[name=seed]').sendKeys seed
    next()

  @Then /^I should see "([^"]*)" in the output$/, (output, next) ->
    rowData = output.split ','
    selectors = (((".cell[data-value='#{char}']" for char in row.split('')).join ' + ') for row in rowData)

    element.all(`by`.css '#canvas .output .row').then (rows) ->
      expect(row.$ selectors[index]).not.to.be.empty for row, index in rows
      next()
