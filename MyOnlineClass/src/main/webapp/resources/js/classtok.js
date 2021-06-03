function getContextPath() {
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
	
$(function() {
	var contextPath = getContextPath();
	var sourcePath = contextPath + "/autoComplete";
	var urlPath = contextPath + "/search/";
	$( "#searchKeyNav, #searchKeyBody" ).autocomplete({
		source: sourcePath,
        delay: 200,
        select: function(event, ui) {
        	var url = urlPath;
        	window.location.href = url + JSON.stringify(ui.item.value).replace(/\"/gi, "");
        }
      });
   });

	function searchNav() {
		var contextPath = getContextPath();
		var urlPath = contextPath + "/search/";
		
		var searchKeyNav = document.getElementById("searchKeyNav").value;
		var url = urlPath;
		location.href = url + searchKeyNav;
	}
	
	function searchBody() {
		var contextPath = getContextPath();
		var urlPath = contextPath + "/search/";
	
		var searchKeyBody = document.getElementById("searchKeyBody").value;
		var url = urlPath;
		location.href = url + searchKeyBody;
	}

	function categorySearch(category) {
		var contextPath = getContextPath();
		var urlPath = contextPath + "/search/";
	
		var url = urlPath;
		location.href = url + category;
	}

    $(function() {
    	$('#MOVE_TOP_BTN').show();
    	$('#KAKAO_BTN').show();
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        
        $("#KAKAO_BTN").click(function() {
            window.open('https://open.kakao.com/o/sxy0MCgd', '_blank');
        });
    });

	$(document).ready(function() {
		var id = $('#id').val();
		$.ajax({
			type: "POST",
			url: "getInstFlag",
			data: {id : id},
			success: function(data) {
				nickname = data['nickname'];
				
				if (!id) {
					$('.textSwitch').text('');
				}
				else {
					if (!nickname) {
						$('.textSwitch').text('강사 신청');
						$('.linkSwitch').attr("href", 'open');
					} else {
						$('.textSwitch').text('클래스 개설');
						$('.linkSwitch').attr("href", 'enroll');
					}
				}
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log("실패");
			}
		});
	});