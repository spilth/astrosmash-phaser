exports = this

class Menu
  create: ->
    @game.add.sprite(0, 0, 'background')
    @game.add.text(8, 8, "ASTROSMASH!", {fill: "#ffffff"})
    @game.add.text(8, 40, "Press space to play", {fill: "#ffffff"})
    @game.add.text(8, 104, "Controls: Left/Right arrows to move, Spacebar to Fire", {fill: "#aaaaaa"})

    @spacebar = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)

  update: ->
    if @spacebar.isDown
      @game.state.start('game')

exports.Menu = Menu
