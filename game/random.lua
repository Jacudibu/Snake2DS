random = {}

function random:range(a,b)
  return a + love.timer.getTime() * 100 % (b - a)
end
