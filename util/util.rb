module Util
    module Responses
        CHEESE_NOT_FOUND = "404 code. Cheese not found"
        CHEESE_FOUND = "200 code. Cheese found"
        CLOSED_ROAD = "500 code. End of the road reached"
    end

    module Values
        START_POSITION_VALUE = 2
        CHEESE_VALUE = 1
        AVAILABLE_SPACE = 0
        VISITED_VALUE = -1
        NO_AVAILABLE_PATHS = 0
    end

end

module Methods
    def std_output(&block)
        # So I could send string to another output if needed
        puts block.call
    end
end