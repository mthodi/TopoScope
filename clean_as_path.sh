#!/bin/bash


# This script is used to clean the AS path of the BGP update messages.
# It cleans the AS Paths that were prepended with 100 200 300 ... 900

#sed -i.bak 's/100|200|300|400|500|600|700|800|900|//g' africa_rib.txt
#
#sed -i.bak2 's/100|200|300|400|500|600|//g' africa_rib.txt
#
#sed -i.bak3 's/100|200|300|400|//g' africa_rib.txt

sed -i 's/36913|100|37294/36913|37294/g' africa_rib.txt