-- ## Information ##############################################################
-- Filename: Visualizer.lua
-- Project: PlayMusic
-- Author: Brett Stevenson
-- Contact: BStevensonDev@gmail.com
-- Version: v1.2.0
-- License: GNU AGPLv3.0
-- Updated: Feb 1, 2017
-- Copyright (c) 2016 Brett Stevenson
-- ##########################################################################

-- ## Description ##############################################################
-- This is the Lua script which allows the PlayMusic skin to create a custom
-- visualizer based on the configuration.
-- ###########################################################################

function Initialize()
	local count = SELF:GetNumberOption("BarCount")
	local space = SELF:GetNumberOption("Spacing")
	local enabled = SELF:GetNumberOption("EnableVisualizer")
	local file = io.open(SKIN:MakePathAbsolute(SELF:GetOption("IncFile")), "w")
	if enabled == 1 then
		for i = 1, count-1 do
			file:write("[MeterBand" .. i .. "]\n")
			file:write("Meter=Bar\n")
			file:write("MeasureName=MeasureBand" .. i .. "\n")
			file:write("MeterStyle=VisualizerStyle\n")
			if space > 0 then
				file:write("X=" .. space .. "R\n")
			end
		end
	end
	file:close()
end
