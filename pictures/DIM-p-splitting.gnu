set t epslatex size 4.0,1.0 dashed color colortext linewidth 1.5
set o "DIM-p-splitting.tex"

lwp=1.0 #largeur ligne dans les styles
lwp2=1.0

set style line 1 lt rgb "black" lw lwp
set style line 9 lt rgb "black" lw lwp2
set style line 8 lt rgb "black" lw lwp2 dt 8
set style line 2 lt rgb "#FF4500" lw lwp
set style line 3 lt rgb "#9ACD32" lw lwp
set style line 4 lt rgb "#4682B4" lw lwp
set style line 5 lt rgb "#CD853F" lw lwp
set style line 6 lt rgb "#FFA500" lw lwp
set style line 7 lt rgb "#A0522D" lw lwp

set parametric
set xrange [-2.5:1.5]
set yrange [-0.5:0.5]

set lmargin at screen 0.0
set rmargin at screen 100.0
set bmargin at screen 0.0
set tmargin at screen 100.0
#set border 1+2+4+8
unset border
unset xtics
unset ytics
set size ratio -1

x0=-2.0
x1=0.0
y1=0.5
y2=-0.5
d=1.0
r=0.12
b=0.45


theta=3.14/2.0

 


#set arrow 1 filled from 0,y1 to x,y front 

set label 1 "$\\Pi (\\Lambda=\\pm1$)" at x0-r,0 right offset -1.0,0
set arrow 1 from x0,0 to x0+d,0 nohead ls 1 dt 2 
set obj 1 circle at x0+d,0 size r front

set label 2 "$\\Sigma (\\Lambda=0)$" at x1+d+r,0 left offset 0.5,0
set arrow 2 from x1+b,0 to x1+d,0 nohead ls 1 dt 2
set obj 2 circle at x1+d,0 size r front


#plot [0:pi] cos(t), -sin(t) notitle ls 1,\
#	cos(t), 0.5*sin(t)+sin(t)*(1.5*abs(t-pi/2.0)**2-abs(t-pi/2.0)**3) notitle ls 1,\
	
plot [0:pi] b*sin(2*t)*cos(2*t)+x0,b*cos(2*t)**1.3  notitle ls 1,\
			b*sin(2*t)*cos(2*t)+x0,-b*cos(2*t)**1.3  notitle ls 1,\
			(b*sin(2*t)*cos(2*t)*cos(theta)-b*cos(2*t)**1.3*sin(theta))+x1, (b*sin(2*t)*cos(2*t)*sin(theta)+b*cos(2*t)**1.3*cos(theta)) notitle ls 1,\
			-(b*sin(2*t)*cos(2*t)*cos(theta)-b*cos(2*t)**1.3*sin(theta))+x1, -(b*sin(2*t)*cos(2*t)*sin(theta)+b*cos(2*t)**1.3*cos(theta)) notitle ls 1


#theta2 = pi*0.5
#rep (b*sin(2*t)*cos(2*t)*cos(theta2)-b*cos(2*t)**1.3*sin(theta2)), (b*sin(2*t)*cos(2*t)*sin(theta2)+b*cos(2*t)**1.3*cos(theta2))+y1 notitle ls 8
#rep -(b*sin(2*t)*cos(2*t)*cos(theta2)-b*cos(2*t)**1.3*sin(theta2)), -(b*sin(2*t)*cos(2*t)*sin(theta2)+b*cos(2*t)**1.3*cos(theta2))+y1 notitle ls 8 






