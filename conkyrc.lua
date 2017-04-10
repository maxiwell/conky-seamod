-----------------------------------------------------------------------------
--                               conkyrc_seamod
-- Date    : 04/23/2016
-- Author  : SeaJey and Maxiwell
-- Conky   : >= 1.10 
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

conky.config = {

	background = true,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,
	temperature_unit = 'celsius',

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

	gap_x = 80,
	gap_y = 70,
	minimum_width = 300, minimum_height = 900,
	maximum_width = 350,

	own_window = true,
	own_window_type = 'normal',
	own_window_transparent = true,
	own_window_argb_visual = true,
	own_window_class = 'conky-semi',
	own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

	border_inner_margin = 0,
	border_outer_margin = 0,
	alignment = 'top_right',


	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

	override_utf8_locale = true,
	use_xft = true,
	font = 'caviar dreams:size=11',
	xftalpha = 0.5,
	uppercase = false,

-- Defining colors
	default_color = '#FFFFFF',
-- Shades of Gray
	color1 = '#DDDDDD',
	color2 = '#AAAAAA',
	color3 = '#888888',
-- Orange
	color4 = '#EF5A29',
-- Green
	color5 = '#77B753',
-- Loading lua script for drawning rings
	lua_load = '~/.conky/seamod/seamod_rings.lua',
	lua_draw_hook_pre = 'main',

};

--${offset 15}${font Ubuntu:size=11:style=normal}${color1}${pre_exec lsb_release -d | cut -f 2} - $sysname $kernel
conky.text = [[
${font Ubuntu:size=11:style=bold}${color4}SYSTEM ${hr 2}
${offset 15}${font Ubuntu:size=11:style=normal}${color1}$sysname $kernel
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Battery:  ${color3}${battery_bar 5,150 BAT0} ${color3}${battery_percent BAT0}%
${offset 15}${font Ubuntu:size=11:style=normal}${color1}Uptime: ${color3}$uptime

# Showing CPU Graph
${voffset 20}
${offset 125}${cpugraph cpu0 40,220 666666 666666 -0.3}${voffset -25}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}CPU
# Showing TOP 5 CPU-consumers
${offset 105}${font Ubuntu:size=11:style=normal}${color4}${top name 1}${alignr}${top cpu 1}%
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top name 2}${alignr}${top cpu 2}%
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top name 3}${alignr}${top cpu 3}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 4}${alignr}${top cpu 4}%
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top name 5}${alignr}${top cpu 5}%

#Showing memory part with TOP 5
${voffset 40}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}MEM
${offset 105}${font Ubuntu:size=11:style=normal}${color4}${top_mem name 1}${alignr}${top_mem mem_res 1}
${offset 105}${font Ubuntu:size=11:style=normal}${color1}${top_mem name 2}${alignr}${top_mem mem_res 2}
${offset 105}${font Ubuntu:size=11:style=normal}${color2}${top_mem name 3}${alignr}${top_mem mem_res 3}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 4}
${offset 105}${font Ubuntu:size=11:style=normal}${color3}${top_mem name 4}${alignr}${top_mem mem_res 5}

# Showing disk partitions: root, home and files
${voffset 12}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Disk Read: ${alignr}${font Ubuntu:size=10:style=normal}${color2}${diskio_read}
${offset 180}${color1}${font Ubuntu:size=10:style=bold}Disk Write: ${alignr}${font Ubuntu:size=10:style=normal}${color2}${diskio_write}
${voffset -30}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}DISKS
${offset 120}${diskiograph 40,220 666666 666666 -0.5}${voffset -30}
${voffset 20}
${offset 15}${font Ubuntu:size=10:style=bold}${color1}Free: $color3${font Ubuntu:size=10:style=normal}${fs_free /}${alignr}${font Ubuntu:size=10:style=bold}${color1}Used: $color3${font Ubuntu:size=10:style=normal}${fs_used /}
${offset 15}${font Ubuntu:size=10:style=bold}${color1}Free: $color3${font Ubuntu:size=10:style=normal}${fs_free /home}${alignr}${font Ubuntu:size=10:style=bold}${color1}Used: $color3${font Ubuntu:size=10:style=normal}${fs_used /home}
${offset 15}${font Ubuntu:size=10:style=bold}${color1}Free: $color3${font Ubuntu:size=10:style=normal}${fs_free /media/files}${alignr}${font Ubuntu:size=10:style=bold}${color1}Used: $color3${font Ubuntu:size=10:style=normal}${fs_used /media/files}

# Network data (my desktop have only LAN). ETHERNET ring is mostly useless but looks pretty, main info is in the graphs
${voffset 45}
${offset 200}${font Ubuntu:size=10:style=bold}${color1}Lan IP: ${alignr}$color3${addr wlan0} 
${offset 200}${font Ubuntu:size=10:style=bold}${color1}Ext IP: ${alignr}$color3${execi 600 wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1} 
${offset 190}${font Ubuntu:size=10:style=bold}${alignr}$color3${execi 600 wget -q -O /dev/stdout https://www.dnsleaktest.com/ | grep from | grep -o '<p>.*<img' | grep -o '>.*<' | grep -oEi '[a-zA-Z0-9 ,]+'}

${voffset -60}
${offset 90}${font Ubuntu:size=11:style=bold}${color5}ETHERNET
${voffset 40}             
${offset 15}${color1}${font ubuntu:size=10:style=bold}Up: ${alignr}${font Ubuntu:size=10:style=normal}$color2${upspeed wlan0} / ${totalup wlan0}
${offset 15}${upspeedgraph wlan0 40,320 4B1B0C FF5C2B 1280KiB -l}
${offset 15}${color1}${font Ubuntu:size=10:style=bold}Down: ${alignr}${font Ubuntu:size=10:style=normal}$color2${downspeed wlan0} / ${totaldown wlan0}
${offset 15}${downspeedgraph wlan0 40,320 324D23 77B753 1280KiB -l}

${color4}${hr 2}




]];
