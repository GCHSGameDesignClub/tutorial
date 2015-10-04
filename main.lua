

function newImage(dir, x, y)
    local t = {}
    t.img = love.graphics.newImage(dir)
    t.x = x
    t.y = y
    return t
end


function love.load()
    pic1 = newImage("pic1.png", 0, 0)
    pic2 = newImage("pic2.png", 300, 300)
end


function love.update()
    if love.keyboard.isDown("w") then
        pic1.y = pic1.y - 5
    end
    
    if love.keyboard.isDown("s") then
        pic1.y = pic1.y + 5
    end
    
    if love.keyboard.isDown("a") then
        pic1.x = pic1.x - 5
    end
        
    if love.keyboard.isDown("d") then
        pic1.x = pic1.x + 5 
    end
end


function love.draw()
    love.graphics.draw(pic1.img, pic1.x, pic1.y)
    love.graphics.draw(pic2.img, pic2.x, pic2.y)
end
