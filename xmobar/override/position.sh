#!/bin/sh
readonly DEFAULT='TopSize C 100 40'
cat - | sed "s/\(position = \).*$/\1${DEFAULT}/"
