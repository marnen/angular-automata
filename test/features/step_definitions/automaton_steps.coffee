module.exports = ->
  expect = @World.prototype.expect

  @When /^I select rule (\d+)$/, (rule, next) ->
    $('select[name=rule]').element(`by`.cssContainingText 'option', rule).click()
    next()

  @When /^I enter "([^"]*)" as the seed$/, (seed, next) ->
    $('input[name=seed]').sendKeys seed
    next()

  @Then /^I should see "([^"]*)" in the output$/, (output, next) ->
    $('#canvas .output').getText().then (text) ->
      expect(text).to.equal output
    next()
