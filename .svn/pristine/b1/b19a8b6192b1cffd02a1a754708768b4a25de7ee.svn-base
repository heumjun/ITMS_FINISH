package com.web.admin.logMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.logMgr.service.LogMgrService;
import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명		: LogMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 23. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		로그 모니터링 Controller
 * </pre>
 */
@Controller
public class LogMgrController extends CommonController
{

	@Resource(name = "admin.logMgr.logMgrService")
	private LogMgrService logMgrService;

	/**
	 * 
	 * @메소드명	: logMgr
	 * @날짜		: 2018. 8. 23.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		로그 모니터링 화면
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.logMgr.logMgr.do")
	public ModelAndView logMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: loginLogList
	 * @날짜		: 2018. 8. 23.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		로그인 사용자 로그 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.logMgr.loginLogList.do")
	public @ResponseBody Map<String, Object> loginLogList(CommandMap commandMap) throws Exception
	{
		return logMgrService.loginLogList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: errorLogList
	 * @날짜		: 2018. 8. 23.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		에러 로그 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.logMgr.errorLogList.do")
	public @ResponseBody Map<String, Object> errorLogList(CommandMap commandMap) throws Exception
	{
		return logMgrService.errorLogList(commandMap);
	}


}
