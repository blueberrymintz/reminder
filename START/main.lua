function love.load()
    
    Rectangle_XYZ = {50,50,100,100,0,0}
    -- defines if mouse is above, right of, below or left of rectangle
    Rectangle_Mouse_Check_V = {0,0,0,0}
    function Rectangle_Mouse_Check()
        if love.mouse.getX < Rectangle_XYZ[1] then
            Rectangle_Mouse_Check_V[1] = 1
        else Rectangle_Mouse_Check_V[1] = 0
        end
        if love.mouse.getX < Rectangle_XYZ[2] then
            Rectangle_Mouse_Check_V[2] = 1
        else Rectangle_Mouse_Check_V[2] = 0
        end
        if love.mouse.getX < Rectangle_XYZ[3] then
            Rectangle_Mouse_Check_V[3] = 1
        else Rectangle_Mouse_Check_V[3] = 0
        end
        if love.mouse.getX < Rectangle_XYZ[4] then
            Rectangle_Mouse_Check_V[4] = 1
        else Rectangle_Mouse_Check_V[4] = 0
        end

    end
    function Update_Rectangle_XYZ()
        --defines height
        Rectangle_XYZ[6] = Rectangle_XYZ[4] - Rectangle_XYZ[2]
        --defines width
        Rectangle_XYZ[5] = Rectangle_XYZ[3] - Rectangle_XYZ[1]
    end
    function Move_Rectangle()
        
        --gets mouse position
        local x = love.mouse.getX()
        local y = love.mouse.getY()
        --updates Top Left X and Y position
        Rectangle_XYZ[1] = Rectangle_XYZ[1] + x
        Rectangle_XYZ[2] = Rectangle_XYZ[2] + y
        --updates Bottom Right X and Y position
        Rectangle_XYZ[3] = Rectangle_XYZ[3] + x
        Rectangle_XYZ[4] = Rectangle_XYZ[4] + y
    end
    -- shrinks/lengthens rectangle x
    function Wide_Rectangle()
        Rectangle_XYZ[1] = Rectangle_XYZ[1]+ 1
        Rectangle_XYZ[3] = Rectangle_XYZ[3]+ 1
    end
    function Thin_Rectangle()
        Rectangle_XYZ[1] = Rectangle_XYZ[1]- 1
        Rectangle_XYZ[3] = Rectangle_XYZ[3]- 1
    end
    -- grows rectangle y
    function Tall_Rectangle()
        Rectangle_XYZ[2] = Rectangle_XYZ[2] + 1
        Rectangle_XYZ[4] = Rectangle_XYZ[4] + 1
    end
    function Short_Rectangle()
        Rectangle_XYZ[2] = Rectangle_XYZ[2] - 1
        Rectangle_XYZ[4] = Rectangle_XYZ[4] + 1
    end
    WO_Value = 1
    Debug_View_True = 0
    -- debug viewing function
    function Debug_View()
        function love.mousereleased(button)
        if button == 2 then
            if Debug_View_True > 0 then
                Debug_View_True = 0
            end
            if Debug_View_True <1 then
                Debug_View_True = 1
            end
        end
    end
        
    end
   
end

function love.update(dt)
    --debug view toggle
    Debug_View()
    if love.mouse.isDown(1) == true then
        Move_Rectangle()
    end

    if love.keyboard.isDown('q') == true then
        Tall_Rectangle()
    end
    if love.keyboard.isDown('w') == true then
        Short_Rectangle()
    end
    if love.keyboard.isDown('e') == true then
        Wide_Rectangle()
    end
    if love.keyboard.isDown('r') == true then
        Thin_Rectangle()
    end
    
    
end
function love.draw()
    -- basic text box drawing
    love.graphics.polygon("line", Rectangle_XYZ[1], Rectangle_XYZ[2], Rectangle_XYZ[3], Rectangle_XYZ[4])
end


