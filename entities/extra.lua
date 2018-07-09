local Class = require "libs.hump.class"
local Entity = require 'entities.Entity'
local extra = Class{
	__includes = Entity
}

function extra:init(world,x,y,t,stock)
	self.t=t --tipo
	self.name="extra"
	self.x,self.y=x,y
	self.img,self.quad=balasprite(t)
	self.addstock=stock
	Entity.init(self,world,x,y,24,24)
	self.world:add(self,self:getRect())
end


function extra:draw()
	--love.graphics.print("X " .. self.addstock,self.x,self.y-25,0,1.5,1.5)
	love.graphics.draw(self.img,self.quad,self.x,self.y,0,1.5, 1.5)
end

return extra