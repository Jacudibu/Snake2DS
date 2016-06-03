require('gfx')

require('snakeHead')
require('snakeBody')

function love.load()
  love.graphics.setBackgroundColor(200, 200, 200)
  
  gfx.load()
  
  
  head.init()
  body.init()
end

function love.update(dt)
  head.update(dt, dt)
end

function love.draw()
  
  --love.graphics.setScreen('top')
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Top-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)

    
  --love.graphics.setScreen('bottom')
  love.graphics.print("Bottom-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)
  
  head.draw()
  body.draw()
end

function love.keypressed(key)
	if (key == "select") then
		love.event.quit()
	end
  
  if (key == "start" or key == "x") then
    head:eat()
  end
end