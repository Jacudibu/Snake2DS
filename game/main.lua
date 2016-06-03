require('gfx')

require('snakeHead')
require('snakeBody')
require('pickup')
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
  pickup:init()
end

function love.update(dt)
  checkForGameOver()
  
  head:update(dt)
  pickup:update(dt)
  stats:update(dt)
end

function love.draw()
  drawTopScreenBorder()
    
  head:draw()
  body:draw()
  pickup:draw()
  stats:draw()
end

function checkForGameOver()
  if head.dead then
    init()
  end
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