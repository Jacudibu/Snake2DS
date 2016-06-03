gfx = {}

function gfx:load()
  gfx.up = love.graphics.newImage("gfx/body-up.png")
  gfx.upright = love.graphics.newImage("gfx/body-right.png")
  gfx.upleft = love.graphics.newImage("gfx/body-right-down.png")  -- fixme as soon as there are gfx

  gfx.right = love.graphics.newImage("gfx/body-right.png")
  gfx.rightdown = love.graphics.newImage("gfx/body-right-down.png")
  gfx.rigtup = love.graphics.newImage("gfx/body-down-left.png")   -- fixme

  gfx.down = love.graphics.newImage("gfx/body-down.png")
  gfx.downleft = love.graphics.newImage("gfx/body-down-left.png")
  gfx.downright = love.graphics.newImage("gfx/body-up-right.png") -- fixme
  
  gfx.left = love.graphics.newImage("gfx/body-left.png")
  gfx.leftup = love.graphics.newImage("gfx/body-left-up.png")
  gfx.leftdown = love.graphics.newImage("gfx/body-down-left.png") -- fixme
  
  gfx.headup = love.graphics.newImage("gfx/body-up.png")
  gfx.headright = love.graphics.newImage("gfx/body-right.png")
  gfx.headdown = love.graphics.newImage("gfx/body-down.png")
  gfx.headleft = love.graphics.newImage("gfx/body-left.png")

end

function gfx:getBodyImage(previousLocation, nextLocation)
  if previousLocation.x < nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return gfx.leftup
    end
    if previousLocation.y == nextLocation.y then
      return gfx.left
    end
    if previousLocation.y > nextLocation.y then
      return gfx.leftdown
    end
  end
  
  if previousLocation.x == nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return gfx.down
    end
    if previousLocation.y == nextLocation.y then
      return error
    end
    if previousLocation.y > nextLocation.y then
      return gfx.up
    end
  end
  
  if previousLocation.x > nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return gfx.rightup
    end
    if previousLocation.y == nextLocation.y then
      return gfx.right
    end
    if previousLocation.y > nextLocation.y then
      return gfx.rightdown
    end
  end
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
