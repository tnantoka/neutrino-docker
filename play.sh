#!/bin/sh

BASENAME=`grep BASENAME ./NEUTRINO/Run.sh | head -1 | awk -F= '{ print $2 }'`
afplay ./NEUTRINO/output/${BASENAME}_syn.wav
