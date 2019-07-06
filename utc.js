const http = require("http");
var exec = require("child_process").exec;
var child;

http.get("http://worldclockapi.com/api/json/utc/now", resp => {
	let data = "";
	resp.on("data", chunk => {
		data += chunk;
	});

	resp.on("end", () => {
		var date = JSON.parse(data);
		child = exec(`mkdir ${date.currentDateTime}`, function(error, stdout, stderr) {
		console.log("stdout: " + stdout);
		console.log("stderr: " + stderr);
		if(error !== null) {
			console.log("Execution Error: " + error)
		}
});
	});
}).on("error", err => {
	console.log("error: " + err.message);
});
	

