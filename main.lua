function love.load()
	player = {
		verts = {
			0, 0;
			0, 50;
			50, 50;
			50, 0;
		},
		onGround = false,
	};
end

function love.draw()
	love.graphics.polygon("fill", player.verts);
end

function love.update(dt)
	if love.keyboard.isDown("up") then
		if not player.onGround then return end
		player.onGround = false;		

		for i = 2, #player.verts, 2 do
			player.verts[i] = player.verts[i] - dt * 1000;
		end
	end

	if love.keyboard.isDown("left") then
		if player.verts[1] - (dt * 50) <= 0 then return end

		for i = 1, #player.verts, 2 do
			player.verts[i] = player.verts[i] - dt * 50;
		end
	end

	if love.keyboard.isDown("right") then
		if player.verts[5] + (dt * 50) >= 800 then return end

		for i = 1, #player.verts, 2 do
			player.verts[i] = player.verts[i] + dt * 50;
		end
	end

	if not player.onGround then
		if player.verts[6] + (dt * 100) >= 550 then
			player.verts[2] = 600; player.verts[4] = 550; player.verts[6] = 550; player.verts[8] = 600;
			player.onGround = true;		
		else
			for i = 2, #player.verts, 2 do
				player.verts[i] = player.verts[i] + (dt * 100);
			end
		end
	end
end
