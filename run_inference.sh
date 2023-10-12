#!/bin/bash

# ===============================================================================
# This script is used to run the inference workflow as described in the README.md
# ================================================================================

# 1. parse BGP paths
echo "[+] Parsing BGP paths..."
python uniquePath.py -i africa_rib.txt -p peeringdb_2_dump_2023_10_09.json
printf "[+] Done parsing BGP paths...\n"

# 2. run AS-Rank algorithm to bootstrap the TopoScope algorithm
printf "[+] Running AS-Rank algorithm..."
perl asrank.pl aspaths.txt > asrel.txt
printf "[+] Done Bootstrapping with AS-Rank algorithm...\n"

# 3. run TopoScope algorithm
printf "[+] Running TopoScope algorithm..\n"
python3 toposcope.py -o as2org_oct_2023.txt -p peeringdb_2_dump_2023_10_09.json -d tmp/
printf ">>> Finished.\n"