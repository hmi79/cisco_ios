#/bin/bash
cat $invname | grep -E 'interface|mode trunk|mode access' | tee $invname
sed -i "s/interface/  - IntName:/g" $invname
sed -i "s/ switchport mode access/    IntTrunk: false/g" $invname
sed -i "s/ switchport mode trunk/    IntTrunk: true/g" $invname
sed -i '/Vlan/d' $invname
cat $invname | grep -B 1 'IntTrunk' | tee $invname2
sed -i '1iSwInterfaces:' $invname2
sed -i '1i---' $invname2
