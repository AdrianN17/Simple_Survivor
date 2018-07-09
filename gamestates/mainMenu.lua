local sprites = require 'entities.sprites'
local mainMenu = {}
local title=titulo()
local img,quad=uiimgui(),transparente()
local imgp,quadp=playersprite(10)
local imgboton, botonui1, botonui2 , cursore, bvida= uiboton(), botonui(), flechaui(), cursort(), barravida(0)

function mainMenu:draw()
	local Font = love.graphics.newFont("assets/kenvector_future.ttf", 15)
	love.graphics.setFont(Font)
	love.graphics.draw(title,200,40)
	--jugador
	love.graphics.draw(img,quad[1],100,180)
	love.graphics.draw(imgp,quadp[data[1]],125,195,0,1.4,1.5)
	--boton naranja para iniciar
	crear_boton(450,280,190,49,"start",imgboton,botonui1[1])
	
	--boton azul +-
	crear_boton(40,215,190,49,"-1",imgboton,botonui2[1])
	crear_boton(220,215,190,49,"+1",imgboton,botonui2[2])
	--boton azul +-
	crear_boton(40,365,190,49,"-2",imgboton,botonui2[1])
	crear_boton(220,365,190,49,"+2",imgboton,botonui2[2])
	--apuntador
	love.graphics.draw(img,quad[1],100,330)
	love.graphics.draw(img,cursore[data[3]],125,355,0,1.5,1.5)
	--boton azul +-
	crear_boton(40,510,190,49,"-3",imgboton,botonui2[1])
	crear_boton(220,510,190,49,"+3",imgboton,botonui2[2])
	--barra vida
	love.graphics.draw(img,quad[1],100,475)
	love.graphics.draw(img,bvida[data[4]],125,495,0,2.5,2.5)
	--texto
	love.graphics.print("Nombre de usuario:",440,355)
	love.graphics.draw(imgboton,botonui1[2],445,380)
	love.graphics.print(data[2], 452, 395)
	--recordar
	love.graphics.print("Guardar datos",485,500)
	crear_boton(500,525,38,36,"guardar",imgboton,botonui1[4+data[5]])
	--eliminar
	love.graphics.print("Eliminar datos",485,590)
	crear_boton(500,625,38,36,"eliminar",imgboton,botonui1[6])
	--imprimir cursor
	dibujar_botones()
	love.graphics.print("Iniciar partida",480,295)
end

function mainMenu:update()
	collectgarbage()
end

return mainMenu
