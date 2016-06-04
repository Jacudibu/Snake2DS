require('gfx')

require('snakeHead')
require('snakeBody')
require('pickup')
require('stats')


tickTimer = 0.1
tickTimerResetValue = 0.1

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
  handleTicking(dt)
  
  head:update(dt)
  pickup:update(dt)
  stats:update(dt)
end

function handleTicking(dt)
  tickTimer = tickTimer - dt
  
  if (tickTimer < 0) then
    tick()
    tickTimer = tickTimer + tickTimerResetValue
  end
end

function tick()
  head:tick()
  pickup:tick()
  stats:tick()
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
end