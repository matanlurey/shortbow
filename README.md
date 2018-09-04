# shortbow 🏹

_This library is incomplete and a work in-progress._

A lightweight 2D game utility library built for usability.

[![Build Status](https://travis-ci.org/matanlurey/shortbow.svg?branch=master)][1]

[1]: https://travis-ci.org/matanlurey/shortbow

It is _inspired_ by the following projects:

* [PixiJS](http://pixijs.download/dev/docs/index.html)
* [Phaser](https://phaser.io/docs/2.6.2/index)
* [Impact](http://impactjs.com/documentation/class-reference)

## Technical Overview

### Libraries

Shortbow is a collection of libraries to facilitate the creation of your next
awesome 2D web-based game, written in [Dart](https://dartlang.org), a modern
object-oriented programming language. Some of the elements of this library are
more specific to writing a simple game engine, and others are more related to
game mechanics or common patterns needed.

#### `common.dart`

Common useful methods when using this library (and used _by_ this library).

#### `drawing.dart`

Drawing libraries and classes that abstract away platform-specific APIs.

#### `math.dart`

Math functions and value-type primitives useful in games.

#### `mechanics.dart`

Different mechanics-related APIs, such as dice, decks of cards, and more.
