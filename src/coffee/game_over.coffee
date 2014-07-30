exports = this

class GameOver
  create: ->
    @game.add.sprite(0, 0, 'background')
    @game.add.text(8, 8, "GAME OVER!", {fill: "#ffffff"})
    @game.add.text(8, 40, "You died. Press space to play again", {fill: "#ffffff"})

    @spacebar = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)

  update: ->
    if @spacebar.isDown
      @game.state.start('game')

exports.GameOver = GameOver
