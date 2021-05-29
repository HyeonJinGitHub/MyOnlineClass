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

	private static final String SAVE_PATH = "C:/online/resources/video/";
	
	/*
	@ResponseBody
	@RequestMapping("upload")
    public ModelAndView upload(@RequestBody Map<String, Object> params,
    		HttpSession session,
            HttpServletRequest request, HttpServletResponse response) throws Exception{
    		String id = (String)session.getAttribute("id");
    		
    		String lecture_no = (String)params.get("lecture_no");
            String time = (String)params.get("time");
			String title= (String)params.get("title");
			
    		String My_SAVE_PATH = SAVE_PATH+id+"/";
    		System.out.println(lecture_no);
    		System.out.println(time);
    		System.out.println(title);
    		System.out.println(params);
    		

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
            
			//ModelAndView mav = new ModelAndView("vodStreaming?no="+lecture_no);
            

            System.out.println(My_SAVE_PATH);
            
            //String originalFileName = mf.getOriginalFilename();
            String originalFileName = "hi";

            String safeFile =  My_SAVE_PATH + originalFileName;

            String src = "video/"+id+"/"+originalFileName;
            
            HashMap<String, Object> map = new HashMap<String, Object>();
            
            map.put("lecutre_id", lecture_no);
            map.put("title", title);
			map.put("time", time);
			map.put("src", src);
			System.out.println(lecture_no);
			System.out.println(title);
			System.out.println(time);
			System.out.println(src);
			
		
			try {
				
				vodService.registerLectureVod(map);

				System.out.println("성공");
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			
            try {
            	
                //mf.transferTo(new File(safeFile));
                
               
               } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            //catch (IOException e) {
                    // TODO Auto-generated catch block
             //       e.printStackTrace();
                //}
            
            
            
            
        
        return null;
        
    }
	*/
	
	
    @RequestMapping("upload")
    public ModelAndView upload(
            @RequestParam(value="file1", required = false) MultipartFile mf, HttpSession session,
            @RequestParam(value="lecture_no",required = true) String lecture_no,
            @RequestParam(value="time",required = true) String time,
			@RequestParam(value="lecturename" ,required = true) String title,

            HttpServletRequest request, HttpServletResponse response) {
    		String id = (String)session.getAttribute("id");
		
    		String My_SAVE_PATH = SAVE_PATH+id+"/";
    		System.out.println(lecture_no);
    		System.out.println(time);
    		System.out.println(title);
    		
    		

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
            
			//ModelAndView mav = new ModelAndView("vodStreaming?no="+lecture_no);
            

            System.out.println(My_SAVE_PATH);
            
            String originalFileName = mf.getOriginalFilename();

            String safeFile =  My_SAVE_PATH + originalFileName;

            String src = "video/"+id+"/"+originalFileName;
            
            HashMap<String, Object> map = new HashMap<String, Object>();
            
            map.put("lecutre_id", lecture_no);
            map.put("title", title);
			map.put("time", time);
			map.put("src", src);
			System.out.println(lecture_no);
			System.out.println(title);
			System.out.println(time);
			System.out.println(src);
			
		
			try {
				
				vodService.registerLectureVod(map);

				System.out.println("성공");
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			
            try {
            	
                mf.transferTo(new File(safeFile));
                
               
               } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            
            ModelAndView mav = new ModelAndView();
            mav.setView(new RedirectView("vodStreaming?no="+lecture_no));
            //mav.setViewName("vodStreaming");
            //mav.addObject("lecture_no",lecture_no);
            
			//mav.addObject("msg", "강의 등록에 성공하였습니다.");
			
		
            
            
            
        
        return mav;
        
    }
    

    

    @RequestMapping("tempfile")
    public ModelAndView tempfile(
    		@RequestParam(required=true) long lecture_id,
    		HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	System.out.println(lecture_id);
    	
    	mav.setViewName("vodEnroll");
    	mav.addObject("lecture_id",lecture_id);
    	//mav.addObject(lecture_name);
		return mav;
	}

}
