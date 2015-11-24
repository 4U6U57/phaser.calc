#!/bin/bash

prompt="[$USER@$0]:"
pi=$(echo "scale=10; 4*a(1)" | bc -l)

echo -n $prompt
while read -r line; do
  set -- $line

  case $1 in
    rp | p)
      echo "Rect -> Polar"
      real=$2
      imag=$3
      echo "Input: $real + j$imag"
      rad=$(echo "scale=3; sqrt(($real^2)+($imag^2))" | bc -l)
      theta=$(echo "scale=3; (a($imag/$real)/$pi)*180" | bc -l)
      echo "Output: $rad ∠ $theta"
      ;;
    pr | r)
      echo "Polar -> Rect"
      rad=$2
      theta=$3
      echo "Input: $rad ∠ $theta"
      real=$(echo "scale=3; $rad*(c(($theta*$pi)/180))" | bc -l)
      imag=$(echo "scale=3; $rad*(s(($theta*$pi)/180))" | bc -l)
      echo "Output: $real + j$imag"
      ;;
    pmult)
      echo "Polar * Polar"
      rad1=$2
      theta1=$3
      rad2=$4
      theta2=$5
      echo "Input1: $rad1 ∠ $theta1 * $rad2 ∠ $theta2"
      rad=$(echo "scale=3; $rad1*$rad2" | bc -l)
      theta=$(echo "scale=3; $theta1+($theta2)" | bc -l)
      echo "Output: $rad ∠ $theta"
      ;;
    pdiv)
      echo "Polar / Polar"
      rad1=$2
      theta1=$3
      rad2=$4
      theta2=$5
      echo "Input: $rad1 ∠ $theta1 / $rad2 ∠ $theta2"
      rad=$(echo "scale=3; $rad1/$rad2" | bc -l)
      theta=$(echo "scale=3; $theta1-($theta2)" | bc -l)
      echo "Output: $rad ∠ $theta"
      ;;
    rplus)
      echo "Rect + Rect"
      real1=$2
      imag1=$3
      real2=$4
      imag2=$5
      echo "Input1: $real1 + j$imag1 + $real2 + j$imag2"
      real=$(echo "scale=3; $real1+$real2" | bc -l)
      imag=$(echo "scale=3; $imag1+$imag2" | bc -l)
      echo "Output: $real + j$imag"
      ;;
    rminus)
      echo "Rect - Rect"
      real1=$2
      imag1=$3
      real2=$4
      imag2=$5
      echo "Input1: $real1 + j$imag1 - $real2 - j$imag2"
      real=$(echo "scale=3; $real1-$real2" | bc -l)
      imag=$(echo "scale=3; $imag1-$imag2" | bc -l)
      echo "Output: $real + j$imag"
      ;;
    edit)
      vi $0
      ;;
    e | exit)
      break
      ;;
    h | help)
      echo "Usage: opcode [arg arg]"
      echo "Supported operations"
      echo "rp real imag > rad theta"
      echo "pr rad theta > real imag"
      echo "px,p/ rad1 theta1 rad2 theta2 > rad theta"
      echo "r+,r- real1 imag1 real2 imag2 > real imag"
      ;;
    *)
      echo "Unsupported operation"
      ;;
  esac
  echo -n $prompt
done
