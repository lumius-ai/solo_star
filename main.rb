# Main script for the solo_star game
#
require_relative "lib/Solo.rb"


def main()
  window = Solo::Window.new()
  window.show()

end

main()
