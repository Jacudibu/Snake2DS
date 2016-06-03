body = {}

function body:load()
  body.up = love.graphics.newImage("gfx/body-up.png")
  body.upright = love.graphics.newImage("gfx/body-right.png")
  body.upleft = love.graphics.newImage("gfx/body-right-down.png")  -- fixme as soon as there are gfx

  body.right = love.graphics.newImage("gfx/body-right.png")
  body.rightdown = love.graphics.newImage("gfx/body-right-down.png")
  body.rigtup = love.graphics.newImage("gfx/body-down-left.png")   -- fixme

  body.down = love.graphics.newImage("gfx/body-down.png")
  body.downleft = love.graphics.newImage("gfx/body-down-left.png")
  body.downright = love.graphics.newImage("gfx/body-up-right.png") -- fixme
  
  body.left = love.graphics.newImage("gfx/body-left.png")
  body.leftup = love.graphics.newImage("gfx/body-left-up.png")
  body.leftdown = love.graphics.newImage("gfx/body-down-left.png") -- fixme
end

function body:getBodyImage(previousLocation, nextLocation)
  if previousLocation.x < nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return body.leftup
    end
    if previousLocation.y == nextLocation.y then
      return body.left
    end
    if previousLocation.y > nextLocation.y then
      return body.leftdown
    end
  end
  
  if previousLocation.x == nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return body.down
    end
    if previousLocation.y == nextLocation.y then
      return error
    end
    if previousLocation.y > nextLocation.y then
      return body.up
    end
  end
  
  if previousLocation.x > nextLocation.x then
    if previousLocation.y < nextLocation.y then
      return body.rightup
    end
    if previousLocation.y == nextLocation.y then
      return body.right
    end
    if previousLocation.y > nextLocation.y then
      return body.rightdown
    end
  end
end
