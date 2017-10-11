filename=$1
echo $filename replacing
#sed -i "s/\"\"/\\\\\"/g" $filename
#sed -i "s/\t\\\\\"/\t\"\"/g" $filename
#sed -i "s/\[{/{\"{/g" $filename
#sed -i "s/}\]/}\"}/g" $filename
#sed -i "s/} *, *{/}\",\"{/g" $filename
#awk '$7~/\"\"/{$7="\"{}\""}1' $filename 1<> $filename
echo $filename "replaced sucess!"
