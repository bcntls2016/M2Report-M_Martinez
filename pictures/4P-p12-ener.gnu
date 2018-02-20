
file="4P-p12-energy.tex"

#set lmargin at screen 0.2
set rmargin at screen 0.95
set bmargin at screen 0.15
set tmargin at screen 1.0

set t epslatex size 3.3, 2.0 color colortext linewidth 1.0
set o file

### LINE STYLES ########################################################

# Definitions de largeur utiles
lw1=5.0 
lw2=1.0

# Traits annexes
set style line 1 lt rgb "black" lw lw2
set style line 2 lt rgb "black" lw lw2 dt 8

# Couleur pour plot
set style line 3 lt rgb "black" lw lw1 		#3: black
set style line 4 lt rgb "#FF4500" lw lw1 	#4: red
set style line 5 lt rgb "#9ACD32" lw lw1 	#5: green pastel
set style line 6 lt rgb "#4682B4" lw lw1 	#6: bleue
set style line 7 lt rgb "#CD853F" lw lw1 	#7: marron
set style line 8 lt rgb "#FFA500" lw lw1 	#8: jaune
set style line 9 lt rgb "#A0522D" lw lw1 	#9: dark marron

### PLOTS ##############################################################

# Axis/title
set xlabel "Time (ps)" offset 0,0.2
set ylabel "Impurity energy (K)"
set xrange [0:6]
set yrange [-60:-25]
#set key samplen 0.6
#set key vert
#set key at 6.8,0.5 center right box opaque width -13.0 #Legend
#set key t r
set grid lt 0 lc rgb "#808080" lw 0.5
set xtics 1 nomirror
set ytics 5 nomirror


plot "ener.dat" u ($1*4*0.0001):2 w l ls 4 notitle

