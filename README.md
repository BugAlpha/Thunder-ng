# Thunder-ng
A Multi purpose hacking tools easy to use and oriented towards Pentesters and Bug Bounty Hunters
## Installation
* For debian based distros (Parrot, Kali, Ubuntu)
  * Install the following tools ** NOTE : you must have the parrotos or kali repos in ubuntu or any other debian distro for the commands to work **
    * [Lua](https://github.com/lua/lua)```sudo apt install liblua5.4-dev -y```
    * [luaRocks](https://luarocks.org)```sudp apt install luarocks```
    * [lua-http](https://daurnimator.github.io/lua-http/0.2/) ```sudo luarocks install http```
    * [NMAP](https://github.com/nmap/nmap) ```sudo apt install nmap -y```
    * [Dirb](https://github.com/v0re/dirb) ```sudo apt install dirb -y```
    * [Searchsploit](https://github.com/andreafioraldi/cve_searchsploit) ```sudo apt install exploitdb -y```
* For Fedora (or any redhat distro)
  * Install the following toolsInstall the following tools
    * [Lua](https://github.com/lua/lua)```sudo dnf install liblua5.4-dev```
    * [LuaRocks](https://luarocks.org)```sudo dnf install luarocks```
    * [lua-http](https://daurnimator.github.io/lua-http/0.2/) ```sudo luarocks install http```
    * [NMAP](https://github.com/nmap/nmap)```sudo dnf install nmap```
    * [Dirb](https://github.com/v0re/dirb)```Compile from source (Follow the instructions in dirb repo)```
    * [Searchsploit](https://github.com/andreafioraldi/cve_searchsploit)```Compile from source (Follow the instructions in SearchSploit repo)``` 
* Else if you are in another distro install from source and don't be lazy
## Features
Note the project is still under development so bugs and error are averywhere and still it needs more features
* Search for exploits
Thunder allow you to search for exploits automaticlly by doing an nmap scan and passing it to searchsploit
  * Usage
```
lua main.lua -exp
```
* Search for hidden content and loot
with this feature you can hunt and search for directories and files ethier on an CMS or just raw Available CMS's are django, drupal, and umbraco more soon ...
  * Usage
```
lua main.lua --hidden CMS name 
```
Or for raw
```
lua main.lua --hidden raw
```
* Reverse shell stuff
With the ```--bypass``` flag you can bypass file upload checks or limitations :)
  * Usage
```
lua main.lua -rv --bypass
 ```
Or with ```--generate``` flag you can generate a php revese shell THANKS to pentest monkey for providing the php rev
```
lua main.lua -rv --generator
```
* Detect what cms your target uses
  * Usage
  ```
  lua main.lua -cms --bypass
  ```
  Right now it only search for wordpress and drupal
## Contribute
I will be happy to see someone post an issue or make a pull request feel free to do it anytime :) !
