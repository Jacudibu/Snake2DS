require('gfx')

require('snakeHead')
require('snakeBody')
require('stats')




function love.load()
  love.graphics.setBackgroundColor(200, 200, 200)
  
  gfx.load()
  
  init()
end

function init()
  stats:init()
  head:init()
  body:init()
end

function love.update(dt)
  head:update(dt)
  stats:update(dt)
end

function love.draw()
  drawTopScreenBorder()
    
  head:draw()
  body:draw()
  stats:draw()
end

function drawTopScreenBorder()
  love.graphics.setScreen('top')
  love.graphics.setColor(0, 0, 0)

  love.graphics.line(40, 0, 40, 240)
  love.graphics.line(360, 0, 360, 240)
end

function love.keypressed(key)
	if (key == "select") then
		love.event.quit()
	end
  
  if (key == "start" or key == "x") then
    head:eat()
  end
end