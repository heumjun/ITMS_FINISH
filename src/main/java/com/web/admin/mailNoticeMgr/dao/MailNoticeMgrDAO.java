package com.web.admin.mailNoticeMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

@Repository("admin.mailNoticeMgr.mailNoticeMgrDAO")
public class MailNoticeMgrDAO extends CommonDAO
{

	public List<Map<String, Object>> mailNoticeMgrList(Map<String, Object> map)
	{
		return selectList("MailMgr.mailNoticeMgrList", map);
	}

	public Map<String, Object> getMailNotice(Map<String, Object> map)
	{
		return selectOne("MailMgr.getMailNotice", map);
	}
		
}
