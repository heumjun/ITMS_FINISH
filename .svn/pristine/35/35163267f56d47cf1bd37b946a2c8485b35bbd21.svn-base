package com.web.admin.smsNoticeMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.smsNoticeMgr.service.SmsNoticeMgrService;
import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명	: SmsNoticeMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 	sms통지이력
 * </pre>
 */
@Controller
public class SmsNoticeMgrController extends CommonController
{
	@Resource(name = "admin.smsNoticeMgr.smsNoticeMgrService")
	private SmsNoticeMgrService	smsNoticeMgrService;

	/**
	 * 
	 * @메소드명	: smsNoticeMgr
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *	sms통지 페이지 이동	
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.smsNoticeMgr.smsNoticeMgr.do")
	public ModelAndView smsNoticeMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: smsNoticeMgrList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *	sms통지 리스트	
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.smsNoticeMgr.smsNoticeMgrList.do")
	public @ResponseBody Map<String, Object> smsNoticeMgrList(CommandMap commandMap)
	{
		return smsNoticeMgrService.getGridList(commandMap);
	}
}
