package com.web.admin.decryptMgr.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.admin.decryptMgr.service.DecryptService;
import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;

/**
 * 
 * @파일명		: DecryptController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		비밀번호 확인 Controller
 * </pre>
 */
@Controller
public class DecryptController extends CommonController
{

	@Resource(name = "admin.decryptMgr.decryptService")
	private DecryptService decryptService;

	/**
	 * 
	 * @메소드명	: decryptMgr
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		비밀번호 확인 페이지
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.decryptMgr.decrypt.do")
	public ModelAndView decryptMgr(CommandMap commandMap)
	{
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: passwdConfirm
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: Cho HeumJun
	 * @설명
	 * <pre>
	 *		비밀번호 확인 Action
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.decryptMgr.passwdConfirm.do")
	public @ResponseBody Map<String, String> passwdConfirm(CommandMap commandMap) throws Exception
	{
		return decryptService.passwdConfirm(commandMap);
	}
	
	

}
