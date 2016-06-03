gfx = {}

function gfx:load()
  gfx.error = love.graphics.newImage("gfx/body-up.png")
  
  gfx.up = love.graphics.newImage("gfx/body-up.png")
  gfx.upright = love.graphics.newImage("gfx/body-up-right.png")
  gfx.upleft = love.graphics.newImage("gfx/body-right-down.png")  -- fixme as soon as there are gfx

  gfx.right = love.graphics.newImage("gfx/body-right.png")
  gfx.rightdown = love.graphics.newImage("gfx/body-right-down.png")
  gfx.rightup = love.graphics.newImage("gfx/body-down-left.png")   -- fixme

  gfx.down = love.graphics.newImage("gfx/body-down.png")
  gfx.downleft = love.graphics.newImage("gfx/body-down-left.png")
  gfx.downright = love.graphics.newImage("gfx/body-left-up.png") -- fixme
  
  gfx.left = love.graphics.newImage("gfx/body-left.png")
  gfx.leftup = love.graphics.newImage("gfx/body-left-up.png")
  gfx.leftdown = love.graphics.newImage("gfx/body-up-right.png") -- fixme
  
  gfx.headup = love.graphics.newImage("gfx/head-up.png")
  gfx.headright = love.graphics.newImage("gfx/head-right.png")
  gfx.headdown = love.graphics.newImage("gfx/head-down.png")
  gfx.headleft = love.graphics.newImage("gfx/head-left.png")

end

function gfx:getBodyImage(lastMovement, nextMovement)
  
  -- rightwards
  if lastMovement.x == 1 then
    if nextMovement.x == 1 then -- still goes right
      return gfx.right
    end
    
    if nextMovement.y == 1 then -- goes down
      return gfx.rightdown    
    end
        if nextMovement.y == -1 then -- goes up
      return gfx.rightup    
    end
  end
  
  -- leftwards
  if lastMovement.x == -1 then
    if nextMovement.x == -1 then -- still goes left
      return gfx.left
    end
    
    if nextMovement.y == 1 then -- goes down
      return gfx.leftdown    
    end
        if nextMovement.y == -1 then -- goes up
      return gfx.leftup    
    end
  end
  
  -- upwards
  if lastMovement.y == -1 then
    if nextMovement.y == -1 then -- still goes up
      return gfx.up    
    end
    
    if nextMovement.x == 1 then -- goes right
      return gfx.upright
    end
    if nextMovement.x == -1 then -- goes left
      return gfx.upleft    
    end
  end
  
    -- downwards
  if lastMovement.y == 1 then
    if nextMovement.y == 1 then -- still goes down
      return gfx.down    
    end
    if nextMovement.x == 1 then -- goes right
      return gfx.downright
    end
    if nextMovement.x == -1 then -- goes left
      return gfx.downleft    
    end

  end
  
  return gfx.error
end

function gfx:getHeadImage(lastMoveX, lastMoveY)
  if (lastMoveX > 0) then
    return gfx.headright
  end
  if (lastMoveX < 0) then
    return gfx.headleft
  end
  if (lastMoveY > 0) then
    return gfx.headdown
  end
  if (lastMoveY < 0) then
    return gfx.headup
  end
  
  return gfx.downright
end

function gfx:drawToGridOnBothScreens(img, x, y)
  local screenX, screenY, onBottomScreen = gfx:calculateScreenPosition(x, y)
  
  if (onBottomScreen) then
    --love.graphics.setScreen('bottom')
    screenY = screenY - 240
  else
    --love.graphics.setScreen('top')
    screenX = screenX + 40
  end
  
  if (not (img == nil)) then
    love.graphics.draw(img, screenX, screenY)
  end
end

function gfx:calculateScreenPosition(x, y)
  return x * 16, y * 16, y >= 15
end

