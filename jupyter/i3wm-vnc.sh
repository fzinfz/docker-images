tightvncserver

sed -i 's!/etc/X11/Xsession!#/etc/X11/Xsession!' ~/.vnc/xstartup 
echo 'i3 &' >> ~/.vnc/xstartup 
cp -f  /etc/i3/config ~/.i3/

tightvncserver -kill :1
tightvncserver

