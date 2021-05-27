package net.developia.online.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.VodDTO;




@Controller
public class StreamingController{
	
	//private final String FOLDER_MOVIE = "../../../../../video/"; 
	String DIR_PATH =  StreamingController.class.getResource(".").getPath();
	//<source src="video/sample.mp4" type="video/mp4">
	
	@RequestMapping(value="/video/{video_name:.+}", method = RequestMethod.GET)
	public String stream(@PathVariable("video_name") String video_name, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		
		
		String FOLDER_MOVIE =DIR_PATH.replace("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MyOnlineClass/WEB-INF/classes/net/developia/online/controllers/",
											  "/MyOnlineClass/MyOnlineClass/src/main/webapp/WEB-INF/video/");
		//System.out.println(StreamingController.class.getResource(".").getPath());
		//System.out.println(FOLDER_MOVIE + "현재 video 가져오는 경로");
		//확장자 확인 //
		System.out.println(video_name);
		String[] filename_seperate = video_name.split("\\.");
		
		//ModelAndView mav = new ModelAndView();
		
		String exp;
		if(filename_seperate.length <= 1) {
			//확장자 에러//
			throw new RuntimeException("Wrong file name. You need to include expand file name");		
		}
		else {
			exp = filename_seperate[1];
		}
		
		
		File file = new File(FOLDER_MOVIE + video_name);

		System.out.println(video_name);
		if(!file.exists()) throw new FileNotFoundException();
		
		//임의로 파일에 접근
		RandomAccessFile randomFile = new RandomAccessFile(file, "r");
		long rangeStart = 0; //요청범위 시작위치
		long rangeEnd = 0;	 // 끝 위치
		boolean isPart = false;  // 부분 요청 true, 전체 요청 false
		
		try {
			long movieSize = randomFile.length(); //동영상 파일 크기
			String range = request.getHeader("range"); // 스트림 요청 범위
			if(range != null) { // 브라우저마다 다른데 보통 bytes = {start} - {end}
				if(range.endsWith("-")) { //요청 range에 end 값 없을 경우
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
			
			long partSize = rangeEnd - rangeStart + 1; // 전송 파일 크기
			response.reset(); // 전송 시작
			
			response.setStatus(isPart ? 206: 200); // 전체 요청일 경우 200, 부분일 경우 206 반환
			response.setContentType("video/mp4"); //mime type
			
			//전송 내용을 헤드에 넣음
			response.setHeader("Content-Range", "bytes "+rangeStart+"-"+rangeEnd+"/"+movieSize);
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Length", ""+partSize);

			OutputStream out = response.getOutputStream();
			//동영상 파일의 전송시작 위치 지정
			randomFile.seek(rangeStart);
			
			/*
			 * 파일 전송 . java io는 1회 전송 byte 수가 int 로 지정.
			 * 동영상 파일은 int로 처리 안되는 큰 파일 있기 때문에 8kb로 잘라서 파일 크기로 인한 문제 없도록 구현
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
			// 전송 중 브라우저 닫거나 화면 전환한 경우 전송 취소
			// progressBar 클릭하면 클릭한 위치값으로 재요청 들어와서 전송 취소
		}finally {
			randomFile.close();
		}
		
		
		
		return null;
	}
	
	@RequestMapping(value="/vodMain")
	public ModelAndView vodMain(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		String id = (String)session.getAttribute("id");
		
		
		
		ModelAndView mav = new ModelAndView();
		
		//ModelAndView mav = new ModelAndView("vodMain");
		try {

			//List<MyWordDTO> list = wordService.getWordList(user_id);
			// 임의로 진행
			List<VodDTO> list = new ArrayList<>();
			VodDTO vodDTO= new VodDTO();
			/*
			vodDTO.setId(1);
			vodDTO.setLesson(1);
			vodDTO.setTitle("재미있는 스프링 환경설정");
			vodDTO.setInformation("21:42");
			vodDTO.setUrl("Forest.mp4");
			list.add(vodDTO);
			
			VodDTO vod1DTO= new VodDTO();
			vod1DTO.setId(1);
			vod1DTO.setLesson(1);
			vod1DTO.setTitle("씬나게 배워볼까용? DI");
			vod1DTO.setInformation("12:42");
			vod1DTO.setUrl("sample.mp4");
			list.add(vod1DTO);
			
			VodDTO vodDTO2= new VodDTO();
			vodDTO2.setId(1);
			vodDTO2.setLesson(1);
			vodDTO2.setTitle("배워보자!!!! AOP");
			vodDTO2.setInformation("52:12");
			vodDTO2.setUrl("sample2.mp4");
			list.add(vodDTO2);
			
			
			
			
			mav.addObject("list", list);
			*/
			mav.setViewName("vodMain");
			String viewName = mav.getViewName();
			Map<String, Object> model = mav.getModel();
			for(String key : model.keySet()) {
				request.setAttribute(key, model.get(key));
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;

	}
	
	
	
	
}
