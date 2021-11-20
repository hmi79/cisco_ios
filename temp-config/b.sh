#/bin/bash
cat $hostname | grep -E 'interface|mode trunk|mode access' | tee $hostname
sed -i "s/interface/  - IntName:/g" $hostname
sed -i "s/ switchport mode access/    IntTrunk: false/g" $hostname
sed -i "s/ switchport mode trunk/    IntTrunk: true/g" $hostname
sed -i '/Vlan/d' $hostname
#cat $hostname >> $hostname2
cat $hostname | grep -B 1 'IntTrunk' | tee $hostname2
sed -i '1iSwInterfaces:' $hostname2
sed -i '1i---' $hostname2
