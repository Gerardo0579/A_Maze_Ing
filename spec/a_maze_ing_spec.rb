require_relative '../src/a_maze_ing'

RSpec.describe "Invalid maze scenarios: " do

    context "Invalid mazes: " do
        it "responds with error when not matrix" do
            maze= {:data => "not array"}
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must be a Matrix.")
        end

        it "responds with error when empty maze matrix" do
            maze= [ ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must be a Matrix.")
        end
        
        it "responds with error when not enough rows nor columns" do
            maze= [ [] ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must have at least 3 rows.")
        end
        
        it "responds with error when not enough rows" do
            maze= [ [1, 2, 3] ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must have at least 3 rows.")
        end
        
        it "responds with error when not empty columns" do
            maze= [ [], [], [] ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must have at least 3 columns.")
        end

        it "responds with error when not enough columns" do
            maze= [ [1, 2], [1, 2], [1, 2] ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must have at least 3 columns.")
        end

        it "responds with error when not rectangular maze" do
            maze= [ [0, 0, 0], [1, 2, 0], [0, 0, 0], [0, 0, 0, 0] ]
            response = AMazeIng.solve(maze)

            expect(response[:details]).to eq("Maze must be perfectly rectangular.")
        end
    end
    
    context "Mazes with invalid data: " do
        it "responds with error when one invalid value" do
            maze = [
                [0, 0, 0],
                [0, 3, 0],
                [0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze only accept [-1, 0, 1, 2] as possible values.")
        end

        it "responds with error when two invalid values in same row" do
            maze = [
                [0, 0, 0],
                [3, 3, 0],
                [0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze only accept [-1, 0, 1, 2] as possible values.")
        end

        it "responds with error when two invalid values in same column" do
            maze = [
                [0, -4, 0],
                [0, 3, 0],
                [0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze only accept [-1, 0, 1, 2] as possible values.")
        end

        it "responds with error when no start position" do
            maze = [
                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze must have one and only one start position.")
        end

        it "responds with error when more than one start position" do
            maze = [
                [0, 0, 0],
                [0, 2, 0],
                [0, 2, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze must have one and only one start position.")
        end

        it "responds with error when no cheese" do
            maze = [
                [0, 0, 0],
                [0, 2, 0],
                [0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze must have one and only one cheese position.")
        end

        it "responds with error when more than one cheese" do
            maze = [
                [0, 0, 0],
                [1, 2, 1],
                [0, 1, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:details]). to eq("Maze must have one and only one cheese position.")
        end
    end

end

RSpec.describe "Valid maze scenarios: " do

    context "Without solution mazes: " do
       it "responds with cheese not found when not reachable" do
        maze = [
            [ 0, 0, 0, 0, 2, 0, 0, 0, 0],
            [-1,-1,-1,-1, -1,-1, 0, 0, 0],
            [-1, 1,-1,-1, 0,-1, 0, 0, 0],
            [-1, 0,-1,-1, 0,-1, 0, 0, 0],
            [-1, 0, 0, 0, 0,-1, 0, 0, 0],
            [-1,-1,-1,-1,-1,-1, 0, 0, 0]
        ]
        response = AMazeIng.solve(maze)
        expect(response[:details]). to eq( "404 code. Cheese not found" )
       end

       it "responds with cheese not found when mouse closed" do
        maze = [
            [ 0, 0, 0, 0, 1, 0, 0, 0, 0],
            [-1,-1,-1,-1, -1,-1, 0, 0, 0],
            [-1, 0,-1,-1, 0,-1, 0, 0, 0],
            [-1, 0,-1,-1, 0,-1, 0, 0, 0],
            [-1, 0, 2, 0, 0,-1, 0, 0, 0],
            [-1,-1,-1,-1,-1,-1, 0, 0, 0]
        ]
        response = AMazeIng.solve(maze)
        expect(response[:details]). to eq( "404 code. Cheese not found" )
       end

    end

    context "With solution mazes: " do
        it "responds with cheese position when easy valid maze" do
            maze = [
                [ 2, 0, 0,],
                [ 0, 0, 0,],
                [ 0, 0, 1,],
            ]
            response = AMazeIng.solve(maze)

            expect(response[:cheese]). to eq( [2, 2] )
        end

        it "responds with cheese position when standar valid maze" do
            maze = [
                [ 0, 0, 0, 0, 2, 0, 0, 0, 0],
                [-1,-1,-1,-1, 0,-1, 0, 0, 0],
                [-1, 1,-1,-1, 0,-1, 0, 0, 0],
                [-1, 0,-1,-1, 0,-1, 0, 0, 0],
                [-1, 0, 0, 0, 0,-1, 0, 0, 0],
                [-1,-1,-1,-1,-1,-1, 0, 0, 0]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:cheese]). to eq( [1, 2] )
        end
        
        it "responds with cheese position when hard valid maze" do
            maze = [
                [ 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 0],
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [ 0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [ 0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 0],
                [ 0,-1, 0, 0, 0,-1,-1,-1,-1,-1,-1, 0,-1, 0, 0],
                [ 0,-1, 0,-1, 0, 0, 0, 0, 0, 0, 0, 0,-1, 0,-1],
                [ 0,-1, 0,-1, 0,-1,-1,-1,-1,-1,-1, 0,-1, 0,-1],
                [ 0, 0, 0,-1, 0, 0, 0, 0, 0, 0, 0, 0,-1, 0, 1]
            ]
            response = AMazeIng.solve(maze)

            expect(response[:cheese]). to eq( [14, 9] )
        end
    end

end