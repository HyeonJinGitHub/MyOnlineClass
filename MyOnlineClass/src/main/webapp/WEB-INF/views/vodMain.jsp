<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>

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
   </style>
   
   <script>
   	
      	  function button_event(element){
      		
      		alert("강의가 추가되었습니다.");
            
        }
    </script>
    
    
</head>
<body>
<div id="videoContainer">
  <h2>재미있는 스프링 강의</h2>
  <p>윤권 교수님</p>
    <div id="lecture-detail">
        <div class="player-box">
            <!-- <div id="playerWrapper" > -->
                <video id=video class="video-js" controls autoplay>
                    <source src="video/Forest.mp4" type="video/mp4">
                        video tag not find.
                </video>
          <!-- </div> -->
            <div id="lecture_div">
                <h2 class="lecture-info__total">총 강의 수 : 3 </h2>
                <ul id="lectureList" class="lecture-list">

                    <li class="lecture-item lecture-list__item">
                        <div class="lecture-item__order">1강</div>
                        <div class="lecture-item__order">스프링 환경설정</div>
                        <div class="lecture-time">15:21</div>
                        
                    </li>

                    <li class="lecture-item lecture-list__item">
                        <div class="lecture-item__order">2강</div>
                        <div class="lecture-item__order">DI, IoC 란? </div>
                        <div class="lecture-time">35:26</div>
                        
                    </li>

                    <li class="lecture-item lecture-list__item">
                        <div class="lecture-item__order">3강</div>
                        <div class="lecture-item__order">AOP(Aspect Oriented Programing)란? </div>
                        <div class="lecture-time">42:01</div>
                        
                    </li>
                    
                </ul>
              
            </div>
            
            <div class=lecturer_div>
            	<!-- <input type="submit" value="동영상 업로드" class="vodUpload" /> -->
            	<!-- <input type="submit" value="강의 삭제" class="vodDelete" /> -->
            	<!--  <input multiple="multiple" type="file" name="file" style= "display:none"/>-->
            	
            	<form method="post" action="upload" enctype="multipart/form-data">
         
			         <input multiple="multiple" type="file" name="file1" style= "display:none"/>
			         <button type="button" class="vodSelect" onclick="onclick=document.all.file1.click()">동영상 선택</button>
			         <input type="submit" value="강의 업로드" class="vodUpload" onclick="button_event(this);">
  				</form>
  
         		
            	<!-- <input type="submit" value="upload"> -->
            	<!-- <button type="button" class="vodUpload" onclick="onclick=document.all.file.click()">동영상 업로드</button> -->
            	<!-- <button type="button" class="vodDelete">강의 삭제</button> -->
            	
            			
            </div>
        </div>
    </div>
    
    
	    
</div>




</body>
</html>