  
  function initPlayer()
    
    image = love.graphics.newImage("struwel.png") -- struwel2.png -- Bauarbeiter.png") 
    local charaFirstRow = 10
    local charaFirstColumn = 7
    local charaXSpace = 25
    local charaYSpace = 64
    playerPixelWidth = 40
    playerPixelHeight = 57
    nOInstances = 4
    
    charaX = charaFirstRow
    
    charaMove = {}
    directions = {"down","left","right","up"}
    for i=1,4 do
      charaMove[directions[i]] = {}
    end
    
    -- setup character quads
    for i = 1, nOInstances do
      charaMove["down"][i]  =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*0, playerPixelWidth, playerPixelHeight, image:getWidth(), image:getHeight())
      charaMove["left"][i]  =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*1, playerPixelWidth, playerPixelHeight, image:getWidth(), image:getHeight())
      charaMove["right"][i] =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*2, playerPixelWidth, playerPixelHeight, image:getWidth(), image:getHeight())
      charaMove["up"][i]    =  love.graphics.newQuad(charaX , charaFirstColumn+charaYSpace*3, playerPixelWidth, playerPixelHeight, image:getWidth(), image:getHeight())
      charaX = charaX + playerPixelWidth + charaXSpace 
    end
    
    -- Moving values
    --playerStepSize = 0.08
    --playerMoveLen = 1
  end    

  
function testCharacterCapture()
-- Check if all character pics are captured  
  for n = 1,4 do
    for i = 1, nOInstances do 
      love.graphics.draw(image, charaMove[directions[n]][i], playerXpos + (i*150), 10+(n*100),0, 1, 1)  
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
  