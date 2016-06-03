require('gfx')
require('snakeBody')

head = {}


function head:init()
  head.x = 0
  head.y = 0
  head.moveNextX = 0
  head.moveNextY = 0
  head.lastMoveX = -2
  head.lastMoveY = -2
  head.moveTimer = 0.1 
  head.currentTimer = 1.0
end

function head:update(dt)
  head.currentTimer = head.currentTimer - dt
  
  if (love.keyboard.isDown('up')) then      
      head.moveNextX = 0
      head.moveNextY = -1
    else if (love.keyboard.isDown('down')) then
      head.moveNextX = 0
      head.moveNextY = 1
      else if (love.keyboard.isDown('left')) then
        head.moveNextX = -1
        head.moveNextY = 0
        else if (love.keyboard.isDown('right')) then
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
  end
end

function head:draw()
  local img = gfx:getHeadImage(head.lastMoveX, head.lastMoveY)
  gfx:drawToGridOnBothScreens(img, head.x, head.y)
end

function head:eat()
  body:increaseSize()
end
