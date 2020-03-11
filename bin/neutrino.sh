#!/bin/sh

BASENAME=sample1
PITCH=1.0
FORMANT=1.0
MODEL=KIRITAN

while getopts n:p:f:m:s: OPT
do
  case $OPT in
    "n" )
      BASENAME=$OPTARG
      ;;
    "p" )
      case $OPTARG in
        -12) PITCH=0.5000000000 ;;
        -11) PITCH=0.5297315471 ;;
        -10) PITCH=0.5612310241 ;;
        -9) PITCH=0.5946035575 ;;
        -8) PITCH=0.6299605249 ;;
        -7) PITCH=0.6674199270 ;;
        -6) PITCH=0.7071067811 ;;
        -5) PITCH=0.7491535384 ;;
        -4) PITCH=0.7937005259 ;;
        -3) PITCH=0.8408964152 ;;
        -2) PITCH=0.8908987181 ;;
        -1) PITCH=0.9438743126 ;;
        0) PITCH=1.0000000000 ;;
        1) PITCH=1.0594630943 ;;
        2) PITCH=1.1224620483 ;;
        3) PITCH=1.1892071150 ;;
        4) PITCH=1.2599210498 ;;
        5) PITCH=1.3348398541 ;;
        6) PITCH=1.4142135623 ;;
        7) PITCH=1.4983070768 ;;
        8) PITCH=1.5874010519 ;;
        9) PITCH=1.6817928305 ;;
        10) PITCH=1.7817974362 ;;
        11) PITCH=1.8877486253 ;;
        12) PITCH=2.0000000000 ;;
        *) PITCH=$OPTARG ;;
      esac
      ;;
    "m" )
      MODEL=$OPTARG
      ;;
    "s" )
      SKIP=$OPTARG
      ;;
    "f" )
      FORMANT=$OPTARG
      ;;
  esac
done

echo "BASENAME: ${BASENAME}"
echo "PitchShift: ${PITCH}"
echo "FormantShift: ${FORMANT}"
echo "ModelDir: ${MODEL}"
echo "SKIP: ${SKIP}"

if [ "${SKIP}" != "run" ]; then
  sed -e "s/BASENAME=.*/BASENAME=${BASENAME}/g" ./NEUTRINO/Run.sh | \
    sed -e "s/PitchShift=.*/PitchShift=${PITCH}/g" | \
    sed -e "s/ModelDir=.*/ModelDir=${MODEL}/g" | \
    sed -e "s/FormantShift=.*/FormantShift=${FORMANT}/g" > \
    ./NEUTRINO/Custom.sh
  chmod u+x ./NEUTRINO/Custom.sh

  docker run --rm -v $PWD:/app -w /app/NEUTRINO neutrino ./Custom.sh
fi

if [ "${SKIP}" != "play" ]; then
  afplay ./NEUTRINO/output/${BASENAME}_syn.wav
fi
