body = {}

function body:init()
  body.fragments = {}
  body.length = 0
  body.ticks = 0
  body.skipNext = false
end

function body:increaseSize()
  body.skipNext = true
  body.length = body.length + 1
end

function body:handleTick(lastMovement, currentPosition, nextMovement)
  if (not (body.skipNext)) then
    body:removeOldest()
  end
  
  body.skipNext = false
  
  if (body.length > 0) then
    body:spawnFragment(lastMovement, currentPosition, nextMovement)
  end
  body.ticks = body.ticks + 1
end

function body:removeOldest()
  table.remove(body.fragments, 1)
end

function body:spawnFragment(lastPositionDelta, currentPosition, nextPositionDelta)
  local fragment = {}
  fragment.x = currentPosition.x
  fragment.y = currentPosition.y
  
  local img = spriteDB:getBodyImage(lastPositionDelta, nextPositionDelta)
  fragment.img = img
  fragment.age = body.ticks
  
  table.insert(body.fragments, fragment)
end

function body:draw()
  if (body.length > 0) then
    for i, fragment in ipairs(body.fragments) do
      gfx:drawToGridOnBothScreens(fragment.img, fragment.x, fragment.y)
    end
  end
end
