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
		io.write = ("Do you have a wordlist? give me the path or hit y to use default : ")
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
help()
exploits_searcher()
hidden_content_hunt()