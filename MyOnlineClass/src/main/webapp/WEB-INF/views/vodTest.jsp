<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>fileupload & vod Streaming</title>
    
    <link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
   <style>
   
   body{
            margin: 0;
            padding: 0;
            background-color: black;
        }
        .lecture-detail{
            display: block;
            padding: 0 12px 12px;
        }
        .videoContainer{
          width:1400px;
          max-width: 100%;
          margin: 0 auto;
        }
        
        .player-box{
          width:100%;
          height: 80%;
          margin: 10px auto;
          
        }
     
        .lecture_div{
            padding: 10px;
            width:30%;
            float: right;
            display: inline-block;
            box-sizing: border-box;
            
        }
        
        .lecturer_div{
        	display: flex;
        	justify-content: space-between;
        
        
        }
        /*
        .playerWrapper{
          display:inline-block;
          width: 70%;
          float: left;
          padding: 5px;
          
          box-sizing: border-box;
        }
        */
        
        #video{
          display:inline-block;
          
          width: 70%;
          float: left;
          padding: 10px;
          
          box-sizing: border-box;
          
        }
        
        li div {
            color:white;
        }
        
        div > h2 {
        	color:white;
        	padding: 0px 5px;
        }
        .vodSelect {
			background-color: rgb(60, 82, 255);
			color: white;
			border-radius: 5px;
			/*border: 0;*/
			margin: 12px;
			padding: 10px 50px;
			width: 100%;
		}
		
		.vodUpload{
			background-color: rgb(255, 80, 90);
			color: white;
			border-radius: 5px;
			/*border: 0;*/
			margin: 12px;
			width: 100%;
			padding: 10px 50px;
		}
		
		.lecture-item__order{
		
			float:left;
			padding: 0px 10px;
		}
		.lecture-item{
			
			padding: 10px 0px;
		
		}
		p {
			color:white;
			font-size:15px;
			padding: 0px 5px;
		}
		
		.lecture-time{
			float: right;
			padding: 0px 15px;
			}
		.jump{
			background-color: rgb(60, 82, 255);
			color: white;
			border-radius: 5px;
			/*border: 0;*/
			margin: 12px;
			padding: 10px 50px;
			width: 100%;
		}
		
   </style>
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- <script src="videojs.min.js"></script> -->
   <script src="https://vjs.zencdn.net/7.11.4/video.min.js"></script>
   
	<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-playLists/0.2.0/videojs-playlists.js"></script>
	
	<!-- <script src="videojs-playlist-ui.min.js"></script> -->


	
	 <script>
	 
	 var player = videojs('player');
	 console.log(player);
	    //player.playlistUi();

	    player.playlist([{
	        sources: [{
	            src: 'http://media.w3.org/2010/05/sintel/trailer.mp4',
	            type: 'video/mp4'
	        }],
	        poster: 'http://media.w3.org/2010/05/sintel/poster.png'
	        }, {
	        sources: [{
	            src: 'http://media.w3.org/2010/05/bunny/trailer.mp4',
	            type: 'video/mp4'
	        }],
	        poster: 'http://media.w3.org/2010/05/bunny/poster.png'
	        }, {
	        sources: [{
	            src: 'http://vjs.zencdn.net/v/oceans.mp4',
	            type: 'video/mp4'
	        }],
	        poster: 'http://www.videojs.com/img/poster.jpg'
	        }, {
	        sources: [{
	            src: 'http://media.w3.org/2010/05/bunny/movie.mp4',
	            type: 'video/mp4'
	        }],
	        poster: 'http://media.w3.org/2010/05/bunny/poster.png'
	        }, {
	        sources: [{
	            src: 'http://media.w3.org/2010/05/video/movie_300.mp4',
	            type: 'video/mp4'
	        }],
	        poster: 'http://media.w3.org/2010/05/video/poster.png'
	    }]);

	       // Play through the playlist automatically. 
	       player.playlist.autoadvance(0);
	 /*
		var player = videojs(document.querySelector('video'), {
		  inactivityTimeout: 0
		});
	 */
	 	
		
		function jump_click(){
				console.log('hi');
			  player.playlist.currentItem(2); // play third 
		 }
		
		/*
		document.querySelector('.jump').addEventListener('click', function() {
			console.log('hi');
			  player.playlist.currentItem(2); // play third
		});
		*/
		
		player.playlist.autoadvance(0);
	 
		
		 
	 function button_upload(element){
   		
   		alert("강의가 추가되었습니다.");
         
     }
	</script>
    
</head>
<body>
<%
	//String user_id= (String)session.getAttribute("user_id");
	//String data_cnt = (String)session.getAttribute("word_result");
	String user_id = "instructor01";
	String user_name = "요가소녀";
	
%>


<div id="videoContainer">
  <h2>재미있는 스프링 강의</h2>
  <p>윤권 교수님</p>
  <button class="jump" id="jump1" onclick="jump_click();">Play Third</button>
  
  
    <div id="lecture-detail">
        <div class="player-box">
            <!-- <div id="playerWrapper" > -->

                 <video id="player" class="video-js" controls autoplay>
                    <source id="lecturePlayerSource" src="video/Forest.mp4" type="video/mp4">
                        video tag not find.
                </video>
    
            <div id="lecture_div">
            	<h2 class="lecture-info__total">총 강의 수 : 3 </h2>
            	
            	<ul id="lectureList" class="lecture-list">
            	<c:forEach var="dto" items="${list}" varStatus="statusNum">
            		
                    
                    <li class="lecture-item lecture-list__item" onclick="button_event('${dto.url}');" value="${dto.url}">
                        
                        <div class="lecture-item__order" >${statusNum.count}강</div>
                        
                        <div class="lecture-item__order">${dto.title}</div>
                        
                        <div class="lecture-time"> ${dto.information}</div>
                        
                        <!-- <input type="hidden" id="vodName" value="${dto.url}" > -->
                        <!-- <input type="hidden" id="vodName" value="${dto.url}" > -->                        
                    </li>
                   
              	</c:forEach>
              	</ul>
              	
            </div>
            
            <div class=lecturer_div>
            	
            	<form method="post" action="upload" enctype="multipart/form-data">
			         <input multiple="multiple" type="file" name="file1" style= "display:none"/>
			         <button type="button" class="vodSelect" onclick="onclick=document.all.file1.click()">동영상 선택</button>
			         <input type="submit" value="강의 업로드" class="vodUpload" onclick="button_upload(this);">
  				</form>
  
            </div>
        </div>
    </div>
    
</div>


</body>
</html>