if RUBY_PLATFORM == 'opal'

  require 'opal-jquery'

end

module Slider
  class MainController < Volt::ModelController
        def default_options
          {
            interval_time: 3000,       #interval between moves in ms
            transition_time: 700,
            leftmost_point: -1600,     #if container moved farther than that it's reset to zero - showing first slide
            stop_on_mouseover: true,
            css_visible_width: 800,
            css_visible_height: 260,
            css_container_length: 9999,
            show_prev_next_icons: true
          }
        end

        def index
          create_options_vars(default_options)
        end

        def create_options_vars(options)
          options.each { |k,v| puts "@#{k}" + (( (attrs.send(k) == '') ? nil : attrs.send(k) )  || v).to_s }
          options.each { |k,v| instance_variable_set("@#{k}", (( (attrs.send(k) == '') ? nil : attrs.send(k) )|| v)) } #instance variables from attrs

          (@show_prev_next_icons == true or @show_prev_next_icons == 'true') ? @show_prev_next_icons = true : @show_prev_next_icons = false
          (@stop_on_mouseover==true or @stop_on_mouseover=='true') ? @stop_on_mouseover = true : @stop_on_mouseover = false
        end

        def show_icons?
          (@show_prev_next_icons == true or @show_prev_next_icons == 'true') ? true :  false
        end


        def move
          if RUBY_PLATFORM == 'opal'
            el = Element.find('.slider-container')
            moveto = el.css('left').to_i - @css_visible_width.to_i
            if moveto < @leftmost_point.to_i
              @leftmost_point_set = moveto + @css_visible_width.to_i
              moveto = 0
            end
            el.animate({left: moveto, speed:  @transition_time.to_i })
          end
        end

        def prev
          if RUBY_PLATFORM == 'opal'
            el = Element.find('.slider-container')
            moveto = el.css('left').to_i + @css_visible_width.to_i
            if moveto > 0
              moveto = @leftmost_point_set || @leftmost_point
            end
            el.animate({left: moveto, speed:  @transition_time.to_i })
          end
        end

        def index_ready
          if RUBY_PLATFORM == 'opal'
            if @stop_on_mouseover
              el = Element.find('.slider-viewport')

              el.on :mouseover do
                clear_interval(@interval)
              end

              el.on :mouseout do
                @interval = set_interval(@interval_time) do move end
              end
            end

            @interval = set_interval(@interval_time) do move end

          end
        end

        def before_index_remove
          if RUBY_PLATFORM == 'opal'
            clear_interval(@interval)
          end
        end

        def set_interval( time=0, &block )
          if RUBY_PLATFORM == 'opal'
            `setInterval(function(){#{block.call}}, time)`
          end
        end

        def clear_interval( interval )
          if RUBY_PLATFORM == 'opal'
            `clearInterval(#{interval})`
          end
        end
    private

    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end