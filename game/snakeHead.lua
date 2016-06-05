require('utility/gfx')
require('spriteDB')

require('snakeBody')

head = {}


function head:init()
  head.x = 10
  head.y = 7
  head.moveNextX = 0
  head.moveNextY = 0
  head.lastMoveX = -2
  head.lastMoveY = -2
  head.moveTimer = 0.1 
  head.tongueFlip = false
  
  head.dead = false
end

function head:update(dt)
  if (love.keyboard.isDown('up') and not (head.lastMoveY == 1)) then      
      head.moveNextX = 0
      head.moveNextY = -1
    else if (love.keyboard.isDown('down') and not (head.lastMoveY == -1)) then
      head.moveNextX = 0
      head.moveNextY = 1
      else if (love.keyboard.isDown('left') and not (head.lastMoveX == 1)) then
        head.moveNextX = -1
        head.moveNextY = 0
        else if (love.keyboard.isDown('right') and not (head.lastMoveX == -1)) then
          head.moveNextX = 1
          head.moveNextY = 0
        end
      end
    end
  end
end

function head:draw()
  local img = spriteDB:getHeadImage(head.lastMoveX, head.lastMoveY, head.tongueFlip)
  gfx:drawToGridOnBothScreens(img, head.x, head.y)
end

function head:tick()
  body:handleTick({x = head.lastMoveX, y = head.lastMoveY},
                  {x = head.x, y = head.y},
                  {x = head.moveNextX, y = head.moveNextY})
    
  head.x = head.x + head.moveNextX
  head.y = head.y + head.moveNextY
  head.x = head.x % 20
  head.y = head.y % 30
  head.tongueFlip = not (head.tongueFlip)
  head.currentTimer = head.moveTimer
    
  head.lastMoveX = head.moveNextX
  head.lastMoveY = head.moveNextY
   
  head:checkForCollisions()
end

function head:eat()
  body:increaseSize()
end

function head:checkForCollisions()
  for i, fragment in ipairs(body.fragments) do
    if (head.x == fragment.x and head.y == fragment.y) then
      head.dead = true
    end
  end
end
