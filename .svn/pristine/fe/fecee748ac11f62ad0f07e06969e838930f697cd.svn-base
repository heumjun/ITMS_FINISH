package com.web.distb.distbMgr.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.controller.CommonController;
import com.web.distb.distbMgr.service.DistbMgrService;

/**
 * 
 * @파일명		: DistbMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		배포 Controller
 * </pre>
 */
@Controller
public class DistbMgrController extends CommonController
{

	@Resource(name = "distb.distbMgr.distbMgrService")
	private DistbMgrService distbMgrService;
	
	/**
	 * 
	 * @메소드명	: distbRequest
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포관리 페이지 이동
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.distbRequest.do")
	public ModelAndView distbRequest(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: distbRequestList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.distbRequestList.do")
	public @ResponseBody Map<String, Object> distbRequestList(CommandMap commandMap)
	{
		return distbMgrService.distbRequestList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: distbDelete
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 삭제
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.distbDelete.do")
	public @ResponseBody Map<String, String> distbDelete(CommandMap commandMap) throws Exception
	{
		return distbMgrService.distbDelete(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: popUpNoticeRegiste
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 등록 페이지 이동
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.popUpDistbRegiste.do")
	public ModelAndView popUpNoticeRegiste(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView(
				Constants.DISTB + Constants.DISTB_REG + Constants.POPUP + commandMap.get(Constants.JSP_NAME));
		mav.addAllObjects(commandMap.getMap());

		return mav;
	}
	
	/**
	 * 
	 * @메소드명	: distbChargeSelectBoxDataList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 등록 페이지 - 담당자 리스트 호출
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.distbChargeSelectBoxDataList.do")
	public @ResponseBody String distbChargeSelectBoxDataList(CommandMap commandMap) throws Exception {
		return distbMgrService.getSelectBoxDataList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: saveDistbRequest
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 등록 저장
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.saveDistbRequest.do")
	public @ResponseBody Map<String, String> saveDistbRequest(CommandMap commandMap) throws Exception
	{
		return distbMgrService.saveDistbRequest(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: saveDistbAttachFile
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 첨부파일 저장 
	 * </pre>
	 * @param commandMap
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.saveDistbAttachFile.do")
	public void saveDistbAttachFile(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		distbMgrService.saveDistbAttachFile(commandMap, request, response);
	}
	
	/**
	 * 
	 * @메소드명	: popUpDistbUpdate
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 뷰 페이지
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.popUpDistbUpdate.do")
	public ModelAndView popUpDistbUpdate(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView(
				Constants.DISTB + Constants.DISTB_REG + Constants.POPUP + commandMap.get(Constants.JSP_NAME));
		mav.addAllObjects(commandMap.getMap());
		
		// SEQ 유무에 따른 수정
		mav.addObject("distb", distbMgrService.getDistb(commandMap));

		return mav;
	}
	
	/**
	 * 
	 * @메소드명	: popUpDistbAttachList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 뷰 페이지 첨부파일 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.popUpDistbAttachList.do")
	public @ResponseBody Map<String, Object> popUpDistbAttachList(CommandMap commandMap)
	{
		return distbMgrService.popUpDistbAttachList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: distbAttachFileDownload
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 뷰 페이지 - 첨부파일 다운로드 
	 * </pre>
	 * @param commandMap
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.distbAttachFileDownload.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public void distbAttachFileDownload(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{

		List<Map<String, Object>> resultList = distbMgrService.selectFileInfo(commandMap);

		// 첩부파일 다운로드 목록이 1개 이상일때 ZIP으로 일괄 다운로드
		if (resultList.size() > 1)
		{
			int bufferSize = 1024 * 2;
			String ouputName = URLEncoder.encode((String) commandMap.get("p_title"), "UTF-8");
			
			ZipOutputStream zos = null;
			
			try {
                
			    if (request.getHeader("User-Agent").indexOf("MSIE 5.5") > -1) {
			        response.setHeader("Content-Disposition", "filename=\"" + ouputName + ".zip" + "\";");
			    } else {
			        response.setHeader("Content-Disposition", "attachment; filename=\"" + ouputName + ".zip" + "\";");
			    }
			    response.setHeader("Content-Transfer-Encoding", "binary");
			                
			    OutputStream os = response.getOutputStream();
			    zos = new ZipOutputStream(os); // ZipOutputStream
			    zos.setLevel(8); // 압축 레벨 - 최대 압축률은 9, 디폴트 8
			    BufferedInputStream bis = null;
			    
			    for (Map<String, Object> resultMap : resultList) 
			    {
			        File sourceFile = new File((String) resultMap.get("FILE_PATH"));
			                        
			        bis = new BufferedInputStream(new FileInputStream(sourceFile));
			        ZipEntry zentry = new ZipEntry((String) resultMap.get("ORG_FILE_NAME"));
			        zentry.setTime(sourceFile.lastModified());
			        zos.putNextEntry(zentry);
			        
			        byte[] buffer = new byte[bufferSize];
			        int cnt = 0;
			        while ((cnt = bis.read(buffer, 0, bufferSize)) != -1) {
			            zos.write(buffer, 0, cnt);
			        }
			        zos.closeEntry();
			    }
			               
			    zos.close();
			    bis.close();
			                
			                
			} catch(Exception e){
			    e.printStackTrace();
			}
		}
		// 첨부파일 다운로드 목록이 1개일때
		else
		{
			for (Map<String, Object> resultMap : resultList)
			{

				String filePath = (String) resultMap.get("FILE_PATH");
				String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
				
				File file = new File(filePath);
				
				boolean isExists = file.exists(); 
				if(isExists) 
				{ 
					byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath));

					response.setContentType("application/octet-stream");
					response.setContentLength(fileByte.length);
					response.setHeader("Content-Disposition",
							"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
					response.setHeader("Content-Transfer-Encoding", "binary");
					response.getOutputStream().write(fileByte);

					response.getOutputStream().flush();
					response.getOutputStream().close();
				} 
				else 
				{ 
					response.setCharacterEncoding("utf-8");
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().println("<script type='text/javascript'>"
							+ "alert('첨부파일이 존재하지 않습니다.');"
							//+ "location.href='#';"
							+ "history.back();"
							+ "</script>");
					response.getWriter().flush();
					response.getWriter().close();
					
				}
			}
		}

	}
	
	/**
	 * 
	 * @메소드명	: updateDistbApproveProcess
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포신청 승인
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.updateDistbApproveProcess.do")
	public @ResponseBody Map<String, String> updateDistbApproveProcess(CommandMap commandMap) throws Exception
	{
		return distbMgrService.updateDistbApproveProcess(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: distbAttachFileDelete
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포 첨부파일 삭제
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.distbAttachFileDelete.do")
	public @ResponseBody Map<String, String> distbAttachFileDelete(CommandMap commandMap) throws Exception
	{
		return distbMgrService.distbAttachFileDelete(commandMap);
	}
	
	
	/***********************************************************************************************************/
	/**
	 * 
	 * @메소드명	: distbProcess
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포처리 페이지
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.distbProcess.do")
	public ModelAndView distbProcess(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: distbProcessList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포처리 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.distbProcessList.do")
	public @ResponseBody Map<String, Object> distbProcessList(CommandMap commandMap)
	{
		return distbMgrService.distbProcessList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: popUpDistbProcessUpdate
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포처리 하기 위한 View 페이지 
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "distb.distbMgr.popUpDistbProcessUpdate.do")
	public ModelAndView popUpDistbProcessUpdate(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView(
				Constants.DISTB + Constants.DISTB_REG + Constants.POPUP + commandMap.get(Constants.JSP_NAME));
		mav.addAllObjects(commandMap.getMap());
		
		// SEQ 유무에 따른 수정
		mav.addObject("distb", distbMgrService.getDistb(commandMap));

		return mav;
	}
	
	/**
	 * 
	 * @메소드명	: updateDistbProcess
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		배포처리 - 처리 프로세스 
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "distb.distbMgr.updateDistbProcess.do")
	public @ResponseBody Map<String, String> updateDistbProcess(CommandMap commandMap) throws Exception
	{
		return distbMgrService.updateDistbProcess(commandMap);
	}
	
	
}
