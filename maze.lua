local mazeDefinition =  require "mazeDefinition"

local maze = {}
maze.xScale = 0
maze.yScale = 0

function maze.init(mazeWallSizeX,mazeWallSizeY )
 --define maze
  maze = mazeDefinition.mazeRunner
  maze.wall = {}
  maze.wallCounter = 0
  
  local xMazePixelDimension = mazeWallSizeX * #maze[1]
  local yMazePixelDimension = mazeWallSizeY * #maze
  
  maze.xScale = love.graphics.getWidth() / xMazePixelDimension * 0.9
  maze.yScale = love.graphics.getHeight() / yMazePixelDimension * 0.9
    
  for yMazePos, yrow in ipairs(maze) do
		for xMazePos, value in ipairs(yrow) do 
			if value == 0 then 
        maze.wallCounter = maze.wallCounter + 1
        maze.wall[maze.wallCounter] = {}
        maze.wall[maze.wallCounter].body = love.physics.newBody(world, mazeWallSizeX*xMazePos, mazeWallSizeY*yMazePos, "static") --"static" ) --"kinematic") 
        maze.wall[maze.wallCounter].shape = love.physics.newRectangleShape(mazeWallSizeX-5, mazeWallSizeY-5) 
        maze.wall[maze.wallCounter].fixture = love.physics.newFixture(maze.wall[maze.wallCounter].body, maze.wall[maze.wallCounter].shape, 0) 
        --maze.wall[wallCounter].fixture:setRestitution(0.9) 
        --love.physics.newMotorJoint( maze.wall[wallCounter].body, player.body ,1, false)
      end
		end
  end
end
  
function maze.update()
    --for i = 1, maze.wallCounter do
    --  keepInWindow(maze.wall[i])
    --end
end
  

function maze.keepInMaze(body)
    local x,y = body:getPosition()
    if x < 0 then body:setPosition(love.graphics.getWidth() / maze.xScale, y) end
    if x > love.graphics.getWidth() / maze.xScale then body:setPosition(0, y) end
    if y < 0 then body:setPosition(x,love.graphics.getHeight()/ maze.yScale) end
    if y > love.graphics.getHeight()/maze.yScale then body:setPosition(x, 0) end
end  
  
function maze.getXScale()
  return maze.xScale
end

function maze.getYScale()
  return maze.yScale
end
  
function maze.draw()
  love.graphics.setColor(0.5, 0.5, 0.5) 
  for i = 1, maze.wallCounter do
    love.graphics.polygon("fill", maze.wall[i].body:getWorldPoints(maze.wall[i].shape:getPoints()))
  end
end

return maze
