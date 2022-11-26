/**
 * 
 */
function checkRental(){
    const log = document.getElementById('log').value;
    const check = document.getElementById('check');
    
    console.log(check.value);
    console.log("log" +log);
    
    const startDate = $('#startDate').val();
    const endDate = $('#endDate').val();
    const animal = $('input:radio[name=animal]:checked').val();
    
    if(startDate === "")
    	alert("시작 날짜 미지정");
    
    else if(endDate === "")
    	alert("종료 날짜 미지정");
    
   else if(animal === undefined)
   		alert("애완동물 탑승 여부 미체크");
   
   else{
	    if (check.value === true){
	    	alert("이미 예약이 잡힌 날짜입니다. 다른 날짜 또는 다른 차량을 선택해주시기 바랍니다.");
	    } 
	    else {
			const carName = $('#carName').val();
		    const startDate = $('#startDate').val();
		    const endDate = $('#endDate').val();
		    const carPrice = $('#carPrice').val();
		    const animal = $('input:radio[name=animal]:checked').val();
		    location.href= `rentCheck.jsp?startDate=` + startDate + `&endDate=` + endDate + `&carName=` 
		           + carName + `&carPrice=` + carPrice +`&animal=` + animal;
	 	}
   }
}

var now_utc = Date.now();
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("startDate").setAttribute("min", today);

var now_utc = Date.now();
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("endDate").setAttribute("min", today);

const menus = document.querySelector('.menus');

// 1. 조상 요소로부터 버튼에게 이벤트 위임
menus.addEventListener('click', function(e) {
  e.preventDefault();
  const curTarget = e.target;
  if (!curTarget.classList.contains('btn')) return;

// 2. 버튼의 해당 섹션 id값을 가져와 일치하는 DOM 요소를 변수 할당
  const currentSection = document.querySelector(`#${curTarget.dataset.sec}`);

  // 3. 원하는 위치로 스크롤링
  window.scrollTo({
    top: currentSection.getBoundingClientRect().top + window.pageYOffset,
    behavior: 'smooth',
  })  
})