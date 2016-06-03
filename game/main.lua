require('snakeBody')
require('snakeHead')


function love.load()
  love.graphics.setBackgroundColor(255, 255, 255)
  
  x = love.graphics.getWidth() / 2;
  y = love.graphics.getHeight() / 2;
  speed = 100;
  
  body.load()
  head.load()
end

function love.update(dt)
  moveCoordinates(dt)
  head.update(dt, dt)
end

function moveCoordinates(dt)
  if (love.keyboard.isDown("right", "KEY_CPAD_RIGHT")) then
    x = x + dt * speed;
  end
  
  if (love.keyboard.isDown("left", "KEY_CPAD_LEFT")) then
    x = x - dt * speed;
  end
  
  if (love.keyboard.isDown("down", "KEY_CPAD_UP")) then
    y = y + dt * speed;
  end
  
  if (love.keyboard.isDown("up", "KEY_CPAD_DOWN")) then
    y = y - dt * speed;
  end
end

function love.draw()
  love.graphics.setScreen('top')
  love.graphics.print("Top-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)
  love.graphics.print("x", 100, 5)
  love.graphics.print("y", 5, 100) 

    
  love.graphics.setScreen('bottom')
  love.graphics.print("Bottom-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)
  love.graphics.print("100px", 100, 100)
  
  local from = {x = 0, y = 0}
  local to = {x = 1, y = 1}
  local imageToDraw = body.getBodyImage(from, to, from) -- this can't be right
  
  head.draw()
end

function love.keypressed(key)
	if key == "select" then
		love.event.quit()
	end
end