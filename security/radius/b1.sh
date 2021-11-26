#/bin/bash
cat $hostname | grep -E 'interface|mode trunk|mode access' | tee $hostname1
sed -i "s/interface/  - IntName:/g" $hostname1
sed -i "s/ switchport mode access/    IntTrunk: false/g" $hostname1
sed -i "s/ switchport mode trunk/    IntTrunk: true/g" $hostname1
sed -i '/Vlan/d' $hostname1
#cat $hostname1 >> $hostname2
cat $hostname1 | grep -B 1 'IntTrunk' | tee $hostname2
sed -i '/\-\-/d' $hostname2
sed -i '1iSwInterfaces:' $hostname2
sed -i '1i---' $hostname2
