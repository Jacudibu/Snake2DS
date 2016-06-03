require('gfx')
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
  head.currentTimer = 1.0
  head.dead = false
end

function head:update(dt)
  head.currentTimer = head.currentTimer - dt
  
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
  
  if (head.currentTimer < 0) then
    body:tick({x = head.lastMoveX, y = head.lastMoveY},
              {x = head.x, y = head.y},
              {x = head.moveNextX, y = head.moveNextY})
    
    head.x = head.x + head.moveNextX
    head.y = head.y + head.moveNextY
    head.x = head.x % 20
    head.y = head.y % 30
    head.currentTimer = head.moveTimer
    
    head.lastMoveX = head.moveNextX
    head.lastMoveY = head.moveNextY
    
    head:checkForCollsisions()
  end
end

function head:draw()
  local img = gfx:getHeadImage(head.lastMoveX, head.lastMoveY)
  gfx:drawToGridOnBothScreens(img, head.x, head.y)
end

function head:eat()
  body:increaseSize()
end

function head:checkForCollsisions()
  for i, fragment in ipairs(body.fragments) do
    if (head.x == fragment.x and head.y == fragment.y) then
      head.dead = true
    end
  end
end
