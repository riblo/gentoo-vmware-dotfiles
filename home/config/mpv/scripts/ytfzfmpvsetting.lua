--[[
- Part of personal video project in November-December 2022, Nick0bre Chile shared for Maboxlinux users. Maboxlinux.org Forum.
Mpv lua script to automatically change ytdl-format (for yt-dlp) when using/running ytfzf script from terminal (e.g. ytfzf -t The Beatles / e.g. ytfzf
 -m The Rolling Stones, so as to watch/listen Youtube tunes/channels from Mpv player & presetting your best resolution manually).

Options:
- To add more domains, simply add them to the StreamSource set between 'xxx.com' & separated by a comma excepting for the last domain added in line 24.
- To adjust quality, edit local changedQuality value in line 28 from the options stated above in line 27 (240, 360, 480, 720, 1080, 1440, or 2160).
- It is recommended to set VP9 codec as false to keep video framerate solid & running most of the time. But if you want to enable VP9 codec, 
change enableVP9 to true in line 31.
- To change frame rate, adjust FPSLimit in line 32 at your own risk, default is 30 & works great.
- I recommend to keep the rest of this script as it is so as to have it 100% functional, in case you have not used/ or worked lua scripting before.
--]]

local function Set (t)
	local set = {}
	for _, v in pairs(t) do set[v] = true end
	return set
end

-- Domains list for custom quality
local StreamSource = Set {
	'youtu.be', 'youtube.com', 'www.youtube.com', 
	'twitch.tv', 'yewtu.be', 'www.twitch.tv'
}

-- Accepts: (240, 360, 480, 720, 1080, 1440, 2160) ( The smallest quality is set as deafult now)
local changedQuality = 240

-- Affects matched and non-matched domains
local enableVP9 = false
local FPSLimit = 30

-- Do not edit from here on
local msg = require 'mp.msg'
local utils = require 'mp.utils'

local VP9value = ""

if enableVP9 == false then
	VP9value = "[vcodec!=?vp9]"
end

local ytdlChange = "bestvideo[height<=?"..changedQuality.."][fps<=?"..FPSLimit.."]"..VP9value.."+bestaudio/best[height<="..changedQuality.."]"
local ytdlDefault = "bestvideo[fps<=?"..FPSLimit.."]"..VP9value.."+bestaudio/best"

local function getStreamSource(path)
	local hostname = path:match '^%a+://([^/]+)/' or ''
	return hostname:match '([%w%.]+%w+)$'
end

local function ytdlAutoChange(name, value)
	local path = value

	if StreamSource[getStreamSource(string.lower(path))] then
		mp.set_property("ytdl-format", ytdlChange)
		msg.info("Domain match found, ytdl-format has been changed.")
		msg.info("Changed ytdl-format: "..mp.get_property("ytdl-format"))
	else
		msg.info("No domain match, ytdl-format unchanged.")
	end

	mp.unobserve_property(ytdlAutoChange)
	msg.info("Finished check, script no longer running.")
end

local function ytdlCheck()
	local path = mp.get_property("path", "")
	
	if string.match(string.lower(path), "^(%a+://)") then
		mp.set_property("ytdl-format", ytdlDefault)
		msg.info("Current ytdl-format: "..mp.get_property("ytdl-format"))
		
		mp.observe_property("path", "string", ytdlAutoChange)
		msg.info("Observing path to determine ytdlAutoChange status...")
	else
		msg.info("Not a URL/Stream, script did not run.")
	end
end

mp.register_event("start-file", ytdlCheck)

