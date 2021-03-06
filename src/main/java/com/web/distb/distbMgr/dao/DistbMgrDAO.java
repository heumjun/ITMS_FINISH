package com.web.distb.distbMgr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명		: DistbMgrDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		배포 DAO
 * </pre>
 */
@Repository("distb.distbMgr.distbMgrDAO")
public class DistbMgrDAO extends CommonDAO
{

	public List<Map<String, Object>> distbRequestList(Map<String, Object> map)
	{
		return selectList("DistbMgr.distbRequestList", map);
	}

	public int saveDistbRequestInsert(Map<String, Object> map)
	{
		return insert("DistbMgr.distbRequestInsert", map);
	}

	public int saveDistbRequestUpdate(Map<String, Object> map)
	{
		return update("DistbMgr.distbRequestUpdate", map);
	}
	
	public int saveDistbAttachFileInsert(Map<String, Object> map)
	{
		return insert("DistbMgr.saveDistbAttachFileInsert", map);
	}
	
	public Map<String, String> getDistb(Map<String, Object> map)
	{
		return selectOne("DistbMgr.getDistb", map);
	}
	
	public List<Map<String, Object>> popUpDistbAttachList(Map<String, Object> map)
	{
		return selectList("DistbMgr.popUpDistbAttachList", map);
	}
	
	public List<Map<String, Object>> selectFileInfo(Map<String, Object> map)
	{
		return selectList("DistbMgr.selectFileInfo", map);
	}
	
	public List<Map<String, Object>> getAttachFileInfo(Map<String, Object> map)
	{
		return selectList("DistbMgr.getAttachFileInfo", map);
	}
	
	public int distbAttachDelete(Map<String, Object> map)
	{
		return delete("DistbMgr.distbAttachDelete", map);
	}

	public int distbDelete(Map<String, Object> map)
	{
		return delete("DistbMgr.distbDelete", map);
	}
	
	public int updateDistbApproveProcess(Map<String, Object> map)
	{
		return update("DistbMgr.updateDistbApproveProcess", map);
	}

	public List<Map<String, Object>> distbProcessList(Map<String, Object> map)
	{
		return selectList("DistbMgr.distbProcessList", map);
	}

	public int updateDistbProcess(Map<String, Object> map)
	{
		return update("DistbMgr.updateDistbProcess", map);
	}

	public int distbAttachFileDelete(Map<String, Object> map)
	{
		return delete("DistbMgr.distbAttachFileDelete", map);
	}

}
