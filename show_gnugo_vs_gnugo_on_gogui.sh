# First download gogui and install gnugo.
# This script run gnugo vs gnugo on gogui.

BLACK="gnugo --mode gtp"

WHITE="gnugo --mode gtp"

TWOGTP="java -jar /home/ferryzhou/Downloads/gogui-1.4.9/lib/gogui-twogtp.jar -komi 6.5 -size 19 -black \"$BLACK\" -white \"$WHITE\" -time 5m -verbose -alternate -games 2 -sgffile gnugo-gnugo.sgf"

java -jar /home/ferryzhou/Downloads/gogui-1.4.9/lib/gogui.jar -komi 6.5 -time 5 -computer-both -auto -program "$TWOGTP"
