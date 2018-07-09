-- Each level will inherit from this class which itself inherits from Gamestate.
-- This class is Gamestate but with function for loading up Tiled maps.

local bump = require 'libs.bump.bump'
local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'
local sti = require 'libs.sti.sti' -- New addition here
local Entities = require 'entities.Entities'
local camera = require 'libs.camera' -- New addition here

local LevelBase = Class{
  __includes = Gamestate,
  init = function(self, mapFile)
    self.map = sti(mapFile, { 'bump' })
    self.world = bump.newWorld(64)
    self.map:resize(love.graphics.getWidth()*1.4, love.graphics.getHeight()*1.4)--*2--*1.5
    self.map:bump_init(self.world)
    Entities:enter()
  end;
  Entities = Entities;
  camera = camera
}



function LevelBase:positionCamera(player, camera)
  local mapWidth = self.map.width * self.map.tilewidth -- get width in pixels
  local halfScreen =  love.graphics.getWidth()*(1.4/2)

  if player.x < (mapWidth - halfScreen) then -- use this value until we're approaching the end.
    boundX = math.max(0, player.x - halfScreen) -- lock camera at the left side of the screen.
  else
    boundX = math.min(player.x - halfScreen, mapWidth - love.graphics.getWidth()*1.4) --*2 --1.5 lock camera at the right side of the screen
  end

  local mapHeight = self.map.height * self.map.tileheight -- get width in pixels
  local halfScreen2 =  love.graphics.getHeight()*(1.4/2)

  if player.y < (mapHeight- halfScreen2) then -- use this value until we're approaching the end.
    boundY = math.max(0, player.y - halfScreen2) -- lock camera at the left side of the screen.
  else
    boundY = math.min(player.y - halfScreen2, mapHeight - love.graphics.getHeight()*1.4) --*2 --1.5 -- lock camera at the right side of the screen
  end
  camera:setPosition(boundX, boundY)
end

return LevelBase
