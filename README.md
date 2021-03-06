# Volt::Slider

Simple slider of any content for Volt framework.

## How it works

.slider-viewport with fixed width and overflow: hidden, inside it .slider-container with much longer width, it's moving inside .slider-viewport by jquery.animate on it's left property

## Changelog

0.2.0 Added prev/next buttons

## Installation

Add this line to your application's Gemfile:

    gem 'volt-slider'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volt-slider

Add to dependencies.rb

    component 'slider'

## Usage

html:

    <:slider interval_time=5000 transition_time=300 stop_on_mouseover="false">
        Your content here, outer div's should be float: left, position: relative, i.e:
        <div class="slider">
            ...
        </div>
        <div class="slider">
            ...
        </div>
    </:slider>
css:

    .slider {
      position: relative;
      float: left;
    }

## Configuration

Attributes

defaults:

    interval_time: 3000,       #interval between moves in ms
    transtion_time: 700,
    leftmost_point: -1600,     #if container moved farther than that it's reset to zero - showing first slide
    stop_on_mouseover: true
    css_visible_width: 800
    css_visible_height: 260px
    css_container_length: 9999
    show_prev_next_icons: true

## Contributing

This is my first Volt component, any comments or contributions would be appreciated!

1. Fork it ( http://github.com/[my-github-username]/volt-slider/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
