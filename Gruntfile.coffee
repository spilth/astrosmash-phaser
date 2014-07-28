module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  SRC_PATH = 'src'
  DIST_PATH = 'dist'

  grunt.initConfig
    clean:
      all:
        ['dist']

    coffee:
      compile:
        files: {
          'dist/js/game.js': 'src/coffee/game.coffee'
        }

    copy:
      dist:
        files: [
          {
            cwd: SRC_PATH
            expand: true
            src: ['**/*', '!coffee/**']
            dest: DIST_PATH
          },
          {
            cwd: 'bower_components'
            expand: true
            flatten: true
            src: ['phaser-official/build/phaser.min.js']
            dest: "#{DIST_PATH}/js"
          }
        ]

    watch:
      html:
        files: ['src/**/*']
        tasks: ['build']

    connect:
      server:
        options:
          base: DIST_PATH
          livereload: true

  grunt.registerTask 'build', [
    'copy'
    'coffee'
  ]

  grunt.registerTask 'default', [
    'build'
  ]

  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'watch'
  ]

