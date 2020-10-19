require_relative 'maze_solver'
require_relative '../aspect/maze_solver_aspect' #Without this, Aspector wouldn't be used

class AMazeIng

    def self.solve(maze)
        return MazeSolver.find_cheese(maze)
    end
    
    def self.generateMaze(rows, columns)
        #TODO. Add generate maze functionality
        
        #! Ideally, not implemented code should NOT be allowed (like this method)
        # But since this class may look like over-engineering, this is written to show
        # other kind of behavior that could be contained here
    end

end