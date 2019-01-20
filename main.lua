wf = require "windfield"
require "character"
require "mazeDefinition"

  
 -- Character Start values
  playerInstance = 1 
  playerDirection = "right"  
  
  playerXpos = 30
  playerYpos = 30
  
  
function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  love.graphics.setBackgroundColor( 1, 1, 1)
  world = love.physics.newWorld(0,0,true)
  
  objects = {}  

  
    --define player
  initPlayer()
  playerXScale = 1
  playerYScale = 1
  playerWidth = playerPixelWidth * playerXScale
  playerHeight = playerPixelHeight * playerYScale
  
  --define maze
  maze = mazeRunner
  
 
  mazeWallSizeX = playerHeight * playerYScale
  mazeWallSizeY = playerHeight * playerYScale
  
  xMazePixelDimension = mazeWallSizeX * #maze[1]
  yMazePixelDimension = mazeWallSizeY * #maze
  
  xScale = love.graphics.getWidth() / xMazePixelDimension * 0.9
  yScale = love.graphics.getHeight() / yMazePixelDimension * 0.9
  
  wallCounter = 0
  objects.mazeWall = {}
  for yMazePos, yrow in ipairs(maze) do
		for xMazePos, value in ipairs(yrow) do 
			if value == 0 then 
        wallCounter = wallCounter + 1
        objects.mazeWall[wallCounter] = {}
        objects.mazeWall[wallCounter].body = love.physics.newBody(world, mazeWallSizeX*xMazePos, mazeWallSizeY*yMazePos, "kinematic") 
        objects.mazeWall[wallCounter].shape = love.physics.newRectangleShape(mazeWallSizeX-10, mazeWallSizeY-10) 
        objects.mazeWall[wallCounter].fixture = love.physics.newFixture(objects.mazeWall[wallCounter].body, objects.mazeWall[wallCounter].shape, 0) 
        --objects.mazeWall[wallCounter].fixture:setRestitution(0.9) 
      end
		end
	end
  
  playerWidthBoundary = playerWidth * 0.7
  playerHeightBoundary = playerHeight * 0.7
  
  objects.player = {}
  objects.player.body = love.physics.newBody(world, 200, 200, "dynamic") 
  objects.player.shape = love.physics.newRectangleShape(playerWidthBoundary, playerHeightBoundary) 
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, .7) 
  objects.player.fixture:setRestitution(0.17) --let the player bounce a little

  objects.ball = {}
   objects.ball.body = love.physics.newBody(world, 110, 110, "dynamic") 
  objects.ball.shape = love.physics.newCircleShape( 20) 
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, .3) 
  objects.ball.fixture:setRestitution(0.9) 
 

end -- load()


function love.update(dt)
    world:update(dt)
  
    -- Player Control
    maxAcc = 600
    if love.keyboard.isDown("right")  then objects.player.body:applyForce(maxAcc,0) end
    if love.keyboard.isDown("left")   then objects.player.body:applyForce(maxAcc*-1,0) end
    if love.keyboard.isDown("up")     then objects.player.body:applyForce(0,maxAcc*-1) end
    if love.keyboard.isDown("down")   then objects.player.body:applyForce(0,maxAcc) end
    if love.keyboard.isDown("escape") then os.exit() end  
  
    -- Player Speed
    local x,y = objects.player.body:getLinearVelocity() 
    maxSpeed = 300
    if x > maxSpeed then objects.player.body:setLinearVelocity(maxSpeed,y) end 
    if y > maxSpeed then objects.player.body:setLinearVelocity(x,maxSpeed) end 
    if x < maxSpeed*-1 then objects.player.body:setLinearVelocity(maxSpeed*-1,y) end 
    if y < maxSpeed*-1 then objects.player.body:setLinearVelocity(x,maxSpeed*-1) end 
    
    --Player Apperance
    playerInstance = playerInstance + (math.abs(x)+math.abs(y)) / 800  --change playerAppearance according to speed 
    if math.abs(x) > math.abs(y) then
      if x > 0 then playerDirection = "right" else playerDirection = "left" end 
    else
      if y > 0 then playerDirection = "down"  else playerDirection = "up" end
    end 
    
    
    keepInWindow(objects.player)
    keepInWindow(objects.ball)
    
    
end --update()

function love.draw()
  love.graphics.scale(xScale,yScale)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(image, charaMove[playerDirection][math.floor((playerInstance) % nOInstances) +  1], objects.player.body:getX()-playerWidth/2,      objects.player.body:getY()-playerHeight/2, 0, playerXScale, playerYScale)
    
  --love.graphics.setColor(0, 0, 0)
  --love.graphics.polygon("line", objects.player.body:getWorldPoints(objects.player.shape:getPoints()))
 
  love.graphics.setColor(0.5, 0.5, 0.5) 
  for i = 1, wallCounter do
    love.graphics.polygon("fill", objects.mazeWall[i].body:getWorldPoints(objects.mazeWall[i].shape:getPoints()))
  end
  
   love.graphics.setColor(0.76, 0.18, 0.05) --set the drawing color to red for the ball
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
   
end  --draw()

function keepInWindow(object)
    local x,y = object.body:getPosition()
    if x < 0 then object.body:setPosition(love.graphics.getWidth()/xScale,y) end
    if x > love.graphics.getWidth()/xScale then object.body:setPosition(0,y) end
    if y < 0 then object.body:setPosition(x,love.graphics.getHeight()/yScale) end
    if y > love.graphics.getHeight()/yScale then object.body:setPosition(x,0) end
  end
  



