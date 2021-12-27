local Map = require(script.Parent.Map)

local Graph = {}
Graph.__index = Graph

function Graph.new()
    local self = setmetatable({}, Graph)

    -- Data
    self.connections = {}

    return self
end

function Graph:Connect(object1, object2, data)
    -- Build Data
    if not self.connections[object1] then self.connections[object1] = Map.new() end
    if not self.connections[object2] then self.connections[object2] = Map.new() end

    -- Connect
    self.connections[object1]:Set(object2, data or true)
    self.connections[object2]:Set(object1, data or true)
end

function Graph:Disconnect(object1, object2)
    -- Disconnect
    if self.connections[object1] then self.connections[object1]:Remove(object2) end
    if self.connections[object2] then self.connections[object2]:Remove(object1) end

    -- Clean
    if self.connections[object1]:Size() == 0 then self.connections[object1] = nil end
    if self.connections[object2]:Size() == 0 then self.connections[object2] = nil end
end

function Graph:GetNeighbors(object)
    return self.connections[object] and self.connections[object]:GetKeys() or {}
end

function Graph:GetConnectionData(object1, object2)
    return self.connections[object1] and self.connections[object1]:Get(object2) or nil
end

function Graph:IsConnected(object1, object2)
    return self.connections[object1] and self.connections[object1]:Contains(object2)
end

return Graph