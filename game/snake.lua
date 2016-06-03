snake = {}


function snake:load()
  snake.img = love.graphics.newImage("gfx/body-up.png");
  snake.x = 0
  snake.y = 0
  snake.lastX = 0
  snake.lastY = 0
  snake.moveTimer = 0.1 
  snake.currentTimer = 1.0
end

function snake:update(dt)
  snake.currentTimer = snake.currentTimer - dt
  
  if (snake.currentTimer < 0) then
    if (love.keyboard.isDown('up')) then
      snake.y = snake.y - 1
      snake.lastX = 0
      snake.lastY = -1
    else if (love.keyboard.isDown('down')) then
      snake.y = snake.y + 1
      snake.lastX = 0
      snake.lastY = 1
      else if (love.keyboard.isDown('left')) then
        snake.x = snake.x - 1
        snake.lastX = -1
        snake.lastY = 0
        else if (love.keyboard.isDown('right')) then
          snake.x = snake.x + 1
          snake.lastX = 1
          snake.lastY = 0
          else -- keep direction
            snake.x = snake.x + snake.lastX
            snake.y = snake.y + snake.lastY
          end
        end
      end
    end
    snake.currentTimer = snake.moveTimer
  end
end


function snake:draw()
  local x, y, onBottomScreen = calculateScreenPosition(snake.x, snake.y)
  
  if (onBottomScreen) then
    love.graphics.setScreen('bottom')
    y = y - 240
  else
    love.graphics.setScreen('top')
  end
  
  love.graphics.draw(snake.img, y, x) -- 3ds screens are weird...?
end

function calculateScreenPosition(x, y)
  return x * 16, y * 16, x >= 15
end
