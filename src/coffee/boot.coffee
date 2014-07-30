exports = this

class Boot
  constructor: (@game) ->

  create: ->
    @game.state.start('preloader')

exports.Boot = Boot