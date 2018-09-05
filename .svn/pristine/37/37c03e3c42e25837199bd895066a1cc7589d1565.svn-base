package com.web.distb.distbMgr.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.common.command.CommandMap;
import com.web.common.service.CommonService;

/**
 * 
 * @파일명		: DistbMgrService.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		배포 Service
 * </pre>
 */
public interface DistbMgrService extends CommonService
{

	Map<String, Object> distbRequestList(CommandMap commandMap);
	
	Map<String, String> distbDelete(CommandMap commandMap) throws Exception;
	
	Map<String, String> saveDistbRequest(CommandMap commandMap) throws Exception;
	
	void saveDistbAttachFile(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	Map<String, String> getDistb(CommandMap commandMap);
	
	// 배포 첨부파일 리스트
	Map<String, Object> popUpDistbAttachList(CommandMap commandMap);
	
	// 배포 파일정보
	List<Map<String, Object>> selectFileInfo(CommandMap commandMap);
	
	Map<String, String> updateDistbApproveProcess(CommandMap commandMap) throws Exception;

	Map<String, Object> distbProcessList(CommandMap commandMap);

	Map<String, String> updateDistbProcess(CommandMap commandMap) throws Exception;

	Map<String, String> distbAttachFileDelete(CommandMap commandMap) throws Exception;
	
}
