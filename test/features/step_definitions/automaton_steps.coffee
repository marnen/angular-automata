module.exports = ->
  expect = @World.prototype.expect

  @When /^I select rule (\d+)$/, (rule, next) ->
    $('select[name=rule]').element(`by`.xpath "//option[text()='#{rule}']").click()
    next()

  @When /^I enter "([^"]*)" as the seed$/, (seed, next) ->
    $('input[name=seed]').sendKeys seed
    next()

  @Then /^I should see "([^"]*)" in the output$/, (output, next) ->
    selector = (".cell[data-value='#{char}']" for char in output.split('')).join ' + '
    $('#canvas .output').all(`by`.css selector).then (cells) ->
      expect(cells).not.to.be.empty
      next()
