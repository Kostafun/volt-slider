# Volt::Slider

Simple slider of any content for Volt framework.

## How it works

.slider-viewport with fixed width and overflow: hidden, inside it .slider-container with much longer width, it's moving inside .slider-viewport by jquery.animate on it's left property

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
Sass variables

defaults:

    $slider_visible_width:'800px' !default
    $slider_visible_height: '260px' !default
    $slider_container_length: '2400px' !default

Attributes

defaults:

    interval_time: 3000,       #interval between moves in ms
    move_length:  800,    #in pixels
    transtion_time: 700,
    leftmost_point: -1600,     #if container moved farther than that it's reset to zero - showing first slide
    stop_on_mouseover: true


## Contributing

This is my first Volt component, any comments or contributions would be appreciated!

1. Fork it ( http://github.com/[my-github-username]/volt-slider/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
