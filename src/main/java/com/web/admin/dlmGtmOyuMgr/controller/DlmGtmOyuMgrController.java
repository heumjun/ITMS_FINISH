package com.web.admin.dlmGtmOyuMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.dlmGtmOyuMgr.service.DlmGtmOyuMgrService;
import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명	: DlmGtmOyuMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 	배치스케쥴이력
 * </pre>
 */
@Controller
public class DlmGtmOyuMgrController extends CommonController
{
	@Resource(name = "admin.dlmGtmOyuMgr.dlmGtmOyuMgrService")
	private DlmGtmOyuMgrService	 dlmGtmOyuMgrService;

	/**
	 * 
	 * @메소드명	: dlmGtmOyuMgr
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *	배치스케쥴이력 페이지 이동	
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.dlmGtmOyuMgr.dlmGtmOyuMgr.do")
	public ModelAndView dlmGtmOyuMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: dlmGtmOyuMgrList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *	배치스케쥴이력 리스트	
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.dlmGtmOyuMgr.dlmGtmOyuMgrList.do")
	public @ResponseBody Map<String, Object> dlmGtmOyuMgrList(CommandMap commandMap)
	{
		return dlmGtmOyuMgrService.getGridList(commandMap);
	}
}
