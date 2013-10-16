                                      
GRUB2 kallisti discordian theme 
===============================        
                                    
Version history:

 0.0.1: first test release 

Introduction:
 
 This is a discordian theme for grub2.

Usage:  
 !tested on fedora only!
 
 get the git repo with my config files:
 
 git clone https://github.com/jaeh/fedora-config.git
 
 
 cd ./config_collect/
 
 su -c 'cp -r ./grub2config/themes/kallisti /boot/grub2/themes/ && cp -r ./grub2config/grub /etc/default/grub'
 
 su 'grub2-mkconfig -o /boot/grub2/grub.cfg'
 
 
Remarks:
 This theme does not contain any important text in a fixed language,
 to change the text above the picture just change the image.


TODO: 
 
 use a textfield with the hostname instead of the text in the image
 
 maybe: get the apple to rotate to indicate loading or make some other kind of anim, kind of unneeded since the screen only pops up for a second in my settings ;)

Copyright & Licensing:

 Ⓐ 2013 - XXXX All Rites Reversed.
 
 nothing is true, everything is permitted.
