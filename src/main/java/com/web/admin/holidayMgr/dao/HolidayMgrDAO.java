package com.web.admin.holidayMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명		: HolidayMgrDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 6. 29. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		공휴일 관리 DAO
 * </pre>
 */
@Repository("admin.holidayMgr.holidayMgrDAO")
public class HolidayMgrDAO extends CommonDAO
{

	public List<Map<String, Object>> holidayMgrList(Map<String, Object> map)
	{
		return selectList("HolidayMgr.holidayMgrList", map);
	}
		
}
