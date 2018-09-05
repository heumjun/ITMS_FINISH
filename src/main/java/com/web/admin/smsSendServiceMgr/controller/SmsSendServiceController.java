package com.web.admin.smsSendServiceMgr.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.common.command.CommandMap;
import com.web.common.controller.CommonController;
import com.web.common.util.MessageUtil;
import com.web.admin.smsSendServiceMgr.service.SmsSendServiceMgrService;

/**
 * 
 * @파일명	: SmsSendServiceController.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 		SMS 전송 서비스 Controller
 * </pre>
 */
@Controller
public class SmsSendServiceController extends CommonController
{
	@Resource(name = "admin.smsSendServiceMgr.smsSendServiceMgrService")
	private SmsSendServiceMgrService smsSendServiceMgrService;
	
	/**
	 * 
	 * @메소드명	: smsSendServiceMgr
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *		SMS 전송 서비스 화면
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.smsSendServiceMgr.smsSendServiceMgr.do")
	public ModelAndView smsSendServiceMgr(CommandMap commandMap)
	{
		commandMap.put("approvalAdmin", MessageUtil.getMessage("approval.admin"));
		return getUserRoleAndLink(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: gtmBonusInfoList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *		SMS 전송 서비스  리스트
	 * </pre>
	 * @param commandMap
	 * @return
	 */
	@RequestMapping(value = "admin.smsSendServiceMgr.smsSendServiceMgrList.do")
	public @ResponseBody Map<String, Object> smsSendServiceMgrList(CommandMap commandMap)
	{
		return smsSendServiceMgrService.smsSendServiceMgrList(commandMap);
	}
	
	/**
	 * 
	 * @메소드명	: getUserSelectBoxList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *		SMS 전송 서비스 화면 그리드 내 사용자 SelectBox
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.smsSendServiceMgr.getUserSelectBoxList.do")
	public @ResponseBody List<Map<String, Object>> getUserSelectBoxList(CommandMap commandMap) throws Exception {
		return smsSendServiceMgrService.getUserSelectBoxList(commandMap);
	}

	/**
	 * 
	 * @메소드명	: SaveSmsSendServiceMgr
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명
	 * <pre>
	 *		SMS 전송 서비스 저장
	 * </pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "admin.smsSendServiceMgr.SaveSmsSendServiceMgr.do")
	public @ResponseBody Map<String, String> SaveSmsSendServiceMgr(CommandMap commandMap) throws Exception
	{
		return smsSendServiceMgrService.SaveSmsSendServiceMgr(commandMap);
	}

}
