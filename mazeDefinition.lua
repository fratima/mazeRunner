
fieldDefinition = {}

-- Definition of mazes
-- Maze -----
-- -1= boundary (not to be used)
--  0= wall
--  1= walk way
--  2= have been there already
--  3= door

fieldDefinition.freeWay       = 1
fieldDefinition.haveBeenThere = 2
fieldDefinition.lockedDoor    = 3 -- this means it is a wall with a door
fieldDefinition.unlockedDoor  = 4 -- this means it is a free space with a door drawn
fieldDefinition.free          = {freeWay,haveBeenThere}
fieldDefinition.blocked       = {lockedDoor}


fieldDefinition.mazeOrig={
-- y -> axis
{0,0,0,1,0,0,1,0,0}, --1  x -axis 
{1,1,1,1,3,1,1,1,1}, --2  x   ||
{0,0,1,0,1,0,1,0,0}, --3  x   \/
{0,0,1,0,0,0,1,0,0}, --4
{1,0,1,0,0,1,1,0,1}, --5
{3,1,1,0,0,0,1,0,1}, --6
{0,0,1,1,1,0,1,1,1}, --7
{0,0,0,0,1,0,1,0,0}, --8
{0,0,0,0,3,0,1,0,0}, --9
{0,0,0,0,1,0,1,0,0}, --10
{0,0,0,0,1,1,1,0,0}} --11

fieldDefinition.mazeSmall={
{0,1,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3},
{0,1,0,1,0,1,0,1,0,1,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
}

fieldDefinition.mazeJonas={
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,1,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0},
{0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,1,0,0},
{0,1,0,1,0,1,0,1,0,0,1,0,0,0,0,1,0,0,0,1,0,1,1,1,0,0},
{0,1,0,1,0,1,0,1,0,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,0},
{0,1,1,1,0,1,0,1,1,0,1,0,0,1,0,1,0,1,1,1,1,0,0,1,0,0},
{0,0,0,0,0,1,0,1,0,0,1,1,0,1,0,0,0,0,0,0,1,0,0,1,0,0},
{0,1,1,1,1,1,0,1,0,0,0,1,1,1,1,1,0,0,0,0,1,0,1,1,1,0},
{0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0},
{0,1,0,1,1,1,0,1,0,1,0,0,0,0,0,0,1,0,1,0,0,0,1,1,0,0},
{0,0,0,0,0,1,0,0,0,1,0,1,1,1,0,1,1,0,1,0,1,1,1,1,0,0},
{1,1,1,1,0,1,1,1,1,1,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1},
{0,0,0,1,0,0,0,0,0,1,0,1,1,1,1,1,1,1,0,0,1,0,0,1,1,1},
{1,1,0,1,1,1,1,1,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1},
{0,1,1,1,0,1,0,1,0,1,1,1,1,0,1,1,0,1,0,0,1,0,1,1,0,1},
{0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,1,1,1,1,1,0,0,1},
{1,1,0,0,1,1,0,1,1,1,1,1,0,0,0,1,1,1,0,0,1,0,0,0,1,1},
{0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,0,1,1},
{0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,0,0,1,0,1,1,1,1},
{0,1,1,1,1,1,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0},
{0,1,0,0,1,0,1,1,1,0,0,0,1,1,1,0,0,0,1,0,1,1,1,1,1,0},
{0,1,0,0,1,0,0,0,1,1,1,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0},
{0,3,0,0,1,0,0,0,0,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1}}


fieldDefinition.mazeRunner ={
  {0,0,0,0,0,0,0,1,0,0,0,0,0,0,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,1,0,0,1,0,0,1,0,0,1,0},
  {0,1,0,0,1,0,0,1,0,0,1,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,0,0,1,0,0,1,0,0,0,0,0,1,0},
  {0,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
  {0,0,0,0,0,0,0,1,0,0,0,0,0,0,0}
  }
  
fieldDefinition.moveTheBox = {
{0,0,0,0,0,0,0,0,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,1,1,1,1,1,1,1,0},
{0,0,0,0,0,0,0,0,0}
}

return fieldDefinition