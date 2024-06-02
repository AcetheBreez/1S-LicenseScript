

--[[
  --  ██ ███████               ██████  ███████ ██    ██ 
  -- ███ ██                    ██   ██ ██      ██    ██ 
  --  ██ ███████     █████     ██   ██ █████   ██    ██ 
  --  ██      ██               ██   ██ ██       ██  ██  
  --  ██ ███████               ██████  ███████   ████   
  --                                                    
  --                                                                                                                     
 https://discord.gg/SMDpNF2PJ8
]]--

fx_version 'cerulean'
game 'gta5'
lua54 "yes"
name 'Weapon License Script'
author '1S Scripts'
version '2.37.2'
description 'Weapon Licence Script that gives you a license and can be an item or not but runs through Meta Data.'


server_script 'server/*.lua'
client_script 'client/*.lua'

shared_scripts {
  '@ox_lib/init.lua',
}

