# Module containing constants for the game

require 'gosu'

module Solo
  BACKGROUNDZ = 0
  SPRITEZ = 1

  # Background image dimensions
  WINX = 735
  WINY = 415

  # Sprite frame refresh rate (in milliseconds)
  FRAMERATE = 50

  # Window class definition
  class Window < Gosu::Window
    def initialize()
      super(WINX, WINY)
      self.caption = "Solo Star"

      @background = Gosu::Image.new("media/star_background.jpg", tileable: true)
      @song = Gosu::Song.new("media/soundtrack.mp3")
      @sprite = Star_sprite.new()


    end

    def update()
      @song.play()
      @sprite.place(self.mouse_x, self.mouse_y)

    end

    def draw()
      @background.draw(0,0, BACKGROUNDZ)
      @sprite.draw()

    end

    def needs_cursor?
      return false
    end

    def button_down(id)
      if id == Gosu::KB_ESCAPE
        self.close
      else
        super()
      end
    end
  end

  #Sprite class definition
  class Star_sprite
    attr_accessor :x, :y, :z

    def initialize()
      self.x = 0
      self.y = 0
      self.z = SPRITEZ
      
      @animation = Animation.new()
    end
    
    def place(x, y)
      self.x = x
      self.y = y
    end

    def draw()
      img = @animation.frame(FRAMERATE)
      img.draw(@x - img.width, @y - img.height, SPRITEZ, 2, 2)
    end
  end

  #Animation class definition
  class Animation
    attr_reader :tileset

    def initialize()
      @tileset = Gosu::Image.load_tiles("media/star2.png", 32, 32)
    end

    def frame(x)
      return @tileset[(Gosu::milliseconds / x) % @tileset.length]
    end
  end
end
