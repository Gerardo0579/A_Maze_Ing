require 'aspector'
require_relative 'maze_solver_validator'
require_relative '../src/maze_solver'

class MazeSolverAspect < Aspector::Base
    extend Methods

    around :find_cheese, method_arg: true do |method, proxy, *args, &block|
        validation_results = MazeSolverValidator.is_maze_valid?(*args, &block)
        
        if validation_results[:valid?]
            std_output { "Starting Maze Solver" }
            return proxy.call(*args, &block)
        else
            response = validation_results[:details]
            return {:solved? => false, :details => validation_results[:details] } #To keep consistent output
        end

        return {:details => "Failed execution"}
    end

end

# Aspector implementation was based on: https://stackoverflow.com/questions/32253283/how-to-use-the-aspector-gem-to-wrap-class-methods
MazeSolverAspect.apply(MazeSolver, class_methods: true)