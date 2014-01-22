--[[

Platformer Engine
Copyright (C) 2013 Robert Cochran

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 3
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License in the LICENSE file for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

]]

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
