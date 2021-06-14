package net.developia.online.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import net.developia.online.services.LectureService;
import net.developia.online.services.VodService;

@Controller
public class FileUploadController {

	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private VodService vodService;

	private static final String SAVE_PATH = "C:/online/resources/lecture/";
	
    @RequestMapping("upload")
    public ModelAndView upload(
		@RequestParam(value="file1", required = false) MultipartFile mf, HttpSession session,
		@RequestParam(value="lecture_no",required = true) String lecture_no,
	    @RequestParam(value="lecture_name",required = true) String lecture_name,
			@RequestParam(value="lecturename" ,required = true) String title,

	    HttpServletRequest request, HttpServletResponse response) {
		String id = (String)session.getAttribute("id");



		String My_SAVE_PATH = SAVE_PATH +lecture_name+ "/video/";


		// 	폴더 없으면 생성
			File makeFolder = new File(My_SAVE_PATH);

			if(!makeFolder.exists()) {
				makeFolder.mkdir();


			}
			else {
				//System.out.println("이미 존재");
			}




            String originalFileName = mf.getOriginalFilename();

            String safeFile =  My_SAVE_PATH + originalFileName;

            
            String src = lecture_name+ "/video/"+originalFileName;
            
            HashMap<String, Object> map = new HashMap<String, Object>();
            
            map.put("lecutre_id", lecture_no);
            map.put("title", title);
	    map.put("src", src);
			
			
		
			try {
				
				vodService.registerLectureVod(map);

			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			
            try {
            	
                mf.transferTo(new File(safeFile));
                
               
               } catch (IllegalStateException e) {
                    
                    e.printStackTrace();
                } catch (IOException e) {
                    
                    e.printStackTrace();
                }
            
            ModelAndView mav = new ModelAndView();
            mav.setView(new RedirectView("vodStreaming?no="+lecture_no));

        return mav;
        
    }
    

    

    @RequestMapping("tempfile")
    public ModelAndView tempfile(
    		@RequestParam(required=true) long lecture_id,
    		@RequestParam(required=true) String lecture_name,
    		HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	
    	mav.setViewName("vodEnroll");
    	mav.addObject("lecture_id",lecture_id);
    	mav.addObject("lecture_name",lecture_name);

		return mav;
	}

}
