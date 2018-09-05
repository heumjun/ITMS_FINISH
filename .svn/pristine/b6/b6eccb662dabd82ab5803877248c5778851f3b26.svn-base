package com.web.admin.smsSendServiceMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명	: SmsSendServiceMgrDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 		
 * </pre>
 */
@Repository("admin.smsSendServiceMgr.smsSendServiceMgrDAO")
public class SmsSendServiceMgrDAO extends CommonDAO
{
	public List<Map<String, Object>> smsSendServiceMgrList(Map<String, Object> map)
	{
		return selectList("SmsSendServiceMgr.smsSendServiceMgrList", map);
	}
	
	public List<Map<String, Object>> getUserSelectBoxList(Map<String, Object> map)
	{
		return selectList("SmsSendServiceMgr.getUserSelectBoxList", map);
	}	
	
	public List<Map<String, Object>> getSmUserList(Map<String, Object> map)
	{
		return selectList("SmsSendServiceMgr.getSmUserList", map);
	}		
}
