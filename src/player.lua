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

local p = {};

p.new = function(self, x, y, size)
	local x = x or 0;
	local y = y or 0;
	local size = size or 50;

	if type(x) ~= "number" then
		error("new() : x - expected number, got "..type(x), 2);
	end

	if type(y) ~= "number" then
		error("new() : y - expected number, got "..type(y), 2);
	end

	if type(size) ~= "number" then
		error("new() : size - expected number,"..
		"got "..type(size), 2);
	end

	local self = setmetatable({}, p);
			
	rawset(self, "x", x);
	rawset(self, "y", y);
	rawset(self, "size", size);
	rawset(self, "xVel", 0);
	rawset(self, "yVel", 0);
	rawset(self, "onGround", false);

	return self;
end

p.setOnGround = function(self, bool)
	if type(bool) ~= "boolean" then
		error("onGround() : bool - expected bool, got "
		..type(bool), 2);
	end

	self.onGround = bool;
end

p.isOnGround = function(self)
	return self.onGround;	
end

p.setSize = function(self, size)
	if type(size) ~= "number" then
		error("setSize() : size - expected number, got "
		..type(size), 2);
	end

	self.size = size;
end

p.getSize = function(self)
	return self.size;
end

p.setX = function(self, x)
	if type(x) ~= "number" then
		error("setX() : x - expected number, got "
		..type(x), 2);
	end

	self.x = x;	
end

p.setY = function(self, y)
	if type(y) ~= "number" then
		error("setY() : y - expected number, got "
		..type(y), 2);
	end

	self.y = y;
end

p.getX = function(self)
	return self.x;
end

p.getY = function(self)
	return self.y;
end

p.setXVel = function(self, vel)
	if type(vel) ~= "number" then
		error("setXVel() : vel - expected number, got "
		..type(vel), 2);
	end

	self.xVel = vel;
end

p.setYVel = function(self, vel)
	if type(vel) ~= "number" then
		error("setYVel() : vel - expected number, got "
		..type(vel), 2);
	end

	self.yVel = vel;
end

p.getXVel = function(self)
	return self.xVel;
end

p.getYVel = function(self)
	return self.yVel;
end

p.getVerts = function(self)
	return {
		self.x, self.y;
		self.x + self.size, self.y;
		self.x + self.size, self.y + self.size;
		self.x, self.y + self.size;
	};
end

p.__index = p;
p.__type = "player";

p = setmetatable(p, p);

return p;
