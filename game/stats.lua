require ('snakeBody')

stats = {}

function stats:init()
  stats.totalTime = 0
end

function stats:update(dt)
  stats.totalTime = stats.totalTime + dt

end  

function stats:draw()
  -- we have [0, 0] to [40, 240] as well as [360, 0] to [400, 240] left blank.
  
  love.graphics.setScreen('top')
  love.graphics.print(body.ticks, 0, 0)
  love.graphics.print(body.length, 0, 20)
  
  
end
