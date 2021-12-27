local BinaryHeap = {}
BinaryHeap.__index = BinaryHeap

function BinaryHeap.new(invariant)
    local self = {
        -- Functions
        invariant = invariant;

        -- Properties
        size = 0;

        -- Storage
        lookup = {};
        heap = {};
    }

    return setmetatable(self, BinaryHeap)
end

function BinaryHeap:_swap(a, b)
    -- Update Heap
    self.heap[a], self.heap[b] = self.heap[b], self.heap[a]

    -- Update Lookup
    self.lookup[self.heap[a]] = a
    self.lookup[self.heap[b]] = b
end

function BinaryHeap:_siftUp(index)
    -- Root Node
    if index == 1 then return end

    -- Calculate Parent Index
    local parent = math.floor(index / 2)

    -- Compare & Swap
    if self.invariant(self.heap[index], self.heap[parent]) then
        self:_swap(index, parent)
        self:_siftUp(parent)
    end
end

function BinaryHeap:_siftDown(index)
    -- Leaf Node
    if index * 2 > self.size then return end

    -- Calculate Left & Right Child Index
    local left = index * 2
    local right = index * 2 + 1

    -- Calculate Smallest Child Index
    local smallest
    if right > self.size then
        smallest = left
    else
        smallest = self.invariant(self.heap[left], self.heap[right]) and left or right
    end

    -- Compare & Swap
    if self.invariant(self.heap[smallest], self.heap[index]) then
        self:_swap(index, smallest)
        self:_siftDown(smallest)
    end
end

function BinaryHeap:Push(value)
    -- Increase Size
    self.size = self.size + 1

    -- Add value
    self.heap[self.size] = value
    self.lookup[value] = self.size

    -- Sift Up
    self:_siftUp(self.size)
end

function BinaryHeap:Pop()
    -- Store Root
    local root = self.heap[1]

    -- Swap Root & Last Node
    self:_swap(1, self.size)

    -- Remove Last Node
    self.lookup[self.heap[self.size]] = nil
    self.heap[self.size] = nil

    -- Decrease Size
    self.size = self.size - 1

    -- Sift Down
    self:_siftDown(1)

    return root
end

function BinaryHeap:Update(value)
    -- Get Index
    local index = self.lookup[value]

    -- Sift
    self:_siftUp(index)
    self:_siftDown(index)
end

function BinaryHeap:Peek()
    return self.heap[1]
end

function BinaryHeap:Size()
    return self.size
end

function BinaryHeap:Contains(value)
    return not not self.lookup[value]
end

function BinaryHeap:Print()
    for i = 1, self.size do
        local indent = string.rep(" ", math.floor(math.log(i, 2)) * 4)
        print(indent .. self.heap[i])
    end
end

return BinaryHeap