package net.developia.online.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
    //private static final String SAVE_PATH = System.getProperty("user.home")+ "";
    
    @RequestMapping("upload")
    public ModelAndView upload(
            @RequestParam(value="file1", required = false) MultipartFile mf, HttpServletRequest request, HttpServletResponse response) {
    		
    		//String SAVE_PATH =  System.getProperty("user.dir");
    		
    		String DIR_PATH =  FileUploadController.class.getResource(".").getPath();
    		//System.out.println(DIR_PATH);
            ModelAndView mav = new ModelAndView("vodMain");
            
            String SAVE_PATH =DIR_PATH.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MyOnlineClass/WEB-INF/classes/net/developia/online/controllers/",
            									"/MyOnlineClass/MyOnlineClass/src/main/webapp/WEB-INF/video/");
            
            System.out.println(SAVE_PATH);
            
            String originalFileName = mf.getOriginalFilename();
            //long fileSize = mf.getSize();
            String safeFile =  SAVE_PATH + originalFileName;
            //File safeFile =  new File(SAVE_PATH + System.currentTimeMillis() + originalFileName);
            System.out.println(safeFile);
            
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

}
