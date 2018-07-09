local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local bullet = require "entities.bullet"
local LevelBase = require 'gamestates.LevelBase'
local player = Class{
	__includes = Entity
}

function player:init(world,x,y,nick,t,id)
	self.name="player"
	self.nick=nick
	self.id=id
	self.x,self.y=x,y
	self.hp=100
	self.speed=250
	
	self.sound=love.audio.newSource("assets/gun_reload_lock_or_click_sound.mp3", "static")
	self.sound2=love.audio.newSource("assets/punch.ogg", "static")
	--personaje
	self.img,self.quad=playersprite(t)
	--arma
	self.img2,self.quad2=armasprite()
	--bala
	self.img3,self.quad3=balasprite(0)
	--angulo
	self.o=0
	--añadir al mapa
	Entity.init(self,world,x,y,33,43)
	self.world:add(self,self:getRect())
	--movimientos
	self.moveup,self.movedow,self.moveright,self.moveleft=false,false,false,false
	--municiones
	self.getammo={} -- para coger de objetos en el mapa
	self.ammo={10,30,20}
	self.maxammo={50,360,240}
	--municion actual
	self.stock={0,0,0}
	self.maxstock={10,40,25}
	self.maxrtime={0.5,1,1.5}
	--daño
	self.daño={5,10,15}
	--estado
	self.disparo=false
	self.run=false
	self.estadoit={}
	self.estadoit[1]={3,5,6}
	self.estadoit[2]={2,4,4}--2,4,4
	self.it=1
	self.status=1
	--carga
	self.recarga=false
	self.time=0
end

function player:collisionFilter(other)
	--reconocer a los objetos vivos
  if other.name=="player" then
  	return false
  elseif  other.name=="bala" or other.name=="extra" or other.name=="vida" then
  	return "cross"
  else
    return 'slide'
  end
end

function player:update(dt)
	--analizar el mapa y moverse
	self.world:move(self, self.x, self.y,self.collisionFilter)
	--limitador de vida
	
	if self.hp>100 then
		self.hp=100
	end
	--movimiento
	if self.moveup and self.y>0 then
		self.y=self.y-self.speed*dt
	end

	if self.movedown and self.y<(85*64)-self.h then
		self.y=self.y+self.speed*dt
	end

	if self.moveleft and self.x>0 then
		self.x=self.x-self.speed*dt
	end

	if self.moveright and self.x<(150*64)-self.w then
		self.x=self.x+self.speed*dt
	end
	--angulo
	local mx,my= camera:mousePositionX(), camera:mousePositionY()
	self.o= math.atan2(my-(self.y+self.h/2),mx-(self.x+self.w/2))

	--velocidad al no usar arma
	if self.run then
		self.status=2
		if self.speed<600 then 
			self.speed=self.speed+500*dt
		else
			self.speed=600
		end
	else
		self.speed=250
	end
	--colisiones bump.lua
    self.x, self.y, collisions, len = self.world:move(self, self.x, self.y, self.collisionFilter)
    --colisiones con los demas objetos del juego
    for i=1,len do
    	if collisions[i].other.name=="extra" then
	    	if self.ammo[collisions[i].other.t]+collisions[i].other.addstock<self.maxammo[collisions[i].other.t] then
		    	self.ammo[collisions[i].other.t]=self.ammo[collisions[i].other.t]+collisions[i].other.addstock
		    	collisions[i].other.addstock=0
		    	self.world:remove(collisions[i].other)
		    	LevelBase.Entities:remove(collisions[i].other)
		    else
		    	local muni=self.maxammo[collisions[i].other.t]-self.ammo[collisions[i].other.t]
		    	self.ammo[collisions[i].other.t]=self.ammo[collisions[i].other.t]+muni
		    	collisions[i].other.addstock=collisions[i].other.addstock-muni
		    end
		end

		if collisions[i].other.name=="bala" and collisions[i].other.id~=self.id then
			self.sound2:play()
			self.hp=self.hp-collisions[i].other.daño
			self.world:remove(collisions[i].other)
      		LevelBase.Entities:remove(collisions[i].other)
      		if self.hp<1 then
	      		self.world:remove(self)
				LevelBase.Entities:remove(self)
			end
		end

		if collisions[i].other.name=="vida" then
			self.hp=self.hp+collisions[i].other.recover
			collisions[i].other.recover=0
			LevelBase.Entities:remove(collisions[i].other)
		end
    end

    --carga
    if self.recarga then

    	self.sound:play()

    	self.time=self.time+dt
    	if self.time>self.maxrtime[self.it] then
    		if self.ammo[self.it]+self.stock[self.it]<self.maxstock[self.it] then--self.ammo={25,120,60}
				self.stock[self.it]=self.ammo[self.it]+self.stock[self.it]
				self.ammo[self.it]=0
			else
				local carga=self.maxstock[self.it]-self.stock[self.it]
				self.stock[self.it]=self.stock[self.it]+carga
				self.ammo[self.it]=self.ammo[self.it]-carga
			end
    		self.time=0
    		self.recarga=false
    	end
    end
    --max carga
    if self.ammo[self.it]>self.maxammo[self.it] then
    	self.ammo[self.it]=self.maxammo[self.it]
    end
end

function player:draw()
	--personaje 
	love.graphics.print(self.hp,self.x,self.y-30)
	love.graphics.draw(self.img,self.quad[self.estadoit[self.status][self.it]], self.x+self.w/2, self.y+self.h/2,self.o,1,1,self.w/2,self.h/2)
end

function player:keypressed(key, isrepeat)
	--cambio de arma
	if key=="1" then
		self.it=1
		self.recarga=false
		self.time=0
	end

	if key=="2" then
		self.it=2
		self.recarga=false
		self.time=0
	end

	if key=="3" then
		self.it=3
		self.recarga=false
		self.time=0
	end

	if key=="space" then
		self.run=true
	end

	if key=="w"  then
		self.moveup=true
	end

	if key=="s" then
		self.movedown=true
	end

	if key=="a" then
		self.moveleft=true
	end
	if key=="d" then
		self.moveright=true
	end
end

function player:keyreleased(key)
	if key=="w" then
		self.moveup=false
	end

	if key=="s" then
		self.movedown=false
	end

	if key=="a" then
		self.moveleft=false
	end
	if key=="d" then
		self.moveright=false
	end

	if key=="space" then
		self.status=1
		self.run=false
	end
end
function player:mousepressed(x, y, button)
	--recargar balas 
	if button==2 and self.ammo[self.it]> 0 and self.stock[self.it] < self.maxstock[self.it] then
		self.recarga=true
	end
	if button==1 and self.status == 1 and self.stock[self.it]>0 then
		self:bala(button)
	end
end

function player:mousereleased(x, y, button)
	--balas al final
	if button==1 and self.it==3 and self.status == 1 and self.stock[self.it]>0 then
		self:bala(button)
	end
end

function player:bala(button)
    --insertar bala al escenario
    local bala = bullet(self.world,self.x+self.w/2,self.y+self.h/2,camera:mousePositionX()+17, camera:mousePositionY()+17,self.it,self.nick,self.daño[self.it],self.id)
    LevelBase.Entities:add(bala)
    --audio bala
    
    --remover municion del contador
    self.stock[self.it]=self.stock[self.it]-1
end

return player