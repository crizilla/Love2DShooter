--ayy lmao
----------------
---GAME LOOP----
----------------
function love.load()
	background = love.graphics.newImage("background.jpg")
	ufo = love.graphics.newImage("ufo.gif")
	laser = love.audio.newSource("laser.mp3", static)
	music = love.audio.newSource("skril.mp3")
	ding = love.audio.newSource("ding.mp3", static)
	music:play()
	cursor = love.mouse.newCursor("crosshair.png", 17, 17)
	
----GLOBALS------
-----------------
--window size
width = 1280
height = 720

--ufo x and y
ufoX = -50
ufoY = love.math.random(1, 400)

--music text variable
musicText = "M Key: Music On/Off"

--UFO image size
ufoWidth = 50
ufoHeight = 33

--score
score = 0

--random Y position
randomY = love.math.random(1, 400)

end


function love.update(dt)

	ufoX = ufoX + 1

end

--ayy
function love.draw()
	love.graphics.draw(background)
	love.mouse.setCursor(cursor)
	x, y = love.mouse.getPosition()
	
	--x and y mouse coordinates
	love.graphics.print("X: "..x, 1180, 700)
	love.graphics.print("Y: "..y, 1235, 700)
	
	--music
	love.graphics.print(musicText, width/2, 700)
	
	--score
	love.graphics.print("SCORE: "..score, 300, 700)
	
	love.graphics.print("Current FPS: "..love.timer.getFPS(), 5, 700)

	love.graphics.draw(ufo, ufoX, ufoY)

		
	if ufoX > 1280
		then ufoX = -50
	end
end

------------------------------------------------------------------------------

---------------
-----EVENTS----
---------------

function love.mousepressed(mx, my, button)
	if button == "l" then
		laser:play()
	end
	if button == "l"
			and mx >= ufoX and mx <= ufoX + ufo:getWidth()
			and my >= ufoY and my <= ufoY + ufo:getHeight() then
			ding:play()
			score = score + 1
	end
end


--music control
isPaused = false
function love.keypressed(key)
	if key == "m" then
		if isPaused == false then
			music:pause()
			isPaused = true
		else
			music:resume()
			isPaused = false
		end
	end
end









