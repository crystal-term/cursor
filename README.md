<div align="center">
  <img src="./assets/term-logo.png" alt="term logo">
</div>

# Term::Cursor

![spec status](https://github.com/crystal-term/cursor/workflows/specs/badge.svg)

> Terminal cursor positioning, visibility and text manipulation.

The purpose of this library is to help move the terminal cursor around and manipulate text by using intuitive method calls.

## Contents

- [Term::Cursor](#termcursor)
  - [Contents](#contents)
  - [Installation](#installation)
  - [1. Usage](#1-usage)
  - [2. Interface](#2-interface)
    - [2.1 Cursor Positioning](#21-cursor-positioning)
      - [2.1.1 move_to(x, y)](#211-movetox-y)
      - [2.1.2 move(x, y)](#212-movex-y)
      - [2.1.3 up(n)](#213-upn)
      - [2.1.4 down(n)](#214-downn)
      - [2.1.5 forward(n)](#215-forwardn)
      - [2.1.6 backward(n)](#216-backwardn)
      - [2.1.7 column(n)](#217-columnn)
      - [2.1.8 row(n)](#218-rown)
      - [2.1.9 next_line](#219-nextline)
      - [2.1.10 prev_line](#2110-prevline)
      - [2.1.11 save](#2111-save)
      - [2.1.12 restore](#2112-restore)
      - [2.1.13 current](#2113-current)
    - [2.2 Cursor Visibility](#22-cursor-visibility)
      - [2.2.1 show](#221-show)
      - [2.2.2 hide](#222-hide)
      - [2.2.3 invisible(stream)](#223-invisiblestream)
    - [2.3 Text Clearing](#23-text-clearing)
      - [2.3.1 clear_char(n)](#231-clearcharn)
      - [2.3.2 clear_line](#232-clearline)
      - [2.3.3 clear_line_before](#233-clearlinebefore)
      - [2.3.4 clear_line_after](#234-clearlineafter)
      - [2.3.5 clear_lines(n, direction)](#235-clearlinesn-direction)
      - [2.3.6 clear_screen](#236-clearscreen)
      - [2.3.7 clear_screen_down](#237-clearscreendown)
      - [2.3.8 clear_screen_up](#238-clearscreenup)
    - [2.4 Scrolling](#24-scrolling)
      - [2.4.1 scroll_down](#241-scrolldown)
    - [2.4.2 scroll_up](#242-scrollup)
  - [Contributing](#contributing)
  - [Contributors](#contributors)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cursor:
       github: crystal-term/cursor
   ```

2. Run `shards install`

## 1. Usage

**Term::Cursor** is just a module hence you can reference it for later like so:

```crystal
require "term-cursor"
cursor = Term::Cursor
```

and to move the cursor current position by 5 rows up and 2 columns right do:

```crystal
print cursor.up(5) + cursor.forward(2)
```

or call `move` to move cursor relative to current position:

```crystal
print cursor.move(5, 2)
```

to remove text from the current line do:

```crystal
print cursor.clear_line
```

## 2. Interface

### 2.1 Cursor Positioning

All methods in this section allow to position the cursor around the terminal viewport.

Cursor movement will be bounded by the current viewport into the buffer. Scrolling (if available) will not occur.

#### 2.1.1 move_to(x, y)

Set the cursor absolute position to `x` and `y` coordinate, where `x` is the column of the `y` line.

If no row/column parameters are provided, the cursor will move to the home position, at the upper left of the screen:

```crystal
cursor.move_to
```

#### 2.1.2 move(x, y)

Move cursor by x columns and y rows relative to its current position.

#### 2.1.3 up(n)

Move the cursor up by `n` rows; the default n is `1`.

#### 2.1.4 down(n)

Move the cursor down by `n` rows; the default n is `1`.

#### 2.1.5 forward(n)

Move the cursor forward by `n` columns; the default n is `1`.

#### 2.1.6 backward(n)

Move the cursor backward by `n` columns; the default n is `1`.

#### 2.1.7 column(n)

Cursor moves to `<n>`th position horizontally in the current line.

#### 2.1.8 row(n)

Cursor moves to the `<n>`th position vertically in the current column.

#### 2.1.9 next_line

Move the cursor down to the beginning of the next line.

#### 2.1.10 prev_line

Move the cursor up to the beginning of the previous line.

#### 2.1.11 save

Save current cursor position.

#### 2.1.12 restore

Restore cursor position after a save cursor was called.

#### 2.1.13 current

Query current cursor position

### 2.2 Cursor Visibility

The following methods control the visibility of the cursor.

#### 2.2.1 show

Show the cursor.

#### 2.2.2 hide

Hide the cursor.

#### 2.2.3 invisible(stream)

To hide the cursor for the duration of the block do:

```crystal
cursor.invisible { ... }
```

By default standard output will be used but you can change that by passing a different stream that responds to `print` call:

```crystal
cursor.invisible(STDERR) { .... }
```

### 2.3 Text Clearing

All methods in this section provide APIs to modify text buffer contents.

#### 2.3.1 clear_char(n)

Erase `<n>` characters from the current cursor position by overwriting them with space character.

#### 2.3.2 clear_line

Erase the entire current line and return cursor to beginning of the line.

#### 2.3.3 clear_line_before

Erase from the beginning of the line up to and including the current position.

#### 2.3.4 clear_line_after

Erase from the current position (inclusive) to the end of the line/display.

#### 2.3.5 clear_lines(n, direction)

Erase `n` rows in given direction; the default direction is `:up`.

```crystal
cursor.clear_lines(5, :down)
```

#### 2.3.6 clear_screen

Erase the screen with the background colour and moves the cursor to home.

#### 2.3.7 clear_screen_down

Erase the screen from the current line down to the bottom of the screen.

#### 2.3.8 clear_screen_up

Erase the screen from the current line up to the top of the screen.

### 2.4 Scrolling

#### 2.4.1 scroll_down

Scroll display down one line.

### 2.4.2 scroll_up

Scroll display up one line.

## Contributing

1. Fork it (<https://github.com/crystal-term/cursor/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
