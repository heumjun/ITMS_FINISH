package com.web.common.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.common.util.MessageUtil;

/**
 * 
 * @파일명		: EditorController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		CK Editor Controller
 * </pre>
 */
@Controller
public class EditorController
{
	
	/**
	 * 
	 * @메소드명	: communityImageUpload
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		CK Editor 이미지 업로드
	 * </pre>
	 * @param request
	 * @param response
	 * @param upload
	 */
	@RequestMapping(value = "/community/imageUpload.do", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
	{

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//String root_path = (request.getSession().getServletContext().getRealPath("/")).replace("\\", "/");
		//String root_path = request.getSession().getServletContext().getRealPath("ckeditorImg").replace("\\", "/");
		
		String root_path = MessageUtil.getMessage("bbsFile.path");
		//String attach_path = "ckeditorImg\\";
		
		// 프로퍼티에서 가져온 물리적 저장 위치
		// 폴더 유무 체크 - 없으면 생성
		File desti = new File(root_path);
		if (!desti.exists())
		{
			desti.mkdirs();
		}

		try
		{
			String fileExt = upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf('.'));
			String uuidFileName = UUID.randomUUID().toString() + fileExt;
			//String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = root_path + uuidFileName; // 저장경로

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			// 에디터에서 URL 호출시 ckeditorImg/ 로 시작하면 
			// 물리적 저장 파일에서 부터 WAS가 읽어드림. 
			// Tomcat doBase에 설정 되어있음.
			printWriter = response.getWriter();
			String fileUrl = "ckeditorImg/" + uuidFileName; //uploadPath.replace("\\", "/"); //url 경로

			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
				+ callback
				+ ",'"
				+ fileUrl
				+ "','이미지를 업로드 하였습니다.'"
				+ ")</script>");
			printWriter.flush();

		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if (out != null)
				{
					out.close();
				}
				if (printWriter != null)
				{
					printWriter.close();
				}
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}

		return;
	}
}
