local bump = require 'libs.bump.bump'
local Gamestate = require 'libs.hump.gamestate'
local mainMenu = require 'gamestates.mainmenu'
local gameLevel1 = require 'gamestates.gameLevel1'
local serialize = require 'libs.ser.ser'
require 'libs.boton'
local sprites = require 'entities.sprites'
local utf8 = require "utf8"
data={1,"",1,1,0}
local cursor = love.mouse.newCursor(mousex(2))

function love.load()
  if love.filesystem.getInfo("data.lua") then
    data=recibir()
  end
  love.mouse.setCursor(cursor)
  love.keyboard.setKeyRepeat(true)
  Gamestate.registerEvents()
  Gamestate.switch(mainMenu)
end

function love.mousepressed(x, y)
	botonxy = seleccionar_boton(x,y)
	if botonxy == "start" and Gamestate.current() == mainMenu then
		if data[2]=="" then
			data[2]="player"
		end
    if data[5]==1 then
      guardar(data)
    end
	    Gamestate.switch(gameLevel1)
	    lista_botones = {} 
  end

  	if botonxy == "-1" then
  		if data[1]<=1 then
  			data[1]=9
  		else
  			data[1]=data[1]-1
  		end
  	end

  	if botonxy == "+1" then
  		if data[1]>=9 then
  			data[1]=1
  		else
  			data[1]=data[1]+1
  		end
  	end

    if botonxy == "-2" then
      if data[3]<=1 then
        data[3]=8
      else
        data[3]=data[3]-1
      end
    end

    if botonxy == "+2" then
      if data[3]>=8 then
        data[3]=1
      else
        data[3]=data[3]+1
      end
    end

    if botonxy == "-3" then
      if data[4]<=1 then
        data[4]=5
      else
        data[4]=data[4]-1
      end
    end

    if botonxy == "+3" then
      if data[4]>=5 then
        data[4]=1
      else
        data[4]=data[4]+1
      end
    end 

    if botonxy == "guardar" then
      if data[5]==0 then
        data[5]=1
      else
        data[5]=0
      end
    end

    if botonxy == "eliminar" then
      if love.filesystem.getInfo("data.lua") then
        love.filesystem.remove( "data.lua" )
      end
      data={1,"",1,1,0}
    end 
end

function love.textinput(t)
    if string.len(data[2])<10 and Gamestate.current() == mainMenu then
        data[2] = data[2] .. t
    end
end
 
function love.keypressed(key, unicode)
    if key == "backspace" and Gamestate.current() == mainMenu then
        local byteoffset = utf8.offset(data[2], -1)
        if byteoffset then
            data[2] = string.sub(data[2], 1, byteoffset - 1)
        end
    end
end

function guardar(data)
    love.filesystem.write("data.lua",serialize(data))
end 

function recibir()
  local dataold
  if love.filesystem.getInfo("data.lua") then
    dataold =love.filesystem.load("data.lua")()
  end
  return dataold
end

--falta agregar sonido a la recarga, coger vida, coger municion
--alentizar la corrida, cuanto mas presione baje la velocidad desacerele