require('utility/random')
require('utility/gfx')
require('spriteDB')
require('snakeHead')
require('snakeBody')
require('stats')

pickup = {}
pickup.special = {}

function pickup:init()
  pickup.totalSpawned = 0
  pickup.x = 0
  pickup.y = 0
  
  pickup.special.timer = 0
  pickup.special.x = 0
  pickup.special.y = 0

  pickup:spawn()
end

function pickup:draw()
  gfx:drawToGridOnBothScreens(spriteDB.pickup, pickup.x, pickup.y)
  
  if (pickup.special.timer > 0) then
    gfx:drawToGridOnBothScreens(spriteDB.special, pickup.special.x, pickup.special.y)
  end
  
end

function pickup:update(dt)
  checkForGettingEaten()
end

function pickup:tick()
  pickup.special.timer = pickup.special.timer - 1
end

function checkForGettingEaten()
  if (head.x == pickup.x and head.y == pickup.y) then
    stats:pickupWasEaten()
    head:eat()
    pickup:spawn()
  end
  
  if (pickup.special.timer > 0 and head.x == pickup.special.x and head.y == pickup.special.y) then
    head:eat(true)
    stats:specialWasEaten()
    pickup:destroySpecial()
  end
end

function pickup:spawn()
  pickup.totalSpawned = pickup.totalSpawned + 1
  pickup.x, pickup.y = pickup:getValidSpawnPositions()

  if (pickup.totalSpawned % 10 == 0) then
    pickup.special.timer = 100
    stats:setSpecialTimer(100)
    pickup.special.x, pickup.special.y = pickup:getValidSpawnPositions()
  end
end

function pickup:destroySpecial()
  pickup.special.timer = 0
end

function pickup:getValidSpawnPositions()
  x = math.floor(random:range(0, 15))
  y = math.floor(random:range(0, 30))
  
  local timesTried = 0
  while (not (pickup:isFieldEmpty(x, y))) do
    x = (x + 1) % 15
    
    if (timesTried % 30 == 0) then
      y = (y + 1) %  30
    end
    
    timesTried = timesTried + 1
  end
  
  return x, y
end


function pickup:isFieldEmpty(x, y)
  for i, fragment in ipairs(body.fragments) do
    if (fragment.x == x and fragment.y == y) then
      return false
    end
  end
  
  if (head.x == x and head.y == y) then
    return false
  end
  
  if (pickup.x == x and pickup.y == y or pickup.special.x == x and pickup.special.y == y) then
    return false
  end
  
  return true
end
