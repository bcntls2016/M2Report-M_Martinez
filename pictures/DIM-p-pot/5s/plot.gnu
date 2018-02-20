E0_cm = 21026.551
cm2K = 1.4387752
E0_K = E0_cm*cm2K

Eref2=5391.624284

Eref=5395.87

#Eref+E0_K+Als_K

# Axis/title

set t epslatex standalone size 10.0,14.0 dashed color colortext linewidth 3
set o "plot.tex"

bm = 0.05
lm = 0.08
rm = 0.95
gap = 0.01
size = 0.90
xmin=-2
xmax=120
y1 = -20 ; y2 = 20; y3 = E0_K-10; y4 = 31300

set multiplot
set xlabel "Position (\\AA)"
set border 1+2+8
set xtics nomirror 10
set ytics 15 nomirror
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
set tmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) )

set yrange [y1:y2]
set xrange [-10:10]
plot [xmin:xmax] "4s.dat" using ($1):($2+Eref2) w l lt rgb "blue" notitle
replot E0_K w l lt rgb "black" notitle

unset xtics
unset xlabel
set border 2+4+8
set bmargin at screen bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap
set tmargin at screen bm + size + gap
set yrange [y3:y4]
#set x2tics nomirror

set label "Energy (K)" at screen 0.02, bm + 0.5 * (size + gap) offset 0,-strlen("Energy (K)")/4.0 rotate by 90

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0 to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 nohead

set arrow from screen lm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0  + gap to screen \
lm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 + gap nohead

set arrow from screen rm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0 to screen \
rm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 nohead

set arrow from screen rm - gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1)+abs(y4-y3) ) ) - gap / 4.0  + gap to screen \
rm + gap / 4.0, bm + size * (abs(y2-y1) / (abs(y2-y1) + abs(y4-y3) ) ) + gap / 4.0 + gap nohead

set arrow from first 0,(y3-(y2-y1)-10)  to first 0,y4 nohead lt rgb "black"


set key t r box opaque height 0.3 width 0.3 # Legend

set ytics 25

plot [xmin:xmax] "5s.dat" using ($1):($2+Eref+E0_K) lt rgb "orange" w l title "5s"

replot -120 w l lt rgb "blue" title "4s"

print E0_K
replot E0_K w l lt rgb "black" notitle




unset multiplot

set o
set term qt

