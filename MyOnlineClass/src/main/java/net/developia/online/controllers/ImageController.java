package net.developia.online.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ImageController {

	// URI : /lectureImage?name=${lecture.name}&image=${lecture.image}
	@GetMapping(value = "/lectureImage")
	public void lectureImage(String name, String image, HttpServletResponse response) throws Exception {
		String repo = "C:/online/resources/lecture/" + name + "/image";
		String downImage = repo + "/" + image;
		File f = new File(downImage);
		response.setContentType("text/html; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; image=" + URLEncoder.encode(image, "UTF-8"));
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

	// URI : /lectureThumbnail?name=${lecture.name}&thumbnail=${lecture.thumbnail}
	@GetMapping(value = "/lectureThumbnail")
	public void lectureThumbnail(String name, String thumbnail, HttpServletResponse response) throws Exception {
		String repo = "C:/online/resources/lecture/" + name + "/thumbnail";
		String downImage = repo + "/" + thumbnail;
		File f = new File(downImage);
		response.setContentType("text/html; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; thumbnail=" + URLEncoder.encode(thumbnail, "UTF-8"));
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
}
