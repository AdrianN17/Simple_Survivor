	local imgplayer = love.graphics.newImage("assets/spritesheet_characters.png")
	local quadplayer = {}
	quadplayer[1]={}
	quadplayer[2]={}
	quadplayer[3]={}
	quadplayer[4]={}
	quadplayer[5]={}
	quadplayer[6]={}
	quadplayer[7]={}
	quadplayer[8]={}
	quadplayer[9]={}
	quadplayer[10]={}
	local imgarma = love.graphics.newImage("assets/armas.png")
	local arma = {}
	local imgbala=love.graphics.newImage("assets/towerDefense_tilesheet.png")
	local bala={}

	local imgui= love.graphics.newImage("assets/ui2.png")
	local barra={}
	barra[1]={}
	barra[2]={}
	barra[3]={}
	barra[4]={}
	barra[5]={}
	barra[6]={}
	local cursor={}
	local apuntador={}
	local ventana={}

	local imgboton=love.graphics.newImage("assets/buttons.png")
	local botones={}
	local flecha={}

	local cursortotal={}

function playersprite(x)
	-- viejo
	quadplayer[1][1]=love.graphics.newQuad( 460, 132, 33, 43, imgplayer:getDimensions())
	quadplayer[1][2]=love.graphics.newQuad( 422, 88, 35, 43, imgplayer:getDimensions())
	quadplayer[1][3]=love.graphics.newQuad( 216, 0, 49, 43, imgplayer:getDimensions())
	quadplayer[1][4]=love.graphics.newQuad( 307, 44, 39, 43, imgplayer:getDimensions())
	quadplayer[1][5]=love.graphics.newQuad( 213, 132, 49, 43, imgplayer:getDimensions())
	quadplayer[1][6]=love.graphics.newQuad( 55, 132, 54, 43, imgplayer:getDimensions())
	--con sombrero listo
	quadplayer[2][1]=love.graphics.newQuad( 390, 176, 35 , 43, imgplayer:getDimensions())
	quadplayer[2][2]=love.graphics.newQuad( 352, 176, 37, 43, imgplayer:getDimensions())
	quadplayer[2][3]=love.graphics.newQuad( 112, 88, 51, 43, imgplayer:getDimensions())
	quadplayer[2][4]=love.graphics.newQuad( 264, 88, 41, 43, imgplayer:getDimensions())
	quadplayer[2][5]=love.graphics.newQuad( 110, 176, 51, 43, imgplayer:getDimensions())
	quadplayer[2][6]=love.graphics.newQuad( 0, 88, 56, 43, imgplayer:getDimensions())
	--cabello verde listo
	quadplayer[3][1]=love.graphics.newQuad( 353, 132, 36, 43, imgplayer:getDimensions())
	quadplayer[3][2]=love.graphics.newQuad( 349, 0, 38, 43, imgplayer:getDimensions())
	quadplayer[3][3]=love.graphics.newQuad( 113, 0, 52, 43, imgplayer:getDimensions())
	quadplayer[3][4]=love.graphics.newQuad( 264, 44, 42, 43, imgplayer:getDimensions())
	quadplayer[3][5]=love.graphics.newQuad( 110, 132, 52, 43, imgplayer:getDimensions())
	quadplayer[3][6]=love.graphics.newQuad( 0, 0, 57, 43, imgplayer:getDimensions())
	--pelon listo
	quadplayer[4][1]=love.graphics.newQuad( 426, 176, 33, 43, imgplayer:getDimensions())
	quadplayer[4][2]=love.graphics.newQuad( 386, 88, 35, 43, imgplayer:getDimensions())
	quadplayer[4][3]=love.graphics.newQuad( 164, 88, 49, 43, imgplayer:getDimensions())
	quadplayer[4][4]=love.graphics.newQuad( 313, 132, 39, 43, imgplayer:getDimensions())
	quadplayer[4][5]=love.graphics.newQuad( 214, 44, 49, 43, imgplayer:getDimensions())
	quadplayer[4][6]=love.graphics.newQuad( 0, 132, 54, 43, imgplayer:getDimensions())
	--robot listo
	quadplayer[5][1]=love.graphics.newQuad( 458, 88, 33, 43, imgplayer:getDimensions())
	quadplayer[5][2]=love.graphics.newQuad( 423, 44, 35, 43, imgplayer:getDimensions())
	quadplayer[5][3]=love.graphics.newQuad( 164, 44, 49, 43, imgplayer:getDimensions())
	quadplayer[5][4]=love.graphics.newQuad( 306, 88, 39, 43, imgplayer:getDimensions())
	quadplayer[5][5]=love.graphics.newQuad( 166, 0, 49, 43, imgplayer:getDimensions())
	quadplayer[5][6]=love.graphics.newQuad( 55, 176, 54, 43, imgplayer:getDimensions())
	--zombie listo
	quadplayer[6][1]=love.graphics.newQuad( 460, 0, 33, 43, imgplayer:getDimensions())
	quadplayer[6][2]=love.graphics.newQuad( 424, 0, 35, 43, imgplayer:getDimensions())
	quadplayer[6][3]=love.graphics.newQuad( 163, 132, 49, 43, imgplayer:getDimensions())
	quadplayer[6][4]=love.graphics.newQuad( 346, 88, 39, 43, imgplayer:getDimensions())
	quadplayer[6][5]=love.graphics.newQuad( 162, 176, 49, 43, imgplayer:getDimensions())
	quadplayer[6][6]=love.graphics.newQuad( 57, 88, 54, 43, imgplayer:getDimensions())
	--pelo claro listo
	quadplayer[7][1]=love.graphics.newQuad( 459, 44, 33, 43, imgplayer:getDimensions())
	quadplayer[7][2]=love.graphics.newQuad( 388, 0, 35, 43, imgplayer:getDimensions())
	quadplayer[7][3]=love.graphics.newQuad( 262, 176, 49, 43, imgplayer:getDimensions())
	quadplayer[7][4]=love.graphics.newQuad( 312, 176, 39, 43, imgplayer:getDimensions())
	quadplayer[7][5]=love.graphics.newQuad( 214, 88, 49, 43, imgplayer:getDimensions())
	quadplayer[7][6]=love.graphics.newQuad( 0, 176, 54, 43, imgplayer:getDimensions())
	--negro listo
	quadplayer[8][1]=love.graphics.newQuad( 426, 132, 33, 43, imgplayer:getDimensions())
	quadplayer[8][2]=love.graphics.newQuad( 390, 132, 35, 43, imgplayer:getDimensions())
	quadplayer[8][3]=love.graphics.newQuad( 263, 132, 49, 43, imgplayer:getDimensions())
	quadplayer[8][4]=love.graphics.newQuad( 309, 0, 39, 43, imgplayer:getDimensions())
	quadplayer[8][5]=love.graphics.newQuad( 212, 176, 49, 43, imgplayer:getDimensions())
	quadplayer[8][6]=love.graphics.newQuad( 58, 0, 54, 43, imgplayer:getDimensions())
	--chica listo
	quadplayer[9][1]=love.graphics.newQuad( 386, 44, 36, 43, imgplayer:getDimensions())
	quadplayer[9][2]=love.graphics.newQuad( 347, 44, 38, 43, imgplayer:getDimensions())
	quadplayer[9][3]=love.graphics.newQuad( 58, 44, 52, 43, imgplayer:getDimensions())
	quadplayer[9][4]=love.graphics.newQuad( 266, 0, 42, 43, imgplayer:getDimensions())
	quadplayer[9][5]=love.graphics.newQuad( 111, 44, 52, 43, imgplayer:getDimensions())
	quadplayer[9][6]=love.graphics.newQuad( 0, 44, 57, 43, imgplayer:getDimensions())

	--quadespecial
	quadplayer[10][1]=quadplayer[1][1]
	quadplayer[10][2]=quadplayer[2][1]
	quadplayer[10][3]=quadplayer[3][1]
	quadplayer[10][4]=quadplayer[4][1]
	quadplayer[10][5]=quadplayer[5][1]
	quadplayer[10][6]=quadplayer[6][1]
	quadplayer[10][7]=quadplayer[7][1]
	quadplayer[10][8]=quadplayer[8][1]
	quadplayer[10][9]=quadplayer[9][1]
	
	return imgplayer, quadplayer[x]
end

function armasprite()
	
	arma[1]=love.graphics.newQuad( 0, 0, 19, 10, imgarma:getDimensions())
	arma[2]=love.graphics.newQuad( 0, 41, 33, 10, imgarma:getDimensions())
	arma[3]=love.graphics.newQuad( 0, 19, 25, 10, imgarma:getDimensions())

	return imgarma, arma
end

function balasprite(x)
	
	bala[1]=love.graphics.newQuad(192, 0, 16, 16, imgbala:getDimensions())
	bala[2]=love.graphics.newQuad(0, 0, 16, 16, imgbala:getDimensions())
	bala[3]=love.graphics.newQuad(64, 0, 16, 16, imgbala:getDimensions())
	
	if x==0 then
		return imgbala, bala
	else 
		return imgbala,bala[x]
	end
end


function cursorx(x)
	apuntador[1]="crossair_black.png"
	apuntador[2]="crossair_red.png"
	apuntador[3]="crossair_blue.png"
	apuntador[4]="crossair_white.png"
	apuntador[5]="crossair_blackOutline.png"
	apuntador[6]="crossair_redOutline.png"
	apuntador[7]="crossair_blueOutline.png"
	apuntador[8]="crossair_whiteOutline.png"
	return "assets/cursor/" .. apuntador[x]
end

function mousex(x)
	cursor[1]="cursor_hand.png"
	cursor[2]="cursor_pointer3D.png"

	return "assets/cursor/" .. cursor[x]
end

function uiimgui()
	return imgui
end

function transparente()
	ventana[1]=love.graphics.newQuad(0,0,100,100,imgui:getDimensions())
	ventana[2]=love.graphics.newQuad(330,110,100,100,imgui:getDimensions())
	ventana[3]=love.graphics.newQuad(220,110,100,100,imgui:getDimensions())
	return ventana
end


function barravida(x)
	barra[1][1]=love.graphics.newQuad(350 ,52 ,6 ,26 ,imgui:getDimensions())
	barra[1][2]=love.graphics.newQuad(256 ,68 ,16 ,26 ,imgui:getDimensions())
	barra[1][3]=love.graphics.newQuad(366 ,52 ,6 ,26 ,imgui:getDimensions())
	barra[1][4]=love.graphics.newQuad(440 ,289 ,19 ,26 ,imgui:getDimensions())
	
	barra[2][1]=love.graphics.newQuad(290,0,6,26,imgui:getDimensions())
	barra[2][2]=love.graphics.newQuad(290,40,16,26,imgui:getDimensions())
	barra[2][3]=love.graphics.newQuad(424,0,6,26,imgui:getDimensions())
	barra[2][4]=love.graphics.newQuad(346,16,19,26,imgui:getDimensions())

	barra[3][1]=love.graphics.newQuad(424,36,6,26,imgui:getDimensions())
	barra[3][2]=love.graphics.newQuad(316,40,16,26,imgui:getDimensions())
	barra[3][3]=love.graphics.newQuad(220,42,6,26,imgui:getDimensions())
	barra[3][4]=love.graphics.newQuad(440,90,19,26,imgui:getDimensions())

	barra[4][1]=love.graphics.newQuad(505,332,6,26,imgui:getDimensions())
	barra[4][2]=love.graphics.newQuad(474,400,16,26,imgui:getDimensions())
	barra[4][3]=love.graphics.newQuad(506,368,6,26,imgui:getDimensions())
	barra[4][4]=love.graphics.newQuad(522,358,19,26,imgui:getDimensions())

	barra[5][1]=love.graphics.newQuad(476,132,6,26,imgui:getDimensions())
	barra[5][2]=love.graphics.newQuad(607,368,16,26,imgui:getDimensions())
	barra[5][3]=love.graphics.newQuad(440,152,6,26,imgui:getDimensions())
	barra[5][4]=love.graphics.newQuad(476,332,19,26,imgui:getDimensions())
	--total
	barra[6][1]=barra[1][4]
	barra[6][2]=barra[2][4]
	barra[6][3]=barra[3][4]
	barra[6][4]=barra[4][4]
	barra[6][5]=barra[5][4]

	if x==0 then
		return barra[6]
	elseif x==nil then
		return imgui,barra[6][love.math.random(5)]
	else
		return imgui, barra[x]
	end
end

function uiboton()
	return imgboton
end

function botonui(x)
	botones[1]=love.graphics.newQuad(687,443,190,49,imgboton:getDimensions())
	botones[2]=love.graphics.newQuad(228,169,190,45,imgboton:getDimensions())
	botones[3]=love.graphics.newQuad(400,734,38,38,imgboton:getDimensions())
	botones[4]=love.graphics.newQuad(798,536,38,36,imgboton:getDimensions())
	botones[5]=love.graphics.newQuad(887,422,38,36,imgboton:getDimensions())
	botones[6]=love.graphics.newQuad(529,574,38,36,imgboton:getDimensions())
	return botones
end

function flechaui(x)
	flecha[1]=love.graphics.newQuad(141,52,39,31,imgboton:getDimensions())
	flecha[2]=love.graphics.newQuad(110,275,39,31,imgboton:getDimensions())
	return flecha
end

function cursort()
	cursortotal[1]=love.graphics.newQuad(382,0,32,32,imgui:getDimensions())
	cursortotal[2]=love.graphics.newQuad(485,90,32,32,imgui:getDimensions())
	cursortotal[3]=love.graphics.newQuad(382,58,32,32,imgui:getDimensions())
	cursortotal[4]=love.graphics.newQuad(440,247,32,32,imgui:getDimensions())
	cursortotal[5]=love.graphics.newQuad(476,194,36,36,imgui:getDimensions())
	cursortotal[6]=love.graphics.newQuad(482,286,36,36,imgui:getDimensions())
	cursortotal[7]=love.graphics.newQuad(482,240,36,36,imgui:getDimensions())
	cursortotal[8]=love.graphics.newQuad(534,394,36,36,imgui:getDimensions())
	return cursortotal
end

function titulo()
	local title=love.graphics.newImage("assets/title.png")
	return title
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
