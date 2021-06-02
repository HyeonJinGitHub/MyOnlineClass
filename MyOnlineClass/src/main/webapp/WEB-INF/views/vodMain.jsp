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
			alert(clicked_id);
			delete_id = clicked_id;
			
		}
		
		
		
		function delBtn(lecture_id){
			
			
			let vodtag = confirm('강의를 정말 삭제하시겠습니까?');
			alert(vodtag);
			if(vodtag){
					
					$.ajax({
							type: "POST",
							url: "vodDelete",
							data: {
								
								lecture_no : lecture_id,
								del_no : delete_id}
								,
							dataType: "json",
							success : function(data) {

								
								console.log(data);
								console.log(data[0].cnt);
								
								
								getVideoData = function () {
									
									return new Promise(function (resolve, reject) {
										
										var videoData = data;
										resolve(videoData);
									})
									}
								
								
								
								getVideoData()
								.then(function (res) {
									var videoArr = res,
										vid = document.querySelector('#my-video'),
										currentNum = 0,
										maxNum = res.length,
										videoListData = {
											text: videoArr,
										};

									var player = videojs(vid, {
										inactivityTimeout: 0
									});

									//현재 받은 비디오데이터의 맨처음 list 재생준비
									player.poster(videoArr[0].poster);
									player.src(videoArr[0].src);
									$(".video__tit").text(videoArr[0].id + ". " + videoArr[0].title);


									var videoList = new HandleBars(videoListData, '#video__total-template', '.video__menu');
									videoList.render();

									var listItem = $('.video__items');
									listItem.eq(0).addClass('active');
									listClick(listItem);

									var setSlcect = function (listSelect, currentNum) {
										listSelect.text[currentNum].id = videoArr[currentNum].id;
										listSelect.text[currentNum].title = videoArr[currentNum].title;
										listSelect.text[currentNum].src = videoArr[currentNum].src;
										listSelect.text[currentNum].poster = videoArr[currentNum].poster;
										listSelect.text[currentNum].isCheck = videoArr[currentNum].isCheck;
										
										
										listSelect.text[currentNum].cnt = videoArr[currentNum].cnt;
									};

									player.on('play', function () {
										//동영상 플레이 감지
										removeBtn();
										//console.log(videoListData.text[currentNum].time)

										this.currentTime(videoListData.text[currentNum].time);

									});

									player.on('ended', function () {
										//비디오가 완료되었다면 체크
										videoListData.text[currentNum].isCheck = true;

										var videoList = new HandleBars(videoListData, '#video__total-template', '.video__menu');
										videoList.render();

										var listItem = $('.video__items');
										listClick(listItem);

										$('.video__items').eq(currentNum).addClass('active');

										var videoBox = document.querySelector('.vidoe__btn-box');

										if (currentNum === 0) {
											videoBox.appendChild(getBtn('nextBtn'));
										} else if (currentNum > 0 && currentNum < maxNum - 1) {
											videoBox.appendChild(getBtn('prevBtn'));
											videoBox.appendChild(getBtn('nextBtn'));
										} else if (currentNum === maxNum - 1) {
											videoBox.appendChild(getBtn('prevBtn'));
										}

										prevBtn();
										nextBtn();

										(function () {
											//3초뒤에 현재 비디오를 다시 처음부터 재생
											var timer = setTimeout(function () {
												videoListData.text[currentNum].time = 0;
												player.play();
											}, 3000);
										})();

									});

									player.on('pause', function () {
										//현재 비디오 정지 체크
										var isPaused = player.paused();

										if (isPaused) {
											//정지 되었다면 현재 멈춘만큼의 시간을 체크해서 저장.
											videoListData.text[currentNum].time = Number(player.cache_.currentTime);
										}

										return false;
									})



									function listClick(listItem) {
										listItem.on('click', function (e) {
											try {
												//클릭시 재생되고있던 비디오 시간 저장
												var timeCheck = player.currentTime();
												videoListData.text[currentNum].time = timeCheck;

												var listSelect = {
													text: videoArr,
												};

												removeBtn();

												currentNum = $(this).index();

												$('.video__items').removeClass('active');
												$(this).addClass('active');

												setSlcect(listSelect, currentNum);

												player.poster(listSelect.text[currentNum].poster);
												player.src(listSelect.text[currentNum].src);
												//$(".video__tit").text(listSelect.text[currentNum].id + ". " + listSelect.text[currentNum].title);
												$(".video__tit").text(listSelect.text[currentNum].cnt + ". " + listSelect.text[currentNum].title);

												return false;
											} catch (error) {
												console.warn(error);
											}
										});
									}

									function prevBtn() {
										var prevBtn = document.querySelector('.video__prev-btn');
										if (!prevBtn) return;

										var listSelect = {
											text: videoArr,
										}

										prevBtn.addEventListener('click', function (e) {
											removeBtn();
											$('.video__items').removeClass('active');
											$('.video__items').eq(currentNum - 1).addClass('active');
											currentNum -= 1;
											setSlcect(listSelect, currentNum);
											player.poster(listSelect.text[currentNum].poster);
											player.src(listSelect.text[currentNum].src);
											//$(".video__tit").text(listSelect.text[currentNum].id + ". " + listSelect.text[currentNum].title);
											$(".video__tit").text(listSelect.text[currentNum].cnt + ". " + listSelect.text[currentNum].title);
										});
									}

									function nextBtn() {
										var nextBtn = document.querySelector('.video__next-btn');
										if (!nextBtn) return;

										var listSelect = {
											text: videoArr,
										}

										nextBtn.addEventListener('click', function (e) {
											removeBtn();
											$('.video__items').removeClass('active');
											$('.video__items').eq(currentNum + 1).addClass('active');
											currentNum += 1;
											setSlcect(listSelect, currentNum);
											player.poster(listSelect.text[currentNum].poster);
											player.src(listSelect.text[currentNum].src);
											//$(".video__tit").text(listSelect.text[currentNum].id + ". " + listSelect.text[currentNum].title);
											$(".video__tit").text(listSelect.text[currentNum].cnt + ". " + listSelect.text[currentNum].title);
										});
									}
								});
							},
							
							error : function() {
								alert('실패');
							}
						});
				}
			else{
				alert('아니래');
			}
			
			}
		
			function delLecture(lecture_id, member_id){
				
				let tag = confirm('강의 전체를 정말 삭제하시겠습니까?');
				if(tag){
				
				
					$.ajax({
							type: "POST",
							url: "lectureDelete",
							data: {
								lecture_no : lecture_id,
								}
								,
							dataType: "text",
							success : function() {
								pageMove(member_id);
								alert("강의가 정상적으로 삭제되었습니다.");
								
							},
							
							error : function(request, error) {
								alert("code:"+request.status + "\n message"+ request.responseText+"\n error:"+error);
								alert('실패');
							}
						});
				}
			}
			
			function pageMove(id){
				 console.log(id);
				 
			      var f = document.paging;
			      f.id.value = id
			      f.action = "${pageContext.request.contextPath}/profile"
			      f.method = "post"
			      f.submit();
				  }
		
	</script>
	
	
</head>



<body>

	<form name="paging">
    	<input type="hidden" name="id"/>
    </form>
	
	<h2 class="lecture_name_class">
		<span class="lecture_name_span" onclick="pageMove('${instructor.member_id}');" >${lecture.name}</span>
		
	</h2>
	
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
	 					<input type="button" value="전체 강의 삭제" class="lectureDelete" onclick="javascript:delLecture(${lecture.id},'${id}');">
 					 </c:if>
 					 <!-- <input type="text" id="lecture_id" name="lecture_id" style= "display:none" /> -->
 					 <!-- <input type="text" id="lecture_id" name="lecture_id" value="${lecture.id}"/> -->
 					 
 					 
 					 
   				
            </div>

		</div>
	</div>
	
	<script id="video__total-template" type="text/x-handlebars-template">
			{{#text}}
			{{#if isCheck}}
			<li class="video__items complate" data-idx={{id}} id={{id}} onclick="reply_click(this.id)" >
				<span class="video__items-tit">{{cnt}}.{{title}}</span>
				<span class="video__player-icon">
					<svg width="18" aria-hidden="true" data-prefix="fal" data-icon="play-circle" class="svg-inline--fa fa-play-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 504c137 0 248-111 248-248S393 8 256 8 8 119 8 256s111 248 248 248zM40 256c0-118.7 96.1-216 216-216 118.7 0 216 96.1 216 216 0 118.7-96.1 216-216 216-118.7 0-216-96.1-216-216zm331.7-18l-176-107c-15.8-8.8-35.7 2.5-35.7 21v208c0 18.4 19.8 29.8 35.7 21l176-101c16.4-9.1 16.4-32.8 0-42zM192 335.8V176.9c0-4.7 5.1-7.6 9.1-5.1l134.5 81.7c3.9 2.4 3.8 8.1-.1 10.3L201 341c-4 2.3-9-.6-9-5.2z"></path>
					</svg>
					<span class="video__player-time">{{time}}</span>
				</span>
			</li>
			{{else}}
			<li class="video__items" data-idx={{id}} id={{id}} onclick="reply_click(this.id)">
				<span class="video__items-tit">{{cnt}}. {{title}}</span>
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