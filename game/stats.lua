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
  
  love.graphics.setScreen('top')
  love.graphics.print(stats.totalScore, 0, 0)
  love.graphics.print(stats.totalLength, 0, 20)
  
  if (stats.specialTimer > 0) then
    love.graphics.print(stats.specialTimer, 370, 0)
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
