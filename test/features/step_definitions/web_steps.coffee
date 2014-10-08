module.exports = ->
  @Given /^I am on the homepage$/, (next) ->
    browser.get('/')
    next()

  @When /^I click "([^"]*)"$/, (button, next) ->
    element(`by`.buttonText button).click()
    next()
