# MyOnlineClass

* 내가 자신있는 분야를 가르칠 수도 있고 부족한 분야는 배울 수 있는 웹 어플리케이션 

* 코치로 등록하여 수업자료를 배포하고 동영상을 업로드



### cmd에서 작업하기

1. (협업하는 repository를 clone 하기) - workDir 에서 cmd 창 실행


   git clone https://github.com/HyeonJinGitHub/MyOnlineClass.git



2. 받아온 경로로 이동


   cd MyOnlineClass



3. 공유 repository를 origin에서 upstream으로 이름 변경


   git remote rename origin upstream
   
   
   git remote -v



4. origin 경로는 자신이 fork 한 곳으로 지정

   

   (남수)
   
   
   git remote add origin https://github.com/NAMSOO-KIM/MyOnlineClass.git
   
   
   git remote -v
   
   

   (민지)
   
   
   git remote add origin https://github.com/for-ming/MyOnlineClass.git
   
   
   git remote -v
   
   

   (동현이형)
   
   
   git remote add origin https://github.com/li935/MyOnlineClass.git
   
   
   git remote -v
   
 



5. 브랜치 만들어서 작업할 때(현재 브랜치 확인)


   git branch



6. main밖에 없을거임. 자신이 작업할 브랜치 생성 (브랜치 생성규칙: 자기이름/작업명)



   git branch nskim/fileUpload
   
 



7. 브랜치 이동해서 작업하기. 


   nskim/fileUpload 브랜치와 main 브랜치는 분리되어 있음. 항상 작업하거나 commit 또는 pull 할 때 현재 작업 브랜치 확인하기. 

   

   git branch
   
   
   git checkout nskim/fileUpload



8. 작업 완료하면 로컬 브랜치 최신화(커밋) 후 원격 repository에 반영 . (git branch를 통해 현재 내 작업 경로 확인!!)

   

   git add .
   
   
   git status
   
   
   git commit -m "fileUpload Complete"
   
   
   git push upstream nskim/fileUpload



9. main 브랜치에는 github desktop으로 PR

   


### main에 merge가 되었을 때 받아오기



10. 이제 merge가 되었을 때 upstream에서 받아오면 됨. upstream은 main 은 최종 코드가 있는 경로.

    git branch
    
    
    git checkout main
    
    
    git pull upstream main



11. 자신의 작업 branch에도 반영

    git branch
    
    
    git checkout nskim/fileUpload
    
    
    git pull upstream main
