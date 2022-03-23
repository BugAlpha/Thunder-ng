# Thunder-ng
A Multi purpose hacking tools easy to use and oriented towards Pentesters and Bug Bounty Hunters
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
  Right now it only search for wordpress but soon i will inculde most other cms's
## Contribute
I will be happy to see someone post an issue or make a pull request feel free to do it anytime :) !
