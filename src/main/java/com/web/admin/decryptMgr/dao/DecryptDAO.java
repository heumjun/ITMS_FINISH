package com.web.admin.decryptMgr.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.web.common.dao.CommonDAO;

/**
 * 
 * @파일명		: DecryptDAO.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		비밀번호 확인 DAO
 * </pre>
 */
@Repository("admin.decryptMgr.decryptDAO")
public class DecryptDAO extends CommonDAO
{

	// 
	public Map<String, Object> passwdConfirm(Map<String, Object> map)
	{
		return selectOne("Decrypt.passwdConfirm", map);
	}

}
