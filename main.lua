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

engine = {};

engine.player = require("player");

function love.load()
	gravity = 0.125;
	player = engine.player:new(400-32, 300-32, 64);
end

function love.draw()
	love.graphics.polygon("fill", player:getVerts());
end

function love.update(dt)
	if love.keyboard.isDown("up") then
		if not player:isOnGround() then return end
		player:setOnGround(false);	
		player:setYVel(-(dt * 300));
		player:setY(player:getY() - (dt * 300));
	end

	if love.keyboard.isDown("left") then
		if player:getX() - (dt * 50) <= 0 then return end

		player:setX(player:getX() - (dt * 50));
	end

	if love.keyboard.isDown("right") then
		if (player:getX() + player:getSize()) + (dt * 50)
			>= 800 then return end

		player:setX(player:getX() + (dt * 50));
	end

	if not player:isOnGround() then
		if player:getY() + player:getSize() + (dt * 100) >= 600 then
			player:setY(600 - player:getSize());
			player:setOnGround(true);	
		else
			player:setY(player:getY() + player:getYVel());
			player:setYVel(player:getYVel() + gravity);
		end
	end
end
