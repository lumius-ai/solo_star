# Module containing constants for the game

require 'gosu'

module Solo
  BACKGROUNDZ = 0
  SPRITEZ = 1

  # Background image dimensions
  WINX = 735
  WINY = 415

  # Window class definition
  class Window < Gosu::Window
    def initialize()
      super(WINX, WINY)
      self.caption = "Solo Star"

      @background = Gosu::Image.new("media/star_background.jpg", tileable: true)
      @song = Gosu::Song.new("media/soundtrack.mp3")
      #sprite = Star_sprite.new()


    end

    def update()
      @song.play()

    end

    def draw()
      @background.draw(0,0, BACKGROUNDZ)

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

  #Animation class definition
end
