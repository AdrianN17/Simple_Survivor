local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local LevelBase = require 'gamestates.LevelBase'
local extra = require "entities.extra"
local health = require "entities.health"
local bullet = Class{
	__includes = Entity
}

function bullet:init(world,x,y,ex,ey,t,nick,daño,id)
	self.nick=nick
	self.name="bala"
	self.id=id
	self.x,self.y,self.ex,self.ey=x,y,ex,ey
	self.t=t
	self.daño=daño
	self.img,self.quad=balasprite(t)
	self.speed={1250,1750,1500}
	self.sound=love.audio.newSource("assets/boxdestroy.wav", "static")
	self.sound2=love.audio.newSource("assets/shotty.wav", "static")
	self.sound3=love.audio.newSource("assets/explosion.ogg", "static")
	self.o= math.atan2(ey-self.y,ex-self.x)
	Entity.init(self,world,x,y,8,8)
	self.world:add(self,self:getRect())
	self.sound2:play()
end

function bullet:collisionFilter(other)
  if other.name=="player" or other.name=="bala" or other.name=="extra" or other.name=="vida" then
  	return false
  else
  	return "touch"
  end
end

function bullet:update(dt)
	--movimiento de bala
	self.x=self.x+self.speed[self.t]*math.cos(self.o)*dt
	self.y=self.y+self.speed[self.t]*math.sin(self.o)*dt

	
	
	self.x, self.y, collisions, len = self.world:move(self, self.x, self.y, self.collisionFilter)

	for i=1,len do
		if collisions[i].other.name=="caja" then
			collisions[i].other.properties.hp=collisions[i].other.properties.hp-self.daño*10
			if collisions[i].other.properties.hp < 1 then
				local x , y = collisions[i].other.x , collisions[i].other.y
				for i, instance in ipairs(map.tileInstances[129]) do
					if x == instance.x and y == instance.y then
      					instance.batch:set(instance.id, map.tiles[265].quad, x,y)
      					break
      				end
  				end
  				local des=love.math.random(3)
  				if des==3 then
	  				local Extra = extra(self.world,x+16,y+16,love.math.random(3),love.math.random(30))
	    			LevelBase.Entities:add(Extra)
					
				elseif des==2 then
					local vida = health(self.world,x+13,y+6)
					LevelBase.Entities:add(vida)
					
				end
				self.sound:play()
				self.world:remove(collisions[i].other)
				
			end
			LevelBase.Entities:remove(self)
			self.world:remove(self)
		end

		if collisions[i].other.name=="cocina" then --296
			collisions[i].other.properties.hp=collisions[i].other.properties.hp-self.daño*5
			if collisions[i].other.properties.hp < 1 then
				local x , y = collisions[i].other.x , collisions[i].other.y
				for i, instance in ipairs(map.tileInstances[296]) do
					if x == instance.x and y == instance.y then
      					instance.batch:set(instance.id,map.tiles[320].quad, x,y)
      					break
      				end
      			end

      			for i, instance in ipairs(map.tileInstances[323]) do
					if x == instance.x and y == instance.y then
      					instance.batch:set(instance.id,map.tiles[320].quad, x,y)
      					break
      				end
      			end

      			for i, instance in ipairs(map.tileInstances[324]) do
					if x == instance.x and y == instance.y then
						local tile={560,561,562}
      					instance.batch:set(instance.id, map.tiles[320].quad, x,y)
      					break
      				end
      			end
	      		self.sound3:play()
				self.world:remove(collisions[i].other)
				
  			end
  			LevelBase.Entities:remove(self)
  			self.world:remove(self)
		end

		if collisions[i].other.name==nil and collisions[i].other.properties.collidable == true or collisions[i].other.name=="" then
			LevelBase.Entities:remove(self)
			self.world:remove(self)
		end
	end
end

function bullet:draw()
	--love.graphics.rectangle('line', self:getRect())
	love.graphics.draw(self.img,self.quad,self.x,self.y,0, 0.5, 0.5)
end

return bullet