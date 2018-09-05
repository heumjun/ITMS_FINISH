package com.web.admin.mailNoticeMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.mailNoticeMgr.service.MailNoticeMgrService;
import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명		: MailNoticeMgrController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 31. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		메일 모니터링 Controller
 * </pre>
 */
@Controller
public class MailNoticeMgrController extends CommonController
{
	@Resource(name = "admin.mailNoticeMgr.mailNoticeMgrService")
	private MailNoticeMgrService	 mailNoticeMgrService;

	/**
	 * 
	 * @메소드명	: mailNoticeMgr
	 * @날짜		: 2018. 8. 31.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		메일 모니터링 페이지
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.mailNoticeMgr.mailNoticeMgr.do")
	public ModelAndView mailNoticeMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: mailNoticeMgrList
	 * @날짜		: 2018. 8. 31.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		메일 모니터링 리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.mailNoticeMgr.mailNoticeMgrList.do")
	public @ResponseBody Map<String, Object> mailNoticeMgrList(CommandMap commandMap) throws Exception
	{
		return mailNoticeMgrService.mailNoticeMgrList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: popUpNoticeRegiste
	 * @날짜		: 2018. 8. 31.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		메일 모니터링 상세페이지 팝업
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "admin.mailNoticeMgr.popUpMailNoticeMgr.do")
	public ModelAndView popUpMailNoticeMgr(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView(
				"/admin/mailNoticeMgr" + Constants.POPUP + commandMap.get(Constants.JSP_NAME));
		mav.addAllObjects(commandMap.getMap());

		// SEQ 유무에 따른 수정
		mav.addObject("mailNotice", mailNoticeMgrService.getMailNotice(commandMap));
		
		return mav;
	}
}
