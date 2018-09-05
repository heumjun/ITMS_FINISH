package com.web.admin.decryptMgr.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.admin.decryptMgr.dao.DecryptDAO;
import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.service.CommonServiceImpl;
import com.web.common.util.CodeUtil;

/**
 * 
 * @파일명		: DecryptServiceImpl.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		비밀번호 확인 ServiceImpl
 * </pre>
 */
@Service("admin.decryptMgr.decryptService")
public class DecryptServiceImpl extends CommonServiceImpl implements DecryptService
{
	@Resource(name = "admin.decryptMgr.decryptDAO")
	private DecryptDAO decryptDAO;

	/**
	 * 
	 * @메소드명	: passwdConfirm
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		비밀번호 확인	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, String> passwdConfirm(CommandMap commandMap) throws Exception
	{
		Map<String, String> map = new HashMap<String, String>();
		Map<String, Object> resultMap = decryptDAO.passwdConfirm(commandMap.getMap());
		
		if (resultMap != null)
		{
			// 아아디와 이름이 일치
			map.put(Constants.RESULT_KEY, Constants.RESULT_SUCCESS);
			map.put(Constants.RESULT_MASAGE_KEY, "");
			map.put("password", CodeUtil.decrypt((String) resultMap.get("password") ));
		} 
		else 
		{
			// 아아디와 이름이 불일치
			map.put(Constants.RESULT_KEY, Constants.RESULT_FAIL);
			map.put(Constants.RESULT_MASAGE_KEY, "이름 혹은 아이디가 일치하지 않습니다.");
			map.put("password", "");
		}

		return map;
	}
}
