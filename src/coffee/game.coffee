exports = this

class Game

  constructor: (@game) ->
    @player = null
    @BLAST_DELAY = 400
    @score = 0

  preload: ->
    @game.load.image('player', 'img/spaceship.png')
    @game.load.image('laserblast', 'img/laser_blast.png')
    @game.load.image('asteroid', 'img/asteroid.png')
    @game.load.image('background', 'img/background.png')
    @game.load.image('ground', 'img/ground_trigger.png')
    @game.load.audio('laser', 'audio/laser_blast.wav')
    @game.load.audio('explosion', 'audio/explosion.wav')
    @game.load.audio('music', 'audio/music.mp3')

  create: ->
    game.add.sprite(0, 0, 'background')
    @game.physics.startSystem(Phaser.Physics.ARCADE);

    @player = game.add.sprite(512,768-96, 'player')
    @game.physics.enable(@player)
    @player.body.collideWorldBounds = true

    @ground = game.add.sprite(0, 760, 'ground')
    @game.physics.enable(@ground)

    @cursors = @game.input.keyboard.createCursorKeys()

    @asteroids = game.add.group()
    @asteroids.enableBody = true
    @asteroids.physicsBodyType = Phaser.Physics.ARCADE;

    @lasers = game.add.group()
    @lasers.enableBody = true
    @lasers.physicsBodyType = Phaser.Physics.ARCADE;

    @blast = @game.add.sound('laser')
    @explosion = @game.add.sound('explosion')

    @music = @game.add.sound('music', 1, true)
    @music.play()

    @lastBlastShotAt = 0

    @scoreText = @game.add.text(8, 8, "Score: 0", {fill: "#ffffff"})

  update: ->
    if (@cursors.left.isDown)
      @player.body.velocity.x = -192
    else if (@cursors.right.isDown)
      @player.body.velocity.x = 192
    else
      @player.body.velocity.x = 0

    if @cursors.up.isDown
      unless (this.game.time.now - @lastBlastShotAt < @BLAST_DELAY)
        blast = @lasers.create(@player.x + 32, 768-96-20, 'laserblast')
        blast.body.velocity.y = -256
        blast.checkWorldBounds = true
        blast.outOfBoundsKill = true
        @blast.play()
        @lastBlastShotAt = this.game.time.now;

    if Math.random() < 0.01
      x = Math.floor(Math.random() * 1024) + 1
      xVelocity = Math.floor(Math.random() * 128) + 1 - 64
      asteroid = @asteroids.create(x, 0, 'asteroid')
      asteroid.body.velocity.y = 128
      asteroid.body.velocity.x = xVelocity
      asteroid.checkWorldBounds = true
      asteroid.outOfBoundsKill = true
      asteroid.anchor.setTo(0.5, 0.5);
      asteroid.body.angularVelocity = Math.floor(Math.random() * 128) + 1 - 64

    game.physics.arcade.overlap(@lasers, @asteroids, @collisionHandler, null, this);
    game.physics.arcade.overlap(@ground, @asteroids, @groundHandler, null, this);

  collisionHandler: (laser, asteroid) ->
    laser.kill()
    asteroid.kill()
    @explosion.play()
    @score += 100
    @scoreText.text = "Score: " + @score

  groundHandler: (ground, asteroid) ->
    asteroid.kill()
    @score -= 100
    @scoreText.text = "Score: " + @score

exports.Game = Game