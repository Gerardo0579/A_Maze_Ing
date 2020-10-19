require_relative '../util/util'

class MazeSolverValidator
    
    def self.is_maze_valid?(maze)
        #* Basic validations
        return { :valid? => false, :details => "Maze must be a Matrix." } unless maze.is_a? Array
        return { :valid? => false, :details => "Maze must be a Matrix." } if maze.size < 1 or maze.empty?
        return { :valid? => false, :details => "Maze must have at least 3 rows." } if maze.size < 3
        return { :valid? => false, :details => "Maze must have at least 3 columns." } if maze.any? {|r| r.size < 3 }

        #* Valid values
        valid_values = [Util::Values::VISITED_VALUE, Util::Values::AVAILABLE_SPACE, Util::Values::CHEESE_VALUE, Util::Values::START_POSITION_VALUE]
        cheese_value = Util::Values::CHEESE_VALUE
        start_value = Util::Values::START_POSITION_VALUE

        #* Advanced validations
        return { :valid? => false, :details => "Maze must be perfectly rectangular." } unless rectangular_maze?(maze)
        return { :valid? => false, :details => "Maze only accept #{valid_values} as possible values." } if maze.map{|r| (r - valid_values).empty? }.any?{|res| !res}
        return { :valid? => false, :details => "Maze must have one and only one start position." } unless count_appereances(maze, start_value) == 1
        return { :valid? => false, :details => "Maze must have one and only one cheese position." } unless count_appereances(maze, cheese_value) == 1

        return { :valid? => true, :details => "Maze is ok!" }
    end

    #* PRIVATE METHODS
    def self.rectangular_maze?(maze)
        return maze.map{|r| r.size}.reduce(Hash.new(0)){|acc,n| acc[n] += 1; acc }.size == 1
    end

    def self.count_appereances(maze, value)
        maze.map { |r|
            r.reduce(0){|sum, val| sum += 1 if val == value; sum } 
        }.reduce(0){ |acc, val|
            acc += val if  val > 0; acc
        }
    end
    
    #* Private definitions
    private_class_method :rectangular_maze?
    private_class_method :count_appereances
end