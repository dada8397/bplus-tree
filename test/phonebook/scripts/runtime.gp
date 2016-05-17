reset
set ylabel 'time(sec)'
set style fill solid
set key center top
set title ' '
set term png enhanced font 'Verdana,10'
set output 'runtime.png'

bm = 0.15
lm = 0.12
rm = 0.95
gap = 0.03
size = 0.75
kk = 0.5 # relative height of bottom plot
y1 = 0.0; y2 = 0.5; y3 = 0.5; y4 = 20.0

set multiplot
set border 1+2+8
set xtics nomirror
set ytics nomirror
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
set tmargin at screen bm + size * kk
set yrange [y1:y2]

plot 'output.txt' using 2:xtic(1) with histogram title '', \
'' using 3:xtic(1) with histogram title ''  , \
'' using 4:xtic(1) with histogram title ''  , \
'' using 5:xtic(1) with histogram title ''  , \
'' using 6:xtic(1) with histogram title ''  , \
'' using 7:xtic(1) with histogram title ''  , \
'' using 8:xtic(1) with histogram title ''  , \
'' using ($0-0.1):(0.2):2 with labels title ' ' textcolor lt 1, \
'' using ($0-0.1):(0.25):3 with labels title ' ' textcolor lt 2, \
'' using ($0-0.1):(0.3):4 with labels title ' ' textcolor lt 3, \
'' using ($0-0.1):(0.35):5 with labels title ' ' textcolor lt 4, \
'' using ($0-0.1):(0.4):6 with labels title ' ' textcolor lt 5

unset xtics
unset xlabel
set title 'perfomance comparison'
set border 2+4+8
set bmargin at screen bm + size * kk + gap
set tmargin at screen bm + size + gap
set yrange [y3:y4]

plot 'output.txt' using 2:xtic(1) with histogram title 'original', \
'' using 3:xtic(1) with histogram title 'optimized'  , \
'' using 4:xtic(1) with histogram title 'hashfunction'  , \
'' using 5:xtic(1) with histogram title 'trie'  , \
'' using 6:xtic(1) with histogram title 'rbtree'  , \
'' using 7:xtic(1) with histogram title 'bptree'  , \
'' using 8:xtic(1) with histogram title 'bptree\_bulk'  , \
'' using ($0-0.1):($7+1):7 with labels title ' ' textcolor lt 6 , \
'' using ($0-0.1):($8+3):8 with labels title ' ' textcolor lt 7
