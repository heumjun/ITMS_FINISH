package com.web.admin.smsSendServiceMgr.service;

import java.util.List;
import java.util.Map;

import com.web.common.command.CommandMap;
import com.web.common.service.CommonService;

/**
 * 
 * @파일명	: SmsSendServiceMgrService.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 *  SMS 전송 서비스 	Service	
 * </pre>
 */
public interface SmsSendServiceMgrService extends CommonService
{
	Map<String, Object> smsSendServiceMgrList(CommandMap commandMap);

	List<Map<String, Object>> getUserSelectBoxList(CommandMap commandMap);

	Map<String, String> SaveSmsSendServiceMgr(CommandMap commandMap) throws Exception;
}
