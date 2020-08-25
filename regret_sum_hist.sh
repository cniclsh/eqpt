#!/bin/bash
set -euo pipefail
trap "echo 'Script failed'" ERR
IFS=$'\n\t'

log=$1
egrep 'RegretSum' $1 | awk -F ' ' '{print $2, $3}' > temp.csv
python -c '
import pandas as pd;
import matplotlib.pyplot as plt;
df = pd.read_csv("./temp.csv", delimiter=" ");
plt.hist(df.sum(1), bins=100);
plt.show()'
