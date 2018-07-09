local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'
local mainMenu = require 'gamestates.mainMenu'
local LevelBase = require 'gamestates.LevelBase'
local camera = require 'libs.camera'
local Player = require 'entities.player'
local bullet = require 'entities.bullet'
local sprites = require 'entities.sprites'
require 'libs.boton'
--jugador , balas y posicion random
local player=nil
local player2=nil
local pos={}
--mapeado
map=nil
local musica=love.audio.newSource("assets/main.mp3", "stream")
musica:setLooping(true)
--datos
local Font = love.graphics.newFont("assets/kenvector_future.ttf", 12)
local cursor=nil
local img,thp=nil,nil
local img2,cristal=uiimgui(),transparente()
local imgboton,quadboton=uiboton(), botonui()

local gameLevel1 = Class{
  __includes = LevelBase
}

function gameLevel1:init()
  
end

function gameLevel1:enter()
  musica:play()
  LevelBase.init(self, 'assets/levels/mapa.lua')
  img,thp=barravida(data[4])
  cursor = love.mouse.newCursor(cursorx(data[3]))
  love.mouse.setCursor(cursor)

  for k, object in pairs(self.map.objects) do
      if object.name == "player" then
      table.insert(pos,{object.x,object.y})
    end
  end

  

  map=self.map

  local ipos=love.math.random( 8 )
  player= Player(self.world,pos[ipos][1],pos[ipos][2],data[2],data[1],"ss1")
  LevelBase.Entities:add(player)
  player2= Player(self.world,pos[ipos][1]+100,pos[ipos][2]+100,data[2],5,"ss2")
  LevelBase.Entities:add(player2)

end

function gameLevel1:update(dt)
  self.map:update(dt) 
  LevelBase.Entities:update(dt) 
  LevelBase.positionCamera(self, player, camera)
  --borrar bala al hacer colision con todo lo que no sea el mismo jugador
  collectgarbage()
end

function gameLevel1:draw() 
  love.graphics.setFont(Font)
  camera:set()
  self.map:draw(-camera.x, -camera.y,(1/1.4),(1/1.4))--,0.5,0.5) --0.66
  LevelBase.Entities:draw()
  camera:unset()
  --Personaje
  love.graphics.print("Nick: " .. player.nick,25,650)
  love.graphics.draw( img2, cristal[1] ,25,675)
  love.graphics.draw(player.img,player.quad[1],60+player.w/2,700+player.h/2,player.o,1.4,1.5,player.w/2,player.h/2)
  --armas
  love.graphics.draw( img2, cristal[1],460,700,0,0.5,0.5)

  love.graphics.draw(player.img2,player.quad2[player.it],470,720,0,1.1,1.1)

  --recarga
  if player.recarga then
    love.graphics.print("Recargando ...",320,400)
  end
  --balas
  love.graphics.draw(img2, cristal[1],530,670)

  love.graphics.print("Carga ", 550,680)

  love.graphics.print("X " .. player.stock[1], 560,700)
  love.graphics.print("X " .. player.stock[2], 560,720)
  love.graphics.print("X " .. player.stock[3], 560,740)

  love.graphics.draw(img2, cristal[1],640,670)
  love.graphics.print("Municion ",655,680)
  love.graphics.draw(player.img3,player.quad3[1],650,700)
  love.graphics.print("X " .. player.ammo[1],675,700)
  love.graphics.draw(player.img3,player.quad3[2],650,720)
  love.graphics.print("X " .. player.ammo[2],675,720)
  love.graphics.draw(player.img3,player.quad3[3],650,740)
  love.graphics.print("X " .. player.ammo[3],675,740)
  
  --vida
  if player.hp>0 then  
    love.graphics.draw(img,thp[1],140,715,0,1,1)
  end

  for i=1,18,1 do
    if player.hp>i*5 then
      love.graphics.draw(img,thp[2],146+16*(i-1),715,0,1,1)
    end
  end

  if player.hp>95 then
    love.graphics.draw(img,thp[3],434,715,0,1,1)
  end

  if player.hp<1 then
    love.graphics.print("Estas Muerto",300,300,0,2,2)
  end


  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  love.graphics.print("SO: " .. love.system.getOS(),500,10)
  --botones
  crear_boton(750,15,190,49,"returnmenu",imgboton,quadboton[3])
  dibujar_botones()

  
end

function gameLevel1:keypressed(key,isrepeat)
  LevelBase.Entities:keypressed(key,isrepeat)
end

function gameLevel1:keyreleased(key)
  LevelBase.Entities:keyreleased(key)
end

function gameLevel1:mousepressed(x,y,button)
  LevelBase.Entities:mousepressed(x, y, button)
  if botonxy == "returnmenu" then
      musica:stop()
      bullets={}
      player=nil
      LevelBase.Entities:clear()
      LevelBase.Entities:remove(player)
      local cursor = love.mouse.newCursor(mousex(2))
      love.mouse.setCursor(cursor)
      Gamestate.switch(mainMenu)
      lista_botones = {}
    end
end

function gameLevel1:mousereleased(x,y,button)
  LevelBase.Entities:mousereleased(x,y,button)
end

return gameLevel1

--[[
--codigo memoria-recolector de basura
local stats = love.graphics.getStats()
 
    local str = string.format("Estimated amount of texture memory used: %.2f MB", stats.texturememory / 1024 / 1024)
    love.graphics.print(str, 10, 10)

  love.graphics.print('Memory actually used (in kB): ' .. collectgarbage('count')/1000, 10,10)
]]

