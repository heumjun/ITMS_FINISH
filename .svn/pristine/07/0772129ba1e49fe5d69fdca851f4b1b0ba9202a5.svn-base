package com.web.admin.indiAuthMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명		: IndiAuthMgrDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 4. 12. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		사용자 개별권한 DAO
 * </pre>
 */
@Repository("admin.indiAuthMgr.indiAuthMgrDAO")
public class IndiAuthMgrDAO extends CommonDAO
{

	// 사용자 개별권한 리스트
	public List<Map<String, Object>> indiAuthMgrList(Map<String, Object> map)
	{
		return selectList("IndiAuthMgr.indiAuthMgrList", map);
	}

	// 사용자 개별권한 저장
	public int indiAuthMgrSave(Map<String, Object> pkgParam)
	{
		return update("IndiAuthMgr.indiAuthMgrSave", pkgParam);
	}
	
}
