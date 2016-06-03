require ('snakeBody')

stats = {}

function stats:init()
  stats.totalTime = 0
end

function stats:update(dt)
  stats.totalTime = stats.totalTime + dt

end  

function stats:draw()
  
end
