require('utility/gfx')
require('spriteDB')
require('gameState')

require('snakeHead')
require('snakeBody')
require('pickup')
require('stats')


tickTimer = 0.1
tickTimerResetValue = 0.1

function love.load()
  love.graphics.setBackgroundColor(200, 200, 200)
  
  spriteDB.load()
  
  resetGame()
end

function resetGame()
  tickTimer = 0.5
  tickTimerResetValue = 0.5
  stats:init()
  head:init()
  body:init()
  pickup:init()
end

function love.update(dt)
  if (gameState == "game") then
    checkForGameOver()
    handleTicking(dt)
    head:update(dt)
    pickup:update(dt)
    stats:update(dt)
  end
  
end

function handleTicking(dt)
  multiplicator = 1
  if (difficulty == "normal") then
    multiplicator = 1.5
  elseif (difficulty == "hard") then
    multiplicator = 2
  end
  
  tickTimer = tickTimer - (dt * multiplicator)
  
  if (tickTimer < 0) then
    tick()
    tickTimer = tickTimer + tickTimerResetValue
  end
end

function tick()
  local x = stats.totalLength
  tickTimerResetValue = 0.15 - (x * x * 0.06) / (4000 + x * x)
  print(tickTimerResetValue)
  head:tick()
  pickup:tick()
  stats:tick()
end

function love.draw()
  drawScreenBorder()
    
  head:draw()
  body:draw()
  pickup:draw()
  stats:draw()
  
  if (gameState == "main") then
    drawMainMenu()
  end
  
  if (gameState == "gameOver") then
    drawGameOver()
  end
  
  if (not(runningOnDS)) then
    gfx:drawBottomOffscreenBorders(255, 255, 255)
  end
end

function checkForGameOver()
  if head.dead then
    gameState = "gameOver"
  end
end

function drawMainMenu()
  if (runningOnDS) then
    love.graphics.setScreen('top')
  end
  love.graphics.print("2DSnake", 170, 40)
  love.graphics.print("Press DPad to start", 150, 55)

  
  if (runningOnDS) then
    love.graphics.setScreen('bottom')
  end
  love.graphics.print("Difficulty:", 180, 67)
  love.graphics.print("[Y]  <  "..difficulty.."  >  [A]", 150, 80)
end

function drawGameOver()
  if (runningOnDS) then
    love.graphics.setScreen('top')
  end
  love.graphics.print("GameOver!", 170, 40)
  love.graphics.print("A, B, X or Y to restart!", 140, 55)

  
  if (runningOnDS) then
    love.graphics.setScreen('bottom')
  end
  love.graphics.print("GameOver!", 170, 40)
  love.graphics.print("A, B, X or Y to restart!", 140, 55)
end

function drawScreenBorder()
  if (runningOnDS) then
    love.graphics.setScreen('top')
  end
  love.graphics.setColor(0, 0, 0)

  love.graphics.line(40, 0, 40, 240)
  love.graphics.line(360, 0, 360, 240)
end

function love.keypressed(key)
	if (key == "select") then
		love.event.quit()
	end
  
  if (gameState == "gameOver") then
    if (key == "a" or key == "b" or key == "x" or key == "y" or key == "start") then
      gameState = "main"
      resetGame()
    end
  elseif (gameState == "main") then
    if (key == "left" or key == "right" or key == "up" or key == "down") then
      gameState = "game"
    end
    
    if (key == "y") then
      if (difficulty == "easy") then
        difficulty = "hard"
      elseif (difficulty == "normal") then
        difficulty = "easy"
      elseif (difficulty == "hard") then
        difficulty = "normal"
      end
    end
    
    if (key == "a") then
      if (difficulty == "easy") then
        difficulty = "normal"
      elseif (difficulty == "normal") then
        difficulty = "hard"
      elseif (difficulty == "hard") then
        difficulty = "easy"
      end
    end    
  
  end
end