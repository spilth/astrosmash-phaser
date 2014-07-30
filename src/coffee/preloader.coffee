exports = this

class Preloader
  preload: ->
    @game.load.image('player', 'img/spaceship.png')
    @game.load.image('laserblast', 'img/laser_blast.png')
    @game.load.image('asteroid', 'img/asteroid.png')
    @game.load.image('background', 'img/background.png')
    @game.load.image('ground', 'img/ground_trigger.png')
    @game.load.audio('laser', 'audio/laser_blast.wav')
    @game.load.audio('explosion', 'audio/explosion.wav')
    @game.load.audio('music', 'audio/music.mp3')

    @loadText = @game.add.text(8, 8, "Loaded: 0%", {fill: "#ffffff"})

    @game.load.onFileComplete.add(@fileLoaded, this);

  create: ->
    @game.state.start('menu')

  fileLoaded: (percentage) ->
    @loadText.text = "Loaded: " + percentage + "%"

exports.Preloader = Preloader
