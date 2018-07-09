local Class = require "libs.hump.class"
local Entity = require 'entities.Entity'
local health = Class{
	__includes = Entity
}

function health:init(world,x,y)
	self.name="vida"
	self.x,self.y=x,y
	self.img,self.quad=barravida(nil)
	self.addstock=stock
	Entity.init(self,world,x,y,19,26)
	self.world:add(self,self:getRect())
	self.recover=15
end

function health:draw()
	love.graphics.draw(self.img,self.quad,self.x,self.y,0,1, 1)
end

return health