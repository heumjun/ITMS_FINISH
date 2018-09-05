package com.web.admin.logMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명		: LogMgrDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 23. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		로그 모니터링 DAO
 * </pre>
 */
@Repository("admin.logMgr.logMgrDAO")
public class LogMgrDAO extends CommonDAO
{

	public List<Map<String, Object>> loginLogList(Map<String, Object> map)
	{
		return selectList("LogMgr.loginLogList", map);
	}

	public List<Map<String, Object>> errorLogList(Map<String, Object> map)
	{
		return selectList("LogMgr.errorLogList", map);
	}

}
