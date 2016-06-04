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
  
  gfx.headupA = love.graphics.newImage("gfx/head-up-a.png")
  gfx.headupB = love.graphics.newImage("gfx/head-up-b.png")
  gfx.headrightA = love.graphics.newImage("gfx/head-right-a.png")
  gfx.headrightB = love.graphics.newImage("gfx/head-right-b.png")
  gfx.headdownA = love.graphics.newImage("gfx/head-down-a.png")
  gfx.headdownB = love.graphics.newImage("gfx/head-down-b.png")
  gfx.headleftA = love.graphics.newImage("gfx/head-left-a.png")
  gfx.headleftB = love.graphics.newImage("gfx/head-left-b.png")

  gfx.pickup = love.graphics.newImage("gfx/pickup-apple.png")
  gfx.special = love.graphics.newImage("gfx/pickup-mouse.png")

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

function gfx:getHeadImage(lastMoveX, lastMoveY, tongueFlip)
  if (tongueFlip) then
    if (lastMoveX > 0) then
      return gfx.headrightA
    end
    if (lastMoveX < 0) then
      return gfx.headleftA
    end
    if (lastMoveY > 0) then
      return gfx.headdownA
    end
    if (lastMoveY < 0) then
      return gfx.headupA
    end
  else
    if (lastMoveX > 0) then
      return gfx.headrightB
    end
    if (lastMoveX < 0) then
      return gfx.headleftB
    end
    if (lastMoveY > 0) then
      return gfx.headdownB
    end
    if (lastMoveY < 0) then
      return gfx.headupB
    end  
  end
  
  -- fallback for the beginning
  if (tongueFlip) then
    return gfx.headleftB
  else
    return gfx.headleftA
  end
end

function gfx:drawToGridOnBothScreens(img, x, y)
  local screenX, screenY, onBottomScreen = gfx:calculateScreenPosition(x, y)
  
  if (onBottomScreen) then
    love.graphics.setScreen('bottom')
    screenY = screenY - 240
  else
    love.graphics.setScreen('top')
    screenX = screenX + 40
  end
  
  if (not (img == nil)) then
    love.graphics.draw(img, screenX, screenY)
  end
end

function gfx:calculateScreenPosition(x, y)
  return x * 16, y * 16, y >= 15
end

