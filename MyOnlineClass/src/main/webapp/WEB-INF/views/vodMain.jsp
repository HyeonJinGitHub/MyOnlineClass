<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <c:import url="header3.jsp"></c:import>

  
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
	
	<!-- 샘플 -->
	<script>
		var getVideoData = function () {
			
		return new Promise(function (resolve, reject) {
			
			console.log(${jsonList});
			var videoData = ${jsonList};
			resolve(videoData);
		})
		}
		
		function doPopUpOpen(){
			window.open("tempfile","popup01","width=1000, height=1300");
			
		}
		
	</script>
	
	
</head>
<body>
	<!-- edu video s -->
	<c:set var="lecture" value="${lectureDTO}" />
	<c:set var="instructor" value="${instructorDTO}" />
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
						poster="https://vjs.zencdn.net/v/oceans.png"
						data-setup="{'techOrder':['html5','flash','flvjs']}">
						<source src="video/skatn3/Forest.mp4" type="video/mp4">
					</video>
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
            	<!-- 
            	<form method="post" action="upload" enctype="multipart/form-data">
			         <input multiple="multiple" type="file" name="file1" style= "display:none"/>
			         <input multiple="multiple" type="text" name="lecture_no" style= "display:none" value="${lecture.id}"/>
			         <button type="button" class="vodSelect" onclick="onclick=document.all.file1.click()">동영상 선택</button>
			         <input type="submit" value="강의 업로드" class="vodUpload" onclick="button_upload(this);">
			         
  				</form>
   				-->
   					<!-- 
   					<form method="post" action="tempfile">
   						<input type="text" type="text" name="lecture_name" style= "display:none" value="${lecture.name}"/>
   						
 					</form>
 					 -->
 					 
 					 <input type="submit" value="강의 업로드" class="vodUpload" onclick="doPopUpOpen();">
   				
            </div>

		</div>
	</div>
	
	<script id="video__total-template" type="text/x-handlebars-template">
			{{#text}}
			{{#if isCheck}}
			<li class="video__items complate" data-idx={{id}}>
				<span class="video__items-tit">{{id}}.{{title}}</span>
				<span class="video__player-icon">
					<svg width="18" aria-hidden="true" data-prefix="fal" data-icon="play-circle" class="svg-inline--fa fa-play-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z"></path>
					</svg>
					<span class="video__player-time">02: 00</span>
				</span>
			</li>
			{{else}}
			<li class="video__items" data-idx={{id}}>
				<span class="video__items-tit">{{id}}. {{title}}</span>
				<span class="video__player-icon">
					<svg width="18" aria-hidden="true" data-prefix="fal" data-icon="play-circle" class="svg-inline--fa fa-play-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z"></path>
					</svg>
					<span class="video__player-time">02: 00</span>
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