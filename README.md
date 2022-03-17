![Alt text](https://github.com/BugAlpha/Thunder-ng/raw/main/logo.png "logo")
# Thunder-ng
A Multi purpose hacking tools easy to use and oriented towards Pentesters and Bug Bounty Hunters
## Usage
Note the project is still under development so bugs and error are averywhere and still it needs more features
### Search for exploits
Thunder allow you to search for exploits automaticlly by doing an nmap scan and passing it to searchsploit
#### Usage
<code>lua main.lua -exp</code>
### Search for hidden content and loot
with this feature you can hunt and search for directories and files ethier on an CMS or just raw
  Available CMS's are django, drupal, and umbraco more soon ...
#### Usage
<code>lua main.lua --hidden CMS name </code> Or for raw <code>lua main.lua --hidden raw</code>
### Reverse shell stuff
#### Usage
With the <code>--bypass</code> you can bypass file upload checks or limitations :) 
<code>lua main.lua -rv --bypass</code>
Or with <code>--generate</code> you can generate a php revese shell THANKS to pentest monkey for providing the php rev
<code>lua main.lua -rv --generator</code>
## Contribute
I will be happy to see someone post an issue or make a pull request feel free to do it anytime :) !
