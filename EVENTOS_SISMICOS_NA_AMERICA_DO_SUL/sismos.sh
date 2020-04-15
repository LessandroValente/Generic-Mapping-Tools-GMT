#!/bin/bash


############################################ DADOS (VARIÁVEIS)#####################
reg="-Rg-86.016/-31.903/-37.153/06.355"
pro="-JM15"
tick="-Bxa10 -Bya10 -BWeSn"
mapa="sismos.ps"
mapapng='mapa.png'
seis_data=DADOS.dat
topo="tut_relief_01m.nc"
topo2='tut_relief_05m.nc'

################## PLOTAGEM DO MAPA ###############################################


grdcut @earth_relief_01m $reg -Gtut_relief_01m.nc #RECORTANDO O GRID DE 01 MINUTO-ARCO DE TOPOGRÁFIA PARA ÁREA DO MAPA

grdimage $topo $pro $reg -Xc -Yc -Cmby.cpt -K > $mapa #APLICANDO O GRID DE TOPOGRÁFIA COM A PELETA DE COR cby.cpt

pscoast $pro $reg -Tf-37:40:00/00:70:00/1/3 --FONT=8p,Helvetica-Bold,black -Df -W.2p -N1/.5p -K -O >> $mapa #APLICANDO NORTE, FONTE DA LETRA E LIMITES DOS PAÍSES

psbasemap $reg $pro $tick -Lf-81/-34/00/1000+lkm -O -K >> $mapa #APLICANDO ESCALA

psbasemap $reg $pro -B+t'OCORRÊNCIAS DE SISMOS de 2018-03-17 até 2019-07-21' --FONT=14p,Helvetica-Bold,black -O -K >> $mapa #TITULO


makecpt -Crainbow -T0/500/10 -Z > seis.cpt #CRIANDO ESCALA DE CORES DO DEPTH

awk '{print($2,$1,$3)}' $seis_data | psxy $reg $pro -O -K -W0.1 -Sc.1 -Cseis.cpt -h15 >> $mapa #ESCOLHENDO COLUNAS ESPECIFICAS PARA PLOTAGEM DOS SISMOS NO ARQUIVO DADOS.txt

psscale -D0.5/5/5/.5 -B100:Depth:/:km: -Cseis.cpt -O -K >> $mapa #ESCALA DO DEPTH

#psxy brasil.gmt $reg $pro -O -K >> $mapa #PARA APLICAR OS LIMITES ESTADUAIS, DESCOMENTE ESSA LINHA

########################################## PLOTAGEM DO GLOBO #######################

latitude=-20
longitude=-54
altitude=4000.0
tilt=0
azimuth=0
twist=0
width=0.0
heigth=0.0

proj=-JG${longitude}/${latitude}/${altitude}/${azimuth}/${tilt}/${twist}/${width}/${heigth}/1.5i



grdcut @earth_relief_05m -Rg -G$topo2 #RECORTANDO O GRID DE 05 MINUTO-ARCO DE TOPOGRÁFIA PARA ÁREA DO MAPA

grdimage $topo2 -Rg $proj -X11.5c -Y-1c -Bag20 -Cmby.cpt -O -K >> $mapa #APLICANDO O GRID DE TOPOGRÁFIA NO GLOBO COM A PELETA DE COR cby.cpt

pscoast -Rg $proj -N1/.2p -Df -O -K >> $mapa #APLICANDO LIMITES DOS PAÍSES

pstext -Rg $proj -N --FONT=8.5p,Helvetica-Bold,black -O << EOF >> $mapa #PLOTANDO A PALAVRA BRASIL NO GLOBO

-53 -5 BRASIL 

EOF

psconvert $mapa -Tg -A.5 #CONVERTENDO O MAPA PARA PNG E RECORTANDO-O COM UMA MARGEM DE 0.5 cm

evince $mapa #MOSTRANDO O MAPA






















