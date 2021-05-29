package net.developia.online.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.developia.online.dto.InstructorDTO;
import net.developia.online.services.InstructorService;

@RestController
public class ClassTokController {
	@Autowired
	private InstructorService instructorService;

	@RequestMapping(value = "instructorJson", produces = "application/json; charset=UTF-8")
	public List<InstructorDTO> getInstructor() throws Exception {
		List<InstructorDTO> list = instructorService.getInstructorList();

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
	public void download(String fileName, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "C:/online/resources/instructor";
		

		String downFile = file_repo + "/" + fileName;
//		String downFile = fileName;
//		System.out.println("downFile = " + downFile);
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
	
	@RequestMapping(value = "getInstFlag")
	@ResponseBody
	public void getInstFlag(HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		if (id == null) {
			id = "";
		}
		
		try {
			InstructorDTO instructorDTO = instructorService.getInstFlag(id);
			if (instructorDTO != null) {
				session.setAttribute("nickname", instructorDTO.getNickname());
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}