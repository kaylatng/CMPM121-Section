-- Maddison Lobo & Kayla Nguyen
-- CMPM 121 - Section 01
-- 04/07/2025

io.stdout:setvbuf("no") -- Prints statements in real time

require "ball"

ballObject = {}
timer = 0

GAME_TITLE = "Section 01"

function love.load()

  love.window.setTitle(GAME_TITLE)
  screenWidth = 640
  screenHeight = 480
  love.window.setMode(screenWidth, screenHeight)
  love.graphics.setBackgroundColor(0.1, 0, 0.2, 1)
  
  startX = nil
  startY = nil
  local endX, endY = nil, nil
  local drawing = false
  
end

function love.update(dt)
  timer = timer + dt
end

function love.draw()
  
  -- TEXT
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(string.format("Balls: %.0f", numBall), 20, 20, 0, 2)
  love.graphics.print(string.format("timer: %.2f", timer), 20, 400)
  
  -- BALL
  love.graphics.setColor(1, 1, 1, 1)
  if drawing then
      love.graphics.line(startX, startY, love.mouse.getX(), love.mouse.getY())
  end

  for _, obj in ipairs(ballObject) do
    obj:draw()
    obj:move()
    obj:checkEdges()
    obj:shrink()
  end
    
  
end

function love.mousepressed(x, y, button, repeats)
    if button == 1 then -- Left mouse button
      startX, startY = x, y
      drawing = true
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then -- Left mouse button
      endX, endY = x, y
      drawing = false
      
      local testObj = Ball:new(startX, startY, (startX - endX) * 0.05, (startY - endY) * 0.05, 50)
      table.insert(ballObject, testObj)  
      numBall = numBall + 1
      
    end
end