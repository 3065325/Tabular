local Map = {}
Map.__index = Map

function Map.new()
    local self = setmetatable({}, Map)

    -- Properties
    self.size = 0

    -- Data
    self.index = {}
    self.values = {}
    self.keys = {}

    return self
end

function Map:_add(key, value)
    -- Increment size
    self.size += 1

    -- Add to index
    self.index[key] = self.size

    -- Add to values
    self.values[self.size] = value

    -- Add to keys
    self.keys[self.size] = key
end

function Map:Contains(key)
    return not not self.index[key]
end

function Map:IndexOf(key)
    return self.index[key]
end

function Map:Set(key, value)
    local index = self:IndexOf(key)
    if not index then
        self:_add(key, value)
    else
        self.values[index] = value
    end
end

function Map:Get(key)
    return self.values[self.index[key]]
end

function Map:Remove(key)
    -- Locate
    local index = self:IndexOf(key)
    if not index then return end

    local last = self.values[self.size]

    -- Swap Array
    self.values[index] = last
    self.values[self.size] = nil

    -- Swap Index
    self.index[last] = index
    self.index[key] = nil

    -- Swap Keys
    self.keys[index] = last
    self.keys[self.size] = nil

    -- Decrement size
    self.size -= 1
end

function Map:GetKeys()
    return self.keys
end

function Map:GetValues()
    return self.values
end

function Map:Size()
    return self.size
end

return Map
