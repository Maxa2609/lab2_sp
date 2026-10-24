#!/bin/bash
EV=power/energy-pkg/,power/energy-cores/,power/energy-ram/,power/energy-psys/
echo "Do not touch the laptop. Start in 10 seconds"
sleep 10
perf stat -a -e $EV -r 5 sleep 5 2> energy_idle.txt
perf stat -a -e $EV -r 5 ./mm0 2> energy_mm0.txt
perf stat -a -e $EV -r 20 ./mm3 2> energy_mm3.txt
echo "DONE"
