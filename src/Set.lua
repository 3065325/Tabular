local Set = {}
Set.__index = Set

function Set.new()
    local self = setmetatable({}, Set)

    -- Properties
    self.size = 0

    -- Data
    self.index = {}
    self.values = {}

    return self
end

function Set:_add(value)
    -- Increment size
    self.size += 1

    -- Add to index
    self.index[value] = self.size

    -- Add to values
    self.values[self.size] = value
end

function Set:Contains(value)
    return not not self.index[value]
end

function Set:Add(value)
    -- Guard
    if self:Contains(value) then return end

    -- Add
    self:_add(value)
end

function Set:Remove(value)
    if not self:Contains(value) then return end

    -- Locate
    local index = self.index[value]
    local last = self.values[self.size]

    -- Swap Array
    self.values[index] = last
    self.values[self.size] = nil

    -- Swap Index
    self.index[last] = index
    self.index[value] = nil

    -- Decrement size
    self.size -= 1
end

function Set:GetValues()
    return self.values
end

function Set:Size()
    return self.size
end

return Set