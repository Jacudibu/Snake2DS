require('gfx')
require('snakeHead')


function love.load()
  love.graphics.setBackgroundColor(255, 255, 255)
  gfx.load()
  
  
  
  head.init()
end

function love.update(dt)
  head.update(dt, dt)
end

function love.draw()
  love.graphics.setColor(0, 0, 0)
  --love.graphics.setScreen('top')
  love.graphics.print("Top-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)

    
  --love.graphics.setScreen('bottom')
  love.graphics.print("Bottom-Screen  "..love.graphics.getWidth().."x"..love.graphics.getHeight(), 5, 5)
  
  head.draw()
end

function love.keypressed(key)
	if key == "select" then
		love.event.quit()
	end
end