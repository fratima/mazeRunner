local player  = require "player"
local balls   = require "balls"
local maze    = require "maze"

local GameOver = false 
local jointExits = false
  
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  GameOverPic = love.graphics.newImage("GameOver.png")
   
  love.graphics.setBackgroundColor( 1, 1, 1)
  world = love.physics.newWorld(0,0,true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  
  player.init()
  maze.init(player.getHeight(), player.getHeight())
  balls.create(110,110,15,"dynamic", 0.3, 0.9, {0.76, 0.18, 0.05}, "smallBall" )
  balls.create(400,400,20,"dynamic", 0.3, 0.9, {1/255, 157/255, 131/255}, "normalBall")
  
  love.physics.newMotorJoint( balls.getBall(1), player.getBody(),0.1, true )
  --love.physics.newDistanceJoint( ball.body, ball2.body , ball.body:getX(), ball.body:getY(), ball2.body:getX(), ball2.body:getY(), true )
  --love.physics.newMotorJoint( ball2.body, player.body ,0.1, true )
end -- load()


function love.update(dt)
    world:update(dt)
    player.update()
    balls.update()
    maze.update()
    
end --update()

function love.draw()
  love.graphics.scale(maze.getXScale(),maze.getYScale())
  
  if GameOver == true then
    love.graphics.draw(GameOverPic,300,200)
  end

  player.draw()
  maze.draw()
  balls.draw()
end  --draw()

function beginContact(a, b, coll)
  --[[
  if (a:getUserData() == "smallBall" and b:getUserData() == "normalBall") or
  (b:getUserData() == "smallBall" and a:getUserData() == "normalBall") then
      GameOver = true
  end
  --]]
  
  if (a:getUserData() == "smallBall" and b:getUserData() == "player") or
     (a:getUserData() == "player" and b:getUserData() == "smallBall") then
        aB = a:getBody()
        bB = b:getBody()
        if jointExits == false then
       --   love.physics.newMotorJoint( aB, bB, 0.3)
          jointExits = true
        end
  end
end




