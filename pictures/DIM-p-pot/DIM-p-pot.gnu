# LATEX 
set t epslatex size 6.5,4.0 dashed color colortext linewidth 1
set o "DIM-p-pot.tex"

set key vert
set key at screen 0.90,0.50 center 
#set key box opaque

### SETTINGS ###########################################################

cm2K=1.4387752
Eterm=18738.11796
E1=18682.76319
E2=18765.79534

E0_cm = 12985.185724
cm2K = 1.4387752
E0_K = E0_cm*cm2K
Eref=5391.624284

# margins
bm=0.11
tm=0.01
lm=0.12
rm=0.01

# tambouille pour agrandir le bas, cf 2*1 et 2*2
alpha = 0.2

# gaps
gap_x=0.02
gap_y=0.05

x0 = -7.0

# x-axis
xlab="Distance from equilibrium position (\\AA)"
Xrmin=-2.5
Xrmax=10.5

Xlmin=-6.0
Xlmax=7.0

# left y-axis
ylab="Energy (K)"
# top
Yltmin=18350.0
Yltmax=18850.0
# bot
Ylbmin=-18.0
Ylbmax=2.0

# right y-axis (top is computed to keep aspect ratio)
# bot
Yrbmin=-18.0
Yrbmax=2.0

### STYLE ##############################################################

# Definitions de largeur utiles
lw1=5.0 
lw2=1.0

# Traits annexes
set style line 1 lt rgb "black" lw lw2 
set style line 2 lt rgb "black" lw lw2 dt 6

# Couleur pour plot
set style line 3 lt rgb "black" lw lw1 		#3: black
set style line 4 lt rgb "#FF4500" lw lw1 	#4: red
set style line 5 lt rgb "#9ACD32" lw lw1 	#5: green pastel
set style line 6 lt rgb "#4682B4" lw lw1 	#6: bleue
set style line 7 lt rgb "#CD853F" lw lw1 	#7: marron
set style line 8 lt rgb "#FFA500" lw lw1 	#8: jaune
set style line 9 lt rgb "#A0522D" lw lw1 	#9: dark marron

### CONFIGURATION (DON'T TOUCH) ########################################

# plus facile pour donner les marges
tm=1-tm
rm=1-rm

# keeping ratio aspect between right and left
Yrtmax=Yltmax
Yrtmin = Yrtmax - ((abs(Yltmin-Yltmax)+abs(Ylbmin-Ylbmax))-abs(Yrbmin-Yrbmax))

# ratio de grandeurs en Y

dltY=1-alpha
dlbY=alpha
drtY=1-alpha
drbY=alpha

#dltY=abs(Yltmin-Yltmax)/(abs(Yltmin-Yltmax)+abs(Ylbmin-Ylbmax))
#dlbY=abs(Ylbmin-Ylbmax)/(abs(Yltmin-Yltmax)+abs(Ylbmin-Ylbmax))
#drtY=abs(Yrtmin-Yrtmax)/(abs(Yrtmin-Yrtmax)+abs(Yrbmin-Yrbmax))
#drbY=abs(Yrbmin-Yrbmax)/(abs(Yrtmin-Yrtmax)+abs(Yrbmin-Yrbmax))
size_y=abs(tm-bm)-gap_y
size_x=abs(lm-rm)-gap_x

# dashed lines on axis
set arrow 1 from screen lm,bm to screen lm,tm nohead ls 2
set arrow 2 from screen lm+size_x*0.5,bm to screen lm+size_x*0.5,tm nohead ls 2
set arrow 3 from screen rm-size_x*0.5,bm to screen rm-size_x*0.5,tm nohead ls 2
set arrow 4 from screen rm,bm to screen rm,tm nohead ls 2
set arrow 5 from 0, screen bm to 0, screen tm nohead ls 2
#set object 1 rectangle from -1,18650 to 6,18710

# axis/labels
set xrange [Xlmin:Xlmax]
set xtics nomirror 2.0
set label 1 ylab at screen lm,(bm+(size_y+gap_y)/2.0) offset -(strlen(".Ytmax.")),0 center rotate by 90 enhanced
set label 2 xlab at screen (lm+(size_x+gap_x)/2.0),bm offset 0,-2.2 center enhanced
set ytics nomirror 50

########################################################################

set multiplot layout 2,2

### 1 LEFT #############################################################

set lmargin at screen lm
set rmargin at screen lm+size_x*0.5

### 1.1 TOP.LEFT #######################################################

# settings
set border 2+4+8 #1b+2l+4t+8r
set tmargin at screen tm
set bmargin at screen tm-size_y*dltY

unset xtics
set yrange [Yltmin:Yltmax]

# plot		
plot 	(E1) ls 2 notitle, \
		(E2) ls 2 notitle, \
		"./data/DIMpSO.dat" u ($1+x0):($2*cm2K) ls 4 w l title "$\\Pi_{1/2}$", \
		"./data/DIMpSO.dat" u ($1+x0):($4*cm2K) ls 7 w l title "$\\Pi_{3/2}$", \
		"./data/DIMpSO.dat" u ($1+x0):($6*cm2K) ls 8 w l title "$\\Sigma_{1/2}$", \
		1 ls 6 title "4s"
		
		set key off
		
unset label 1 #avoid x-th plot of ylabel
unset label 2 #avoid x-th plot of ylabel
#unset object 1
			 
### 1.2 BOT.LEFT #######################################################

# settingss
set border 1+2+8 #1b+2l+4t+8r
set tmargin at screen bm+size_y*dlbY
set bmargin at screen bm
set xtics nomirror 2.0
set ytics nomirror 5.0
set yrange [Ylbmin:Ylbmax]

# plot
plot 	0 ls 2 notitle, \
		"./data/K_4s.dat" u ($1+x0):($1+x0 > -0.5 ? $2 : 1/0) ls 6 w l notitle,\
		"./data/K_4s.dat" u ($1+x0):($1+x0 < -0.0 ? $2 : 1/0) ls 6 dt 3 w l notitle

### 2 RIGHT ############################################################

set lmargin at screen rm-size_x*0.5
set rmargin at screen rm
unset ytics
set xrange [Xrmin:Xrmax]

### 2.1 TOP.RIGHT ######################################################

# settings
set border 2+4+8
set tmargin at screen tm
set bmargin at screen tm-size_y*drtY

unset xtics
set yrange [Yrtmin:Yrtmax]

dx = 0.5
lx = 1.5

# plot
plot 	(E1) ls 2 notitle, \
		(E2) ls 2 notitle, \
		"./data/Pi_1_2.dat" u 1:($2+Eterm+Eref) ls 4 w l title "$\\Pi_{1/2}$",\
		"./data/Pi_3_2.dat" u 1:($2+Eterm+Eref) ls 7 w l title "$\\Pi_{3/2}$",\
		"./data/Sigma_1_2.dat" u 1:($2+Eterm+Eref) ls 8 w l title "$\\Sigma_{1/2}$", \
		1 ls 6 title "4s"
					 
### 2.2 BOT.RIGHT ######################################################

# settingss
set border 1+2+8
set tmargin at screen bm+size_y*drbY
set bmargin at screen bm
set xtics nomirror
set yrange [Yrbmin:Yrbmax]

# plot
plot 	0 ls 2 notitle, \
		"./data/4s.dat" u 1:($1 > -1.0 ? $2+Eref : 1/0) ls 6 w l notitle,\
		"./data/4s.dat" u 1:($1 < -0.5 ? $2+Eref : 1/0) ls 6 dt 3 w l notitle

########################################################################

unset multiplot

########################################################################

#pause -1

set output


