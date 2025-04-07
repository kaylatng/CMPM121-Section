Ball = {}
Ball.__index = Ball

numBall = 0

function Ball:new(x, y, xSpeed, ySpeed, radius)
  local ball = {
    x = x,
    y = y,
    xSpeed = xSpeed,
    ySpeed = ySpeed,
    radius = radius
  }
  setmetatable(ball, self)
  return ball
end

function Ball:draw()
  -- NEW CODE - not in class
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("line", self.x, self.y, self.radius)
end

function Ball:move()
  self.x = self.x + self.xSpeed
  self.y = self.y + self.ySpeed
end

function Ball:checkEdges() 
    if self.x + self.radius > love.graphics.getWidth() or self.x - self.radius < 0 then 
        self.xSpeed = self.xSpeed * -1
    end
    if self.y + self.radius > love.graphics.getHeight() or self.y - self.radius < 0 then 
        self.ySpeed = self.ySpeed * -1
    end
end

function Ball:shrink(dt)
  if self.radius > 0 then
    self.radius = self.radius - 0.1

    if self.radius <= 0 then
      print('decrement')
      self.radius = 0
      numBall = numBall - 1
    end
  end
end
  