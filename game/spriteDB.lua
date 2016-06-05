spriteDB = {}

function spriteDB:load()
  spriteDB.error = love.graphics.newImage("sprites/body/body-up.png")
  
  spriteDB.up = love.graphics.newImage("sprites/body/body-up.png")
  spriteDB.upright = love.graphics.newImage("sprites/body/body-up-right.png")
  spriteDB.upleft = love.graphics.newImage("sprites/body/body-right-down.png")

  spriteDB.right = love.graphics.newImage("sprites/body/body-right.png")
  spriteDB.rightdown = love.graphics.newImage("sprites/body/body-right-down.png")
  spriteDB.rightup = love.graphics.newImage("sprites/body/body-down-left.png")

  spriteDB.down = love.graphics.newImage("sprites/body/body-down.png")
  spriteDB.downleft = love.graphics.newImage("sprites/body/body-down-left.png")
  spriteDB.downright = love.graphics.newImage("sprites/body/body-left-up.png")
  
  spriteDB.left = love.graphics.newImage("sprites/body/body-left.png")
  spriteDB.leftup = love.graphics.newImage("sprites/body/body-left-up.png")
  spriteDB.leftdown = love.graphics.newImage("sprites/body/body-up-right.png")
  
  spriteDB.headupA = love.graphics.newImage("sprites/head/head-up-a.png")
  spriteDB.headupB = love.graphics.newImage("sprites/head/head-up-b.png")
  spriteDB.headrightA = love.graphics.newImage("sprites/head/head-right-a.png")
  spriteDB.headrightB = love.graphics.newImage("sprites/head/head-right-b.png")
  spriteDB.headdownA = love.graphics.newImage("sprites/head/head-down-a.png")
  spriteDB.headdownB = love.graphics.newImage("sprites/head/head-down-b.png")
  spriteDB.headleftA = love.graphics.newImage("sprites/head/head-left-a.png")
  spriteDB.headleftB = love.graphics.newImage("sprites/head/head-left-b.png")

  spriteDB.pickup = love.graphics.newImage("sprites/pickups/pickup-apple.png")
  spriteDB.special = love.graphics.newImage("sprites/pickups/pickup-mouse.png")
end

function spriteDB:getBodyImage(lastMovement, nextMovement)
  -- rightwards
  if lastMovement.x == 1 then
    if nextMovement.x == 1 then -- still goes right
      return spriteDB.right
    end
    
    if nextMovement.y == 1 then -- goes down
      return spriteDB.rightdown    
    end
        if nextMovement.y == -1 then -- goes up
      return spriteDB.rightup    
    end
  end
  
  -- leftwards
  if lastMovement.x == -1 then
    if nextMovement.x == -1 then -- still goes left
      return spriteDB.left
    end
    
    if nextMovement.y == 1 then -- goes down
      return spriteDB.leftdown    
    end
        if nextMovement.y == -1 then -- goes up
      return spriteDB.leftup    
    end
  end
  
  -- upwards
  if lastMovement.y == -1 then
    if nextMovement.y == -1 then -- still goes up
      return spriteDB.up    
    end
    
    if nextMovement.x == 1 then -- goes right
      return spriteDB.upright
    end
    if nextMovement.x == -1 then -- goes left
      return spriteDB.upleft    
    end
  end
  
    -- downwards
  if lastMovement.y == 1 then
    if nextMovement.y == 1 then -- still goes down
      return spriteDB.down    
    end
    if nextMovement.x == 1 then -- goes right
      return spriteDB.downright
    end
    if nextMovement.x == -1 then -- goes left
      return spriteDB.downleft    
    end

  end
  
  return spriteDB.error
end

function spriteDB:getHeadImage(lastMoveX, lastMoveY, tongueFlip)
  if (tongueFlip) then
    if (lastMoveX > 0) then
      return spriteDB.headrightA
    end
    if (lastMoveX < 0) then
      return spriteDB.headleftA
    end
    if (lastMoveY > 0) then
      return spriteDB.headdownA
    end
    if (lastMoveY < 0) then
      return spriteDB.headupA
    end
  else
    if (lastMoveX > 0) then
      return spriteDB.headrightB
    end
    if (lastMoveX < 0) then
      return spriteDB.headleftB
    end
    if (lastMoveY > 0) then
      return spriteDB.headdownB
    end
    if (lastMoveY < 0) then
      return spriteDB.headupB
    end  
  end
  
  -- fallback for the beginning
  if (tongueFlip) then
    return spriteDB.headleftB
  else
    return spriteDB.headleftA
  end
end

