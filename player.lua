local maze = require "maze"

local player = {}

player.width = 40
player.height = 57
player.instance = 1
player.direction = "right"
player.image = nil
player.nOInstances = 4
player.Move = {}

directions = {"down","left","right","up"}

function player.init()
  player.loadAppearance()
  player.create()
end


function player.create()  
  player.body = love.physics.newBody(world, 200, 200, "dynamic") 
  local boundaryScale = 0.7
  player.shape = love.physics.newRectangleShape(player.width * boundaryScale, player.height* boundaryScale) 
  player.fixture = love.physics.newFixture(player.body, player.shape, .7) 
  player.fixture:setRestitution(0.17) --let the player bounce a little
  player.fixture:setUserData("player")
end
  
  function player.getBody()
    return player.body
  end
  
  
function player.loadAppearance()
    player.image = love.graphics.newImage("struwel.png") -- struwel2.png -- Bauarbeiter.png") 
    local charaFirstRow = 10
    local charaFirstColumn = 7
    local charaXSpace = 25
    local charaYSpace = 64
    local charaX = charaFirstRow
    
    for i=1,4 do
      player.Move[directions[i]] = {}
    end
      
    -- setup character quads
    for i = 1, player.nOInstances do
      player.Move["down"][i]  =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*0, player.width
, player.height, player.image:getWidth(), player.image:getHeight())
      player.Move["left"][i]  =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*1, player.width
, player.height, player.image:getWidth(), player.image:getHeight())
      player.Move["right"][i] =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*2, player.width
, player.height, player.image:getWidth(), player.image:getHeight())
      player.Move["up"][i]    =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*3, player.width
, player.height, player.image:getWidth(), player.image:getHeight())
      charaX = charaX + player.width + charaXSpace 
    end
  end    

function player.getHeight()
  return player.height
end

  function player.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(player.image, player.Move[player.direction][math.floor((player.instance) % player.nOInstances) +  1], player.body:getX()-player.width/2,      player.body:getY()-player.height/2, 0, playerXScale, playerYScale)
  end
  
  function player.update()
    player.kybControl()
    player.limitSpeed()
    player.appearance()
    maze.keepInMaze(player.body)
  end
  
  
  function player.kybControl()
    -- Player Control
    local maxAcc = 600
    if love.keyboard.isDown("right")  then player.body:applyForce(maxAcc,0) end
    if love.keyboard.isDown("left")   then player.body:applyForce(maxAcc*-1,0) end
    if love.keyboard.isDown("up")     then player.body:applyForce(0,maxAcc*-1) end
    if love.keyboard.isDown("down")   then player.body:applyForce(0,maxAcc) end
    if love.keyboard.isDown("escape") then os.exit() end  
  end
  
  function player.limitSpeed()
    -- Player Speed
    local x,y = player.body:getLinearVelocity() 
    local maxSpeed = 300
    if x > maxSpeed then player.body:setLinearVelocity(maxSpeed,y) end 
    if y > maxSpeed then player.body:setLinearVelocity(x,maxSpeed) end 
    if x < maxSpeed*-1 then player.body:setLinearVelocity(maxSpeed*-1,y) end 
    if y < maxSpeed*-1 then player.body:setLinearVelocity(x,maxSpeed*-1) end 
  end
  
  function player.appearance()
    --Player Apperance
    local x,y = player.body:getLinearVelocity() 
    player.instance = player.instance + (math.abs(x)+math.abs(y)) / 800  --change playerAppearance according to speed 
    if math.abs(x) > math.abs(y) then
      if x > 0 then player.direction = "right" else player.direction = "left" end 
    else
      if y > 0 then player.direction = "down"  else player.direction = "up" end
    end 
  end
  
    
    
function player.testCharacterCapture()
-- Check if all character pics are captured  
  for n = 1,4 do
    for i = 1, player.nOInstances do 
      love.graphics.draw(image, player.Move[directions[n]][i], playerXpos + (i*150), 10+(n*100),0, 1, 1)  
    end
  end
end



  --[[  Old Hero
  image = love.graphics.newImage("Old hero.png") 
  charaFirstRow = 18
  charaFirstColumn = 17
  charaWidth = 15
  charaHeight = 15
  --]]
  
  --[[ chara
  image = love.graphics.newImage("chara.png") 
  charaFirstRow = 1
  charaFirstColumn = 1
  charaWidth = 16
  charaHeight = 24
  numberOfInstance = 4
  --]]
  
  return player