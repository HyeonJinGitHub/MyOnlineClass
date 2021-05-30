package net.developia.online.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.CardDTO;
import net.developia.online.dto.InstructorDTO;
import net.developia.online.dto.LectureDTO;
import net.developia.online.services.CardService;
import net.developia.online.services.InstructorService;
import net.developia.online.services.LectureService;

@RestController
public class ClassTokController {
	@Autowired
	private InstructorService instructorService;
	
	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private CardService cardService;

	@RequestMapping(value = "instructorJson", produces = "application/json; charset=UTF-8")
	public List<InstructorDTO> getInstructor() throws Exception {
		List<InstructorDTO> list = instructorService.getInstructorList();
		return list;
	}
	
	@GetMapping(value = "cardJson", produces = "application/json; charset=UTF-8")
	public List<CardDTO> getLecture() throws Exception {
		List<CardDTO> list = cardService.getCardList();
		return list;
	}
	
	@GetMapping(value = "cardJsonWithKeyword", produces = "application/json; charset=UTF-8")
	public List<CardDTO> getLectureWithKeyword(HttpServletRequest request, HttpSession session) throws Exception {
		List<CardDTO> list;
		String keyword = request.getParameter("keyword");
		if (keyword.equals("all")) {
			list = cardService.getCardList();
		} else {
			list = cardService.getCardListWithKeyword(keyword);
		}
		System.out.println("리턴 행 갯수 : " + list.size());
		
		session.setAttribute("numberOfReturnRows", list.size());
		return list;
	}

	@GetMapping(value = "open")
	public ModelAndView open() throws Exception {
		return new ModelAndView("open");
	}

	@PostMapping(value = "/registerAction")
	public ModelAndView registerAction(HttpSession session,HttpServletRequest request, @RequestParam(required = true) String id,
			@RequestParam(required = true) String name, @RequestParam(required = true) String email,
			@RequestParam(required = true) String phone, @RequestParam(required = true) String nickname,
			@RequestParam(required = true) String introduce, @RequestParam("image") MultipartFile file)
			throws Exception {
		/* 파일 경로 */
		String path = "C:/online/resources/instructor";

		/* 이미지 업로드 */
		String image = file.getOriginalFilename();
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, image));
		}

		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		System.out.println("nickname : " + nickname);
		System.out.println("introduce : " + introduce);
		System.out.println("image : " + image);

		InstructorDTO instructorDTO = new InstructorDTO();
		instructorDTO.setMember_id(id);
		instructorDTO.setName(name);
		instructorDTO.setEmail(email);
		instructorDTO.setPhone(phone);
		instructorDTO.setNickname(nickname);
		instructorDTO.setIntroduce(introduce);
		instructorDTO.setImage(image);

		instructorService.registerInstructor(instructorDTO);
		
		session.setAttribute("nickname", instructorDTO.getNickname());
		return new ModelAndView("classtok");
	}

	@GetMapping(value = "imageDownload")
	public void imageDownload(String fileName, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "C:/online/resources/instructor";

		String downFile = file_repo + "/" + fileName;
		File f = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + URLEncoder.encode(fileName, "UTF-8"));
		try (FileInputStream in = new FileInputStream(f); OutputStream out = response.getOutputStream()) {
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer);
				if (count == -1)
					break;
				out.write(buffer, 0, count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@GetMapping(value = "thumbnailDownload")
	public void thumbnailDownload(String fileName, String lectureName, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "C:/online/resources/lecture";
		
		file_repo += "/";
		file_repo += lectureName;
		file_repo += "/";
		file_repo += "thumbnail";

		String downFile = file_repo + "/" + fileName;
		
		File f = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + URLEncoder.encode(fileName, "UTF-8"));
		try (FileInputStream in = new FileInputStream(f); OutputStream out = response.getOutputStream()) {
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer);
				if (count == -1)
					break;
				out.write(buffer, 0, count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	@PostMapping(value = "getInstFlag", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public InstructorDTO getInstFlag(HttpServletRequest request) throws Exception {
		String id = (String)request.getParameter("id");
		InstructorDTO instructorDTO = instructorService.getInstFlag(id);
		
		return instructorDTO;
	}
	
	@RequestMapping(value = "autoComplete")
	public Set<String> autoComplete(String term) throws Exception {
		Set<String> keyword = new HashSet<String>();
		
		List<InstructorDTO> instructorDTO = instructorService.getNickname(term);
		List<LectureDTO> lectureDTO = lectureService.getLectureName(term);
		
		for (int i = 0; i < instructorDTO.size(); i++) {
			keyword.add(instructorDTO.get(i).getNickname());
		}
		
		for (int i = 0; i < lectureDTO.size(); i++) {
			keyword.add(lectureDTO.get(i).getName());
		}
		
		return keyword;
	}
	
	@RequestMapping(value = "/search/{keyword}", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView search(@PathVariable(required = true) String keyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.setViewName("search");
		return mav;
//		return new ModelAndView("search");
	}
	
	@RequestMapping(value = "/search", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchAll() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", "all");
		mav.setViewName("search");
		return mav;
//		return new ModelAndView("search");
	}
}