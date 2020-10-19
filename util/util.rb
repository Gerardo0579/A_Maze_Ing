module Util
    module Responses
        # This codes are not intended to emulate web api responses, it rather try to have funny answers
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
        # To allow complex functionality if needed
        puts block.call
    end
end