require('gameState')

stats = {}

function stats:init()
  stats.totalTime = 0
  stats.totalTicks = 0
  
  stats.totalScore = 0

  stats.totalLength = 1
  stats.specialTimer = 0
end

function stats:tick(dt)
  stats.totalTicks = stats.totalTicks + 1
  
  stats.specialTimer = stats.specialTimer - 1
end

function stats:update(dt)
  stats.totalTime = stats.totalTime + dt

end  

function stats:draw()
  -- we have [0, 0] to [40, 240] as well as [360, 0] to [400, 240] left blank.
  
  if (runningOnDS) then
    love.graphics.setScreen('top')
  end
  love.graphics.print(stats.totalScore, stats:calculateStatOffset(stats.totalScore), 200)
  love.graphics.print(stats.totalLength, stats:calculateStatOffset(stats.totalLength), 220)
  
  if (stats.specialTimer > 0) then
    love.graphics.print(stats.specialTimer, 370, 200)
    love.graphics.draw(spriteDB.special, 372, 215)
  end
end

function stats:calculateStatOffset(score)
  if score < 10 then
    return 13
  elseif score < 100 then
    return 10
  elseif score < 1000 then
    return 7
  elseif score < 10000 then
    return 4
  else
    return 1
  end
end

function stats:pickupWasEaten()
  stats.totalLength = stats.totalLength + 1
  stats.totalScore = stats.totalScore + 5
end

function stats:setSpecialTimer(x)
  stats.specialTimer = x
end

function stats:specialWasEaten()
  stats.totalLength = stats.totalLength + 1
  stats.totalScore = stats.totalScore + stats.specialTimer
  stats.specialTimer = 0
end
