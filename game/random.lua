random = {}

function random:range(a,b)
  return a + love.timer.getTime() * 100 % (b - a)
end

function random:clamp(a, min, max)
  if (a < min) then
    return min
  end
  if (a > max) then
    return max
  end
  
  return a

end
