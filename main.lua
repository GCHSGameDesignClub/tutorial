
--[[
--  This is our newImage function
--  we pass it the directory of the image surrounded by quotation marks
--  as well as the x and y coordinates of the image, with 1, 1 being at
--  the top left of the screen.
--]]
function newImage(dir, x, y)
    --The first thing we have to do is create a table
    --to hold the image. Tables in lua are similar to
    --arrays in other programming languages, but are far
    --more lenient.
    --
    --The 'local' keyword tells lua that this variable (which we
    --named t) shoul only be accessed inside this function, and 
    --the {} is the empty table.
    local t = {}

    --Now we tell love to load the image located at the directory
    --dir and then store it in the field img of our table t.
    t.img = love.graphics.newImage(dir)

    --Now store x and y into their own fields in t.
    t.x = x
    t.y = y

    --return the newly created table to be stored in another variable
    --without this we couldnt assign it to a variable (like pic1 and pic2 
    --below) because if we aren't returning something, those variables would
    --be set to equal nothing at all.
    return t
end

--[[
--  The function love.load() is what lua calls when it is initially setting
--  up our game.  It is meant to load all the game's assets including pictures,
--  music, sounds, etc.  Here we are using it with our function newImage to load
--  two images.
--]]
function love.load()
    --Create a new variable named pic1 and call our function newImage so that
    --we set it to equal an image with the coordinates (0, 0)
    pic1 = newImage("pic1.png", 0, 0)

    --Same as above except find pic2.png, and show it closer to the middle of
    --the screen
    pic2 = newImage("pic2.png", 300, 300)
end

--[[
--  love.update() is the function love calls to update our game.
--  This is the function to use for game logic such as physics.
--
--  Here it is being used to test if certain keys are being held
--  down, and if so, increment/decrement the x or y value of pic1
--  until the key is released.
--]]
function love.update()
    --if the w key is being held down, then continue to the indented
    --statement, otherwise, skip to end
    if love.keyboard.isDown("w") then
        --set pic1.y to equal 5 less than what it used to be
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

    --NOTE: in this function we used individual if statements for each key.
    --Another approach would be to use elseifs for every key after w, but that
    --presents some problems.  The first being that the image would only be able
    --to move one direction (left, right, up, or down) at a time, and the other is
    --that if the player held down both a and d they would not cancel out.
end

--[[
--  The function love.draw() is called whenever love decides it is
--  appropriate to draw the next frame.  This is where any images or text should
--  be displayed on screen.
--
--  NOTE: this is NOT the function to do any game logic, such as physics, in.  Doing
--  this will result in your game's logic being tied to the framerate.
--]]
function love.draw()
    --Tell love to draw pic1.img at the coordinates (pic1.x, pic1.y), and do the same with pic2
    love.graphics.draw(pic1.img, pic1.x, pic1.y)
    love.graphics.draw(pic2.img, pic2.x, pic2.y)
end
