
class Spacecraft
  def initialize(x, y, z, direction)
    @x = x
    @y = y
    @z = z
    @direction = direction
  end

  def move(command)
    case command
    when 'f'
      move_forward
    when 'b'
      move_backward
    end
  end

  def turn(command)
    case command
    when 'l'
      turn_left
    when 'r'
      turn_right
    end
  end

  def tilt(command)
    case command
    when 'u'
      tilt_up
    when 'd'
      tilt_down
    end
  end

  def execute_commands(commands)
    commands.each do |command|
      case command
      when 'f', 'b'
        move(command)
      when 'l', 'r'
        turn(command)
      when 'u', 'd'
        tilt(command)
      end
    end
  end

  def get_position
    [@x, @y, @z, @direction]
  end

  private

  def move_forward
    case @direction
    when 'N'
      @y += 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    when 'W'
      @x -= 1
    when 'Up'
      @z += 1
    when 'Down'
      @z -= 1
    end
  end

  def move_backward
    case @direction
    when 'N'
      @y -= 1
    when 'S'
      @y += 1
    when 'E'
      @x -= 1
    when 'W'
      @x += 1
    when 'Up'
      @z -= 1
    when 'Down'
      @z += 1
    end
  end

  def turn_left
    @direction = case @direction
                 when 'N' then 'W'
                 when 'S' then 'E'
                 when 'E' then 'N'
                 when 'W' then 'S'
                 else @direction
                 end
  end

  def turn_right
    @direction = case @direction
                 when 'N' then 'E'
                 when 'S' then 'W'
                 when 'E' then 'S'
                 when 'W' then 'N'
                 else @direction
                 end
  end

  def tilt_up
    @direction = case @direction
                 when 'N', 'S' then 'Up'
                 when 'Up' then 'S'
                 when 'Down' then 'N'
                 else @direction
                 end
  end

  def tilt_down
    @direction = case @direction
                 when 'N', 'S' then 'Down'
                 when 'Up' then 'N'
                 when 'Down' then 'S'
                 else @direction
                 end
  end
end

# Example usage:
starting_position = [0, 0, 0]
initial_direction = 'N'
commands = ["f", "r", "u", "b", "l"]

spacecraft = Spacecraft.new(starting_position[0], starting_position[1], starting_position[2], initial_direction)
spacecraft.execute_commands(commands)
puts "Final Position: #{spacecraft.get_position}"
