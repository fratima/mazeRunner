
mazeDefinition = {}

-- Definition of mazes
-- Maze -----
-- -1= boundary (not to be used)
--  0= wall
--  1= walk way
--  2= have been there already
--  3= door

mazeDefinition.freeWay       = 1
mazeDefinition.haveBeenThere = 2
mazeDefinition.lockedDoor    = 3 -- this means it is a wall with a door
mazeDefinition.unlockedDoor  = 4 -- this means it is a free space with a door drawn
mazeDefinition.free          = {freeWay,haveBeenThere}
mazeDefinition.blocked       = {lockedDoor}


mazeDefinition.mazeOrig={
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

mazeDefinition.mazeSmall={
{0,1,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3},
{0,1,0,1,0,1,0,1,0,1,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
}

mazeDefinition.mazeJonas={
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


mazeDefinition.mazeRunner ={
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
  
mazeDefinition.moveTheBox = {
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

return mazeDefinition