#!/bin/bash
#
gfortran -c -g asa109_prb.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling asa109_prb.f"
  exit
fi
rm compiler.txt
#
gfortran asa109_prb.o -L$HOME/libf77/$ARCH -lasa109
if [ $? -ne 0 ]; then
  echo "Errors linking and loading asa109_prb.o"
  exit
fi
rm asa109_prb.o
#
mv a.out asa109_prb
./asa109_prb > asa109_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running asa109_prb"
  exit
fi
rm asa109_prb
#
echo "Test results written to asa109_prb_output.txt."
