local Queue = {}
Queue.__index = Queue

function Queue:PushBack(value)
    -- Add to tail
    self.values[self.tail] = value

    -- Increment tail
    self.tail -= 1

    -- Increment size
    self.size += 1
end

function Queue:PushFront(value)
    -- Add to head
    self.values[self.head] = value

    -- Increment head
    self.head += 1

    -- Increment size
    self.size += 1
end

function Queue:PopBack()
    -- Guard
    if self.size == 0 then return end

    -- Decrement tail
    self.tail += 1

    -- Decrement size
    self.size -= 1

    return self.values[self.tail]
end

function Queue:PopFront()
    -- Guard
    if self.size == 0 then return end

    -- Decrement head
    self.head -= 1

    -- Decrement size
    self.size -= 1

    return self.values[self.head]
end

function Queue:Front()
    return self.values[self.head - 1]
end

function Queue:Back()
    return self.values[self.tail + 1]
end

function Queue:Size()
    return self.size
end

return Queue