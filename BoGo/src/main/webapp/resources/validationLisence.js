/**
 * 
 */

function checkLisence(){
	const path01 = $("input#path01").val();
	const path02 = $("input#path02").val();
	const path03 = $("input#path03").val();
	const path04 = $("input#path04").val();
	const path05 = $("input#path05").val();
	const path06 = $("input#path06").val();
	
	const data = {
		"path01" : path01,
		"path02" : path02,
		"path03" : path03,
		"path04" : path04,
		"path05" : path05,
		"path06" : path06
	};
	
	reqCheck(data);
}

function reqCheck(data) {
	/*
	$.ajax({
		// url : `https://api.goodapi.co.kr/DriverLicense/${data.path01}/${data.path02}/${data.path03}/${data.path04}/${data.path05}/${data.path06}?type=json&sessionID=test`,
		url : `http://ds.gscms.co.kr:8888/Rest/DriverLicense/${data.path01}/${data.path02}/${data.path03}/${data.path04}/${data.path05}/${data.path06}?type=json&sessionID=test`,
		method : "GET",
		success : function(msg){
			console.log("success msg : ", msg);
		},
		error : function(msg){
			console.error("fail msg : ", msg);
		}
	});
	*/
	
	$.ajax({
		// url : "https://api.goodapi.co.kr/DriverLicense?type=json&sessionID=test",
		url : `http://ds.gscms.co.kr:8888/Rest/DriverLicense?type=json&sessionID=test`,
		method : "POST",
		dataType : "json",
		contentType : "application/json",
		data : JSON.stringify(data)
	})
	.done(response => {
		console.log("success msg : ", response);
	})
	.fail(error => {
		console.error("fail msg : ", error);
	});
}