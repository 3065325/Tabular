local Queue = {}
Queue.__index = Queue

function Queue.new()
  local self = setmetatable({}, Queue)
  
  --Pointers
  self.tail = 0
  self.head = 1
  
  --Data
  self.size = 0

  return self
end

function Queue:PushBack(value)
    -- Add to tail
    self[self.tail] = value

    -- Increment tail
    self.tail -= 1

    -- Increment size
    self.size += 1
end

function Queue:PushFront(value)
    -- Add to head
    self[self.head] = value

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

    return self[self.head]
end

function Queue:Front()
    return self[self.head - 1]
end

function Queue:Back()
    return self[self.tail + 1]
end

function Queue:Size()
    return self.size
end

return Queue
->
local Queue = {}
Queue.__index = Queue

function Queue:PushBack(value)
    -- Add to tail
    self[self.tail] = value

    -- Decrement tail
    self.tail -= 1

    -- Increment size
    self.size += 1
end

function Queue:PushFront(value)
    -- Add to head
    self[self.head] = value

    -- Increment head
    self.head += 1

    -- Increment size
    self.size += 1
end

function Queue:PopBack()
    -- Guard
    if self.size == 0 then return end

    -- Increment tail
    self.tail += 1

    -- Decrement size
    self.size -= 1

    return self[self.tail]
end

function Queue:PopFront()
    -- Guard
    if self.size == 0 then return end

    -- Decrement head
    self.head -= 1

    -- Decrement size
    self.size -= 1

    return self[self.head]
end

function Queue:Front()
    return self[self.head - 1]
end

function Queue:Back()
    return self[self.tail + 1]
end

function Queue:Size()
    return self.size
end

return Queue
