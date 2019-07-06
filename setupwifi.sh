
local="/etc/systemd/system/rc-local.service"

echo "[Unit]" >> $local
echo " Description=/etc/rc.local Compatibility" >> $local
echo " ConditionPathExists=/etc/rc.local" >> $local

echo "[Service]" >> $local
echo " Type=forking" >> $local
echo " ExecStart=/etc/rc.local start" >> $local
echo " TimeoutSec=0" >> $local
echo " StandardOutput=tty" >> $local
echo " RemainAfterExit=yes" >> $local
echo " SysVStartPriority=99" >> $local

echo "[Install]" >> $local
echo " WantedBy=multi-user.target" >> $local

cd /etc
cp rc.local temp.local
> rc.local
sed '$d' temp.local > rc.local
rm -f temp.local

echo "(sleep 60; ifup wlan0) &" >> rc.local

echo "(sleep 60) &" >> rc.local


echo "exit 0" >> rc.local

cd /root/simple
> testNode.js


echo "const http = require('http');" >> testNode.js
echo "var exec = require('child_process').exec;" >> testNode.js
echo "var child;" >> testNode.js
echo "" >> testNode.js
echo "http.get('http://worldclockapi.com/api/json/utc/now', resp => {" >> testNode.js
echo "	let data = '';" >> testNode.js
echo "	resp.on('data', chunk => {" >> testNode.js
echo "		data += chunk;" >> testNode.js
echo "	});" >> testNode.js
echo "" >> testNode.js
echo "	resp.on('end', () => {" >> testNode.js
echo "		var date = JSON.parse(data);" >> testNode.js
echo "		child = exec('date --set '+date.currentDateTime, function(error, stdout, stderr) {" >> testNode.js
echo "		console.log('stdout: ' + stdout);" >> testNode.js
echo "		console.log('stderr: ' + stderr);" >> testNode.js
echo "		if(error !== null) {" >> testNode.js
echo "			console.log('Execution Error: ' + error)" >> testNode.js
echo "		}" >> testNode.js
echo "});" >> testNode.js
echo "	});" >> testNode.js
echo "}).on('error', err => {" >> testNode.js
echo "	console.log('error: ' + err.message);" >> testNode.js
echo "});" >> testNode.js







