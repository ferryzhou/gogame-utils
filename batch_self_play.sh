set -e

gnugo="gnugo --mode gtp"
dfgo="th /home/ferryzhou/Projects/darkforestGo/cnnPlayerV2/cnnPlayerMCTSV2.lua --use_formal_params --time_limit 1 --win_rate_thres 0.3"
pachi="/home/ferryzhou/Projects/pachi/pachi -f /home/ferryzhou/Projects/pachi/book.dat  threads=8,max_tree_size=10000"

twogtp=/home/ferryzhou/Downloads/gogui-1.4.9/lib/gogui-twogtp.jar

# play(black, white, prefix, games, threads)
function play() {
  echo "white: $1"
  echo "black: $2"
  prefix=records/$(date +"%Y-%m-%d_%H-%M-%S")_$3
  # for dfgo, only one thread can be used and only 19x19 is accepted.
  java -jar $twogtp \
    -komi 6.5 -size 19 -black "$1" -white "$2" -time 5m \
    -alternate -games $4 -auto -threads $5 -verbose \
    -debugtocomment \
    -sgffile $prefix
  java -jar $twogtp -analyze $prefix.dat
}

#play "$gnugo"  "$gnugo" "gnugo-gnugo" 2 6
#play "$gnugo"  "$dfgo" "gnugo-dfgo" 2 1
play "$gnugo"  "$pachi" "gnugo-pachi" 6 6
