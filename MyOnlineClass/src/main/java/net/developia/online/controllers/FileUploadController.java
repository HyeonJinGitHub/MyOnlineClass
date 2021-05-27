package net.developia.online.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {


	private static final String SAVE_PATH = "C:/online/resources/video/";
	
	
    @RequestMapping("upload")
    public ModelAndView upload(
            @RequestParam(value="file1", required = false) MultipartFile mf, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    		String id = (String)session.getAttribute("id");
		
    		String My_SAVE_PATH = SAVE_PATH+id+"/";
    		String lecture_no=request.getParameter("lecture_no");

    		// 	폴더 없으면 생성
			File makeFolder = new File(My_SAVE_PATH);
			
			if(!makeFolder.exists()) {
				makeFolder.mkdir();
				System.out.println("폴더 생성");
				System.out.println(makeFolder.exists());
			}
			else {
				System.out.println("이미 존재");
			}
    		//String SAVE_PATH =  System.getProperty("user.dir");
    	
    		//System.out.println(DIR_PATH);
            
			ModelAndView mav = new ModelAndView("vodStreaming?no="+lecture_no);
            

            System.out.println(My_SAVE_PATH);
            
            String originalFileName = mf.getOriginalFilename();

            String safeFile =  My_SAVE_PATH + originalFileName;

            
            try {
                mf.transferTo(new File(safeFile));
                
                response.sendRedirect(mav.getViewName());
            	//mf.transferTo(safeFile);
               } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
        
        return null;
        
    }
    
    @GetMapping("/tempfile")
	public ModelAndView tempfile() throws Exception {
		return new ModelAndView("fileUpload");
	}
    
    

}
