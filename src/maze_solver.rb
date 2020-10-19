require_relative '../util/util'

class MazeSolver
    extend Methods

    def self.find_cheese(maze)
        start_point = determine_start_position(maze)
        print_start_position(start_point)
        
        return search_cheese(maze, start_point)
    end

    #* PRIVATE METHODS 

    def self.determine_start_position(maze)
        maze.each_with_index do |row, index_r|
            row.each_with_index { |cell, index_c| return [index_r, index_c] if cell == Util::Values::START_POSITION_VALUE }
        end
    end

    def self.cheese_found?(maze, position)
        maze[position[0]][position[1]] == Util::Values::CHEESE_VALUE
    end
    
    def self.search_cheese(maze, current_position)
        return win_response(current_position) if cheese_found?(maze, current_position)
        
        maze_updtd = mark_position(maze, current_position)
        available_paths = determine_available_paths(maze_updtd, current_position)
        return going_back_response unless available_paths?(available_paths)
    
        while available_paths?(available_paths)
            next_position = available_paths.shift
            response_search = search_cheese(maze_updtd, next_position)
            return response_search if response_search[:solved?]
        end

        return end_of_road_response(current_position)
    end
    
    def self.mark_position(maze, position)
        maze[position[0]][position[1]] = Util::Values::VISITED_VALUE
        print_current_position(position)
        return maze
    end
    
    def self.determine_available_paths(maze, current_position)
        #Determine available paths orthogonaly
        available_spaces = Array.new
        valid_states = [Util::Values::AVAILABLE_SPACE, Util::Values::CHEESE_VALUE]

        available_spaces << [current_position[0]-1, current_position[1]] if current_position[0] > 0 and valid_states.any? { |s| s == maze[current_position[0]-1][current_position[1]] }
        available_spaces << [current_position[0], current_position[1]-1] if current_position[1] > 0 and valid_states.any? { |s| s == maze[current_position[0]][current_position[1]-1] }
        
        available_spaces << [current_position[0]+1, current_position[1]] if current_position[0] < (maze.size-1) and valid_states.any? { |s| s == maze[current_position[0]+1][current_position[1]] }
        available_spaces << [current_position[0], current_position[1]+1] if current_position[1] < (maze[0].size-1) and valid_states.any? { |s| s == maze[current_position[0]][current_position[1]+1] }
    
        return available_spaces
    end

    def self.available_paths?(paths)
        paths.size > Util::Values::NO_AVAILABLE_PATHS
    end

    #* Private Output methods
    def self.end_of_road_response(position)
        std_output { "\nOur mouse is going back by X: #{position[1]}, Y: #{position[0]}" }
        return {:solved? => false, :details => Util::Responses::CHEESE_NOT_FOUND}
    end

    def self.going_back_response
        std_output { "\n Closed road... Going back..." }
        return {:solved? => false, :details => Util::Responses::CLOSED_ROAD}
    end

    def self.print_current_position(position)
        std_output { "\nOur mouse is stepping on X: #{position[1]}, Y: #{position[0]}" }
    end

    def self.print_start_position(start_position)
        std_output { "\nOur mouse starts on X: #{start_position[1]}, Y: #{start_position[0]}" }
    end

    def self.win_response(position)
        puts "\n Cheese was found on position #{position.reverse}..."
        return {:solved? => true,
                :details => "#{Util::Responses::CHEESE_FOUND} on X: #{position[1]}, Y: #{position[0]}",
                :cheese => position.reverse}
    end


    #* Private definitions
    private_class_method :determine_start_position
    private_class_method :cheese_found?
    private_class_method :search_cheese
    private_class_method :mark_position
    private_class_method :determine_available_paths
    private_class_method :available_paths?
    private_class_method :end_of_road_response
    private_class_method :going_back_response
    private_class_method :print_current_position
    private_class_method :win_response

end