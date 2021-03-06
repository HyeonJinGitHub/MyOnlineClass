package net.developia.online.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.dto.VodDTO;
import net.developia.online.services.InstructorService;
import net.developia.online.services.LectureService;
import net.developia.online.services.VodService;
import net.sf.json.JSONArray;




@Controller
public class StreamingController{
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private VodService vodService;
	
	@Autowired
	private InstructorService instructorService;
	
	private static String thumbnail;
	
	private static String thumbnail_path;
	
	private static Map<Long,String> time_map = new HashMap<Long, String>(); 
	
	
	@Value("upload.path")
	String file_repo;
	

	String FOLDER_MOVIE = "C:/online/resources/lecture/";


	@RequestMapping(value="/{lecture_name}/video/{video_name:.+}", method = RequestMethod.GET)
	public String stream(@PathVariable("lecture_name") String lecture_name,
			 @PathVariable("video_name") String video_name, 
			 HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		
		String My_FOLDER_MOVIE = FOLDER_MOVIE+lecture_name+"/video/";
		
		
		//????????? ?????? //
		String[] filename_seperate = video_name.split("\\.");
		
		
		String exp;
		if(filename_seperate.length <= 1) {
			//????????? ??????//
			throw new RuntimeException("Wrong file name. You need to include expand file name");		
		}
		else {
			exp = filename_seperate[1];
		}
		
		
		File file = new File(My_FOLDER_MOVIE + video_name);

		if(!file.exists()) throw new FileNotFoundException();
		
		//????????? ????????? ??????
		RandomAccessFile randomFile = new RandomAccessFile(file, "r");
		long rangeStart = 0; //???????????? ????????????
		long rangeEnd = 0;	 // ??? ??????
		boolean isPart = false;  // ?????? ?????? true, ?????? ?????? false
		
		try {
			long movieSize = randomFile.length(); //????????? ?????? ??????
			String range = request.getHeader("range"); // ????????? ?????? ??????
			if(range != null) { // ?????????????????? ????????? ?????? bytes = {start} - {end}
				if(range.endsWith("-")) { //?????? range??? end ??? ?????? ??????
					range = range+(movieSize - 1); 
				}
				int idxm = range.trim().indexOf("-");
				rangeStart = Long.parseLong(range.substring(6,idxm));
				rangeEnd = Long.parseLong(range.substring(idxm+1));
				if(rangeStart > 0) {
					isPart = true;
				}
			}else {
				rangeStart = 0;
				rangeEnd = movieSize - 1;
			}
			
			long partSize = rangeEnd - rangeStart + 1; // ?????? ?????? ??????
			response.reset(); // ?????? ??????
			
			response.setStatus(isPart ? 206: 200); // ?????? ????????? ?????? 200, ????????? ?????? 206 ??????
			response.setContentType("video/mp4"); //mime type
			
			//?????? ????????? ????????? ??????
			response.setHeader("Content-Range", "bytes "+rangeStart+"-"+rangeEnd+"/"+movieSize);
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Length", ""+partSize);

			OutputStream out = response.getOutputStream();
			//????????? ????????? ???????????? ?????? ??????
			randomFile.seek(rangeStart);
			
			/*
			 * ?????? ?????? . java io??? 1??? ?????? byte ?????? int ??? ??????.
			 * ????????? ????????? int??? ?????? ????????? ??? ?????? ?????? ????????? 8kb??? ????????? ?????? ????????? ?????? ?????? ????????? ??????
			 */
			int bufferSize = 8*1024;
			byte[] buf = new byte[bufferSize];
			do {
				int block = partSize > bufferSize ? bufferSize : (int)partSize;
				int len = randomFile.read(buf, 0, block);
				out.write(buf, 0,len);
				partSize -= block;
			}while(partSize > 0);
		}catch(IOException e) {
			// ?????? ??? ???????????? ????????? ?????? ????????? ?????? ?????? ??????
			// progressBar ???????????? ????????? ??????????????? ????????? ???????????? ?????? ??????
		}finally {
			randomFile.close();
		}
		
		return null;
	}

	
	// URL : http://localhost/online/vodStreaming?no=1
	
	@RequestMapping(value="vodStreaming", produces = "application/json; charset=UTF-8") //????????? ?????? ?????? ??????
	public ModelAndView vodStreaming(@RequestParam(required = true) long no, HttpSession session) {
		
	
		
		ModelAndView mav = new ModelAndView();		
		
		
		String id = (String)session.getAttribute("id");
		
		
		try {

			LectureDTO lectureDTO = new LectureDTO();
			lectureDTO = lectureService.getLecture(no);
			
			
			
			InstructorDTO instructorDTO =new InstructorDTO();  
			instructorDTO =	instructorService.getInstructor(no);
			
			
			boolean isInstructor = false; 
						
			
			
			if(id.equals(instructorDTO.getMember_id())) {
				isInstructor = true;
			}
			
			
			
	
			thumbnail_path = "/online/lectureThumbnail?name="+ lectureDTO.getName() + "&thumbnail=";
			
			
			thumbnail = lectureDTO.getThumbnail();
			
			
			//?????? ????????????
			String [] time_list = {"01:12","00:38","2:31", "00:48","00:32", "00:52"};
			
			

			List<VodDTO> list = vodService.getVodList(no);
			
			
			
			
			for(int i=0;i<list.size(); i++) {
				time_map.put(list.get(i).getId(), time_list[i]);
			}
			
			
			for(int i=0;i<list.size(); i++) {
				
				list.get(i).setCnt(i+1);
				list.get(i).setThumbnail(thumbnail);
				list.get(i).setPoster(thumbnail_path+thumbnail);
				
				list.get(i).setTime(time_map.get(list.get(i).getId()));
				
			}
			
			
			
			mav.setViewName("vodMain");
			
			JSONArray jsonArray = new JSONArray();
			
			boolean isVodList = false;
			if(list.size() != 0) {
				isVodList = true;
			}
			
			mav.addObject("jsonList",jsonArray.fromObject(list));
			
			
			mav.addObject("lectureDTO", lectureDTO);
			
			mav.addObject("instructorDTO", instructorDTO);
			
			mav.addObject("isInstructor", isInstructor);
			
			mav.addObject("isVodList",isVodList);
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	
	}
	
	
	
	@RequestMapping(value="/getVodUrl", method=RequestMethod.GET) //????????? ?????? ?????? ??????
	public void getVodUrl(@RequestParam(required = true) long no, HttpSession session, Model model) {
		
		
		
		String id = (String)session.getAttribute("id");
		
		
		try {

			
			List<VodDTO> list = vodService.getVodList(no);
			
			
			JSONArray jsonArray = new JSONArray();
			
			model.addAttribute("jsonList",jsonArray.fromObject(list));
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
	
	}
	
	
	@ResponseBody
	@RequestMapping(value = "vodDelete")
	public List<VodDTO> vodDelete(String lecture_no, String del_no, HttpServletResponse response) throws Exception {
		
		
		vodService.deleteVOD(Long.parseLong(del_no));
		List<VodDTO> list = new ArrayList<>();
				
		list = vodService.getVodList(Long.parseLong(lecture_no));
		
		
		for(int i=0;i<list.size(); i++) {
			
			list.get(i).setCnt(i+1);
			list.get(i).setThumbnail(thumbnail);
			list.get(i).setPoster(thumbnail_path+thumbnail);
			list.get(i).setTime(time_map.get(list.get(i).getId()));
			
		}
		
	
		return list;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "lectureDelete")
	public void lectureDelete(String lecture_no, HttpSession session ,HttpServletResponse response) throws Exception {
		
		
		lectureService.deleteLecture(Long.parseLong(lecture_no));
		
		
		
		
		
		
	}
}
	

