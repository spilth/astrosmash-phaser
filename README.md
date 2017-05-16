# Astrosmash Phaser [ ![Codeship Status for spilth/astrosmash-phaser](https://app.codeship.com/projects/619ef680-1bfd-0135-fa21-0ecb176111b5/status?branch=master)](https://app.codeship.com/projects/219842)

Clone of the [Intellivision](http://www.intellivisionlives.com) classic [Astrosmash](http://www.intellivisionlives.com/bluesky/games/credits/space.html#astrosmash) built using [Phaser](http://phaser.io/).

Playable at [http://astrosmash.spilth.org](http://astrosmash.spilth.org)

## Prerequistes

This project requires NodeJS, Grunt and Bower. On a Mac you can do the following:

    $ brew install node
    $ npm install -g grunt-cli
    $ npm install -g bower

## Build

To check out the project, retrieve the dependencies and serve the HTML:

    $ git clone git@github.com:spilth/astrosmash-phaser.git
    $ cd astrosmash-phaser
    $ npm install
    $ bower install
    $ grunt serve

Then head to <http://localhost:8000/>

