lista_botones = {} 
 
function crear_boton(x,y,w,h,texto, imagen, quad)  
    table.insert(lista_botones, {x = x, y = y, x_max = w, y_max = h , texto = texto, imagen = imagen, quad = quad})
end
 
function dibujar_botones()
    for i,j in ipairs(lista_botones) do
            love.graphics.draw(j.imagen, j.quad, j.x, j.y)
    end
end
 
function seleccionar_boton(x,y)
    for i,j in ipairs(lista_botones) do
        if x > j.x and x < j.x+j.x_max and y > j.y and y < j.y + j.y_max then
            return j.texto
        end
    end
end
