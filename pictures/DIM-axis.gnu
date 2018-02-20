set t epslatex size 1.5,2.5 dashed color colortext linewidth 1.5
set o "DIM-axis.tex"

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
set xrange [-1.05:1.05]
set yrange [-1.05:2.2]

set lmargin at screen 0.0
set rmargin at screen 100.0
set bmargin at screen 0.0
set tmargin at screen 100.0
#set border 1+2+4+8
unset border
unset xtics
unset ytics
set size ratio -1

y1=1.5
x=0.55
y=0.35
y0=-0.2
a=0.7
b=0.5
r=sqrt((a*(y1-y))**2+(x*a)**2)
ps=(-x*a)*(0)+(a*(y1-y))*r
n1=sqrt((-x*a)**2 + (a*(y1-y))**2)
n2=sqrt((0)**2+(r)**2)
print ps, n1, n2
print ps/(n1*n2)
print acos(ps/(n1*n2))
theta=acos(ps/(n1*n2))

set obj 1 circle at x,y size 0.12 front 

set label 1 "$\\mathbf{r}_m$" at (x)/2,(y+y1)/2.0 center offset +1.5,0 rotate by 90.0
set arrow 1 filled from 0,y1 to x,y front 

set label 2 "$\\mathbf{r}_\\mathrm{K}$" at 0,(y0+y1)/2.0 center offset -1.5,0.8 rotate by 90.0
set arrow 2 filled from 0,y0 to 0,y1 front

set label 3 "$\\mathbf{r}_m+\\mathbf{r}_\\mathrm{K}$" at (x)/2,(y)/2.0 center offset 0.8,-1.2 rotate by 45.0
set arrow 3 filled from 0,y0 to x,y front 

set label 4 "$\\mathbf{\\hat{z}}_m$" at -x*a,y1+a*(y1-y) center offset -0.8,0.8 rotate by 90.0
set arrow 4 filled from 0,y1 to -x*a,y1+a*(y1-y) front ls 8


set label 5 "$\\mathbf{\\hat{z}}$" at 0,y1+r center offset 0,0.7 rotate by 90.0
set arrow 5 filled from 0,y1 to 0,y1+r front


plot [0:pi] cos(t), -sin(t) notitle ls 1,\
	cos(t), 0.5*sin(t)+sin(t)*(1.5*abs(t-pi/2.0)**2-abs(t-pi/2.0)**3) notitle ls 1,\
	b*sin(2*t)*cos(2*t),b*cos(2*t)**1.3+y1  notitle ls 1,\
	b*sin(2*t)*cos(2*t),-b*cos(2*t)**1.3+y1  notitle ls 1,\
	(b*sin(2*t)*cos(2*t)*cos(theta)-b*cos(2*t)**1.3*sin(theta)), (b*sin(2*t)*cos(2*t)*sin(theta)+b*cos(2*t)**1.3*cos(theta))+y1 notitle ls 8,\
	-(b*sin(2*t)*cos(2*t)*cos(theta)-b*cos(2*t)**1.3*sin(theta)), -(b*sin(2*t)*cos(2*t)*sin(theta)+b*cos(2*t)**1.3*cos(theta))+y1 notitle ls 8


#theta2 = pi*0.5
#rep (b*sin(2*t)*cos(2*t)*cos(theta2)-b*cos(2*t)**1.3*sin(theta2)), (b*sin(2*t)*cos(2*t)*sin(theta2)+b*cos(2*t)**1.3*cos(theta2))+y1 notitle ls 8
#rep -(b*sin(2*t)*cos(2*t)*cos(theta2)-b*cos(2*t)**1.3*sin(theta2)), -(b*sin(2*t)*cos(2*t)*sin(theta2)+b*cos(2*t)**1.3*cos(theta2))+y1 notitle ls 8 






