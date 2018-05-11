# shortbow

A lightweight 2D game engine built for usability.

It is _inspired_ by the following projects:

* [PixiJS](http://pixijs.download/dev/docs/index.html)
* [Phaser](https://phaser.io/docs/2.6.2/index)
* [Impact](http://impactjs.com/documentation/class-reference)

## Technical Overview

### References

* ...

### Libraries

Shortbow is a collection of libraries to facilitate the creation of your next awesome 2D web-based game, written in [Dart](https://dartlang.org), a modern object-oriented programming language.

#### `asset.dart`

Handles asset loading and caching. An asset is any _external_ file that is used at runtime to run a game. It can be (in a simple sense) images or sprites, sounds or music, level data, or even AI scripts.

#### `geometry.dart`

Math functions and value-type primitives used in the engine.

#### `painting.dart`

Low-level 2D painting library that abstracts away platform-specific APIs. It's not expected that most end-games will require this library, but it is available.

#### `render.dart`

High-level rendering API for manipulating the 2D scene graph.