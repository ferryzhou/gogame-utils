set -e

gnugo="gnugo --mode gtp"
dfgo="th /home/ferryzhou/Projects/darkforestGo/cnnPlayerV2/cnnPlayerMCTSV2.lua --use_formal_params --time_limit 1 --win_rate_thres 0.3"

twogtp=/home/ferryzhou/Downloads/gogui-1.4.9/lib/gogui-twogtp.jar

# play(black, white, prefix)
function play() {
  echo "white: $1"
  echo "black: $2"
  prefix=records/$(date +"%Y-%m-%d_%H-%M-%S")_$3
  java -jar $twogtp \
    -komi 6.5 -size 19 -black "$1" -white "$2" -time 1m \
    -alternate -games 2 -auto -threads 1 -verbose \
    -sgffile $prefix
  java -jar $twogtp -analyze $prefix.dat
}

#play "$gnugo"  "$gnugo" "gnugo-gnugo"
play "$gnugo"  "$dfgo" "gnugo-dfgo"
