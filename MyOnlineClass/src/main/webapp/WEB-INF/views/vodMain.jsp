<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <c:import url="header3.jsp"></c:import>

<c:set var="lecture" value="${lectureDTO}" />
<c:set var="instructor" value="${instructorDTO}" />
<c:set var="isInstructor" value="${isInstructor}" />
<c:set var="isVodList" value="${isVodList}" />

<%@include file="header3.jsp" %>
<%
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link href="https://vjs.zencdn.net/7.6.0/video-js.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/video.css">
	<script src='${pageContext.request.contextPath}/resources/js/handlebars-v4.1.2.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js'></script>
	
	<script>
		
	
		var getVideoData = function () {
			
		return new Promise(function (resolve, reject) {
			
		    console.log(${jsonList});
			var videoData = ${jsonList};
			resolve(videoData);
		})
		}
		
		
			
		var delete_id = 0;
		
		function reply_click(clicked_id){
			delete_id = clicked_id;
			alert(clicked_id);
		}
		
		
		
		function delBtn(lecture_id){
			alert(delete_id)
			alert('이제 삭제 가능')	
			
			
			$.ajax({
					type: "POST",
					url: "vodDelete",
					data: {
						
						lecture_no : lecture_id,
						del_no : delete_id}
						,
					dataType: "json",
					success : function(data) {

						var html = "";

						if (data.length > 0) {
							
							for (i = 0; i < data.length; i++) {
								var myvod = data[i];
								console.log(myvod.id);
								console.log(${myvod.id});
								
								//console.log(data[i].id);
								html += "<li class='video__items complate' data-idx="+myvod.id+ " id="+myvod.id+" onclick='reply_click(this.id)''>";
								html += "<span class='video__items-tit'> "+ myvod.id +"." + myvod.title + "</span>";
								html += "<span class='video__player-icon'>";
								html += "<svg width='18' aria-hidden='true' data-prefix='fal' data-icon='play-circle' class='svg-inline--fa fa-play-circle fa-w-16' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'><path fill='currentColor' d='M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z'></path>";
								
								
								html += "</svg>";
								html +=	"<span class='video__player-time'> " + myvod.time + "</span>";
								
								
								html +=	"</span> ";
								html +=	"</li> ";
								
								}
							}
						$(".video__menu").html(html);
					},
					
					error : function() {
						alert('실패');
					}
				});
		}
			function delLecture(lecture_id){
				console.log(lecture_id)
				alert(lecture_id)
				alert('이제 삭제 가능')	
				
				
				$.ajax({
						type: "POST",
						url: "lectureDelete",
						data: {
							lecture_no : lecture_id,
							}
							,
						dataType: "json",
						success : function(data) {
								alert('성공');
						},
						
						error : function() {
							alert('실패');
						}
					});
			
			}
		
	</script>
	
	
</head>
<body>
	
	<h2>${lecture.name}</h2>
	<p>${instructor.nickname} 강사님</p>
	
	<div class="video__wrap">
		<div class="video__contents">
			<div class="video__box">
				<!-- <p class="video__tit"></p> -->
				<div class="video__inner-box">
					
   					<video 
							id="my-video" 
							class="video-js vjs-big-play-centered vjs-fluid" 
							controls 
							preload="auto" 
							width="640" 
							height="268" 
							poster="${pageContext.request.contextPath}/lectureThumbnail?name=${lecture.name}&thumbnail=${lecture.thumbnail}"
							data-setup="{'techOrder':['html5','flash','flvjs']}">
						<source src="video/skatn3/Forest.mp4" type="video/mp4">
					</video>
 					<!-- poster="ThumnailDownload/${lecture.name}/${lecture.thumbnail}" -->
					
				</div>
				<div class="vidoe__btn-box"></div>
			</div>
		</div>
		<div class="video__nav">
			<div class="video__nav-header">
				<div class="video__nav-inner">
					
					<ul class="video__menu">
	
					</ul>
					
				</div>
			</div>
			
			<div class=lecturer_div>
		
   					 
   					 <c:if test="${isInstructor eq true}">
	   					<form method="post" action="tempfile">
	   						<input type="text" name="lecture_name" style= "display:none" value="${lecture.name}"/>
	   						<input type="text" name="lecture_id" style= "display:none" value="${lecture.id}"/>
	   						<input type="submit" value="동영상 업로드" class="vodUpload" >
	 					</form>
	 					<!-- <input type="button" value="강의 삭제" class="vodDelete"> -->
	 					
	 					<input type="button" value="동영상 삭제" class="vodDelete" onclick="javascript:delBtn(${lecture.id});">
	 					<br>
	 					<br>
	 					<input type="button" value="전체 강의 삭제" class="lectureDelete" onclick="javascript:delLecture(${lecture.id});">
 					 </c:if>
 					 <!-- <input type="text" id="lecture_id" name="lecture_id" style= "display:none" /> -->
 					 <!-- <input type="text" id="lecture_id" name="lecture_id" value="${lecture.id}"/> -->
 					 
 					 
 					 
   				
            </div>

		</div>
	</div>
	
	<script id="video__total-template" type="text/x-handlebars-template">
			{{#text}}
			{{#if isCheck}}
			<li class="video__items complate" data-idx={{id}} id={{id}} onclick="reply_click(this.id)">
				<span class="video__items-tit">{{id}}.{{title}}</span>
				<span class="video__player-icon">
					<svg width="18" aria-hidden="true" data-prefix="fal" data-icon="play-circle" class="svg-inline--fa fa-play-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z"></path>
					</svg>
					<span class="video__player-time">{{time}}</span>
				</span>
			</li>
			{{else}}
			<li class="video__items" data-idx={{id}} id={{id}} onclick="reply_click(this.id)">
				<span class="video__items-tit">{{id}}. {{title}}</span>
				<span class="video__player-icon">
					<svg width="18" aria-hidden="true" data-prefix="fal" data-icon="play-circle" class="svg-inline--fa fa-play-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z"></path>
					</svg>
					<span class="video__player-time">{{time}}</span>
				</span>
			</li>
			{{/if}}
			{{/text}}

		</script>
		
		<script src="${pageContext.request.contextPath}/resources/js/handlebar.js"></script>
		
		<!-- If you'd like to support IE8 (for Video.js versions prior to v7) -->
		<script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
		<script src='https://vjs.zencdn.net/7.6.0/video.js'></script>
		<script src="${pageContext.request.contextPath}/resources/js/video_list.js"></script>
		
</body>
</html>