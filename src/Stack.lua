local Stack = {}
Stack.__index = Stack

function Stack.new()
    local self = setmetatable({}, Stack)

    -- Properties
    self.top = 1
    self.size = 0
end

function Stack:Push(element)
    -- Add to top
    self.values[self.top] = element

    -- Increment top
    self.top += 1

    -- Increment size
    self.size += 1
end

function Stack:Pop()
    -- Guard
    if self.size == 0 then return end

    -- Decrement top
    self.top -= 1

    -- Decrement size
    self.size -= 1

    return self.values[self.top]
end

function Stack:Top()
    return self.values[self.top - 1]
end

return Stack