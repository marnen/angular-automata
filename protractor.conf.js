exports.config = {
  chromeDriver: 'node_modules/protractor/selenium/chromedriver',
  // chromeOnly: true,
  seleniumAddress: 'http://localhost:4444/wd/hub',
  baseUrl: 'http://localhost:' + (process.env.HTTP_PORT || '9000'),
  rootElement: 'section',
  capabilities: {
    /*
     * Can be used to specify the phantomjs binary path.
     * This can generally be ommitted if you installed phantomjs globally.
     */
    // 'phantomjs.binary.path':'./node_modules/phantomjs/bin/phantomjs',

    /*
     * Command line arugments to pass to phantomjs.
     * Can be ommitted if no arguments need to be passed.
     * Acceptable cli arugments: https://github.com/ariya/phantomjs/wiki/API-Reference#wiki-command-line-options
     */
    // 'phantomjs.cli.args':['--logfile=PATH', '--loglevel=DEBUG']
  }
}
