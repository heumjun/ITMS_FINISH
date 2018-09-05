package com.web.admin.holidayMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.holidayMgr.service.HolidayMgrService;
import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명		: HolidayMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 6. 29. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		공휴일 관리 Controller
 * </pre>
 */
@Controller
public class HolidayMgrController  extends CommonController
{
	
	@Resource(name = "admin.holidayMgr.holidayMgrService")
	private HolidayMgrService holidayMgrService;

	/**
	 * 
	 * @메소드명	: holidayMgr
	 * @날짜		: 2018. 6. 29.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		공휴일 관리 페이지
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.holidayMgr.holidayMgr.do")
	public ModelAndView holidayMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: holidayMgrList
	 * @날짜		: 2018. 6. 29.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		공휴일 관리 리스트	
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.holidayMgr.holidayMgrList.do")
	public @ResponseBody Map<String, Object> holidayMgrList(CommandMap commandMap)
	{
		return holidayMgrService.holidayMgrList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: SaveHolidayMgr
	 * @날짜		: 2018. 6. 29.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		공휴일 관리 저장
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.holidayMgr.SaveHolidayMgr.do")
	public @ResponseBody Map<String, String> SaveHolidayMgr(CommandMap commandMap) throws Exception
	{
		return holidayMgrService.SaveHolidayMgr(commandMap);
	}
	
	
}
