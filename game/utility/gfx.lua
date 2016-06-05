require('gameState')

gfx = {}

function gfx:drawToGridOnBothScreens(img, x, y)
  local screenX, screenY, onBottomScreen = gfx:calculateScreenGridPosition(x, y, 16)
  
  if (onBottomScreen) then
    if (runningOnDS) then
      love.graphics.setScreen('bottom')
      screenY = screenY - 240
    else
      screenX = screenX + 40
    end
    
  else
    if (runningOnDS) then
      love.graphics.setScreen('top')
    end
    screenX = screenX + 40
  end
  
  if (not (img == nil)) then
    love.graphics.draw(img, screenX, screenY)
  end
end

function gfx:calculateScreenGridPosition(x, y, gridSize)
  return x * gridSize, y * gridSize, y >= gridSize - 1
end

function gfx:drawBottomOffscreenBorders(r, g, b)
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle("fill", 0, 241, 40, 480)
  love.graphics.rectangle("fill", 360, 241, 400, 480)  
end

