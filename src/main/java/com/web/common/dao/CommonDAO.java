package com.web.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @파일명 : CommonDAO.java
 * @프로젝트 : ITMS
 * @날짜 : 2018. 3. 28.
 * @작성자 : Cho HeumJun
 * @설명
 * 
 *     <pre>
 * 		공통 DAO
 *     </pre>
 */
@Repository("commonDAO")
public class CommonDAO
{
	protected Log				log	= LogFactory.getLog(CommonDAO.class);

	@Autowired
	private SqlSessionTemplate	itsmSession;
	
	@Autowired
	private SqlSessionTemplate	erpSession;

	/**
	 * 
	 * @메소드명 : printQueryId
	 * @날짜 : 2018. 3. 28.
	 * @작성자 : Cho HeumJun
	 * @설명
	 * 
	 *     <pre>
	 *     로그출력
	 *     </pre>
	 * 
	 * @param queryId
	 */
	protected void printQueryId(String queryId)
	{
		if (log.isDebugEnabled())
		{
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	protected void printQueryIdERP(String queryId)
	{
		if (log.isDebugEnabled())
		{
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public int insert(String queryId, Object params)
	{
		printQueryId(queryId);
		return itsmSession.insert(queryId, params);
	}

	public int update(String queryId, Object params)
	{
		printQueryId(queryId);
		return itsmSession.update(queryId, params);
	}

	public int delete(String queryId, Object params)
	{
		printQueryId(queryId);
		return itsmSession.delete(queryId, params);
	}

	public Object selectOne(String queryId)
	{
		printQueryId(queryId);
		return itsmSession.selectOne(queryId);
	}

	public <T> T selectOne(String queryId, Object params)
	{
		printQueryId(queryId);
		return itsmSession.selectOne(queryId, params);
	}

	public List<Object> selectList(String queryId)
	{
		printQueryId(queryId);
		return itsmSession.selectList(queryId);
	}

	public List<Map<String, Object>> selectList(String queryId, Object params)
	{
		printQueryId(queryId);
		return itsmSession.selectList(queryId, params);
	}
	
	// ERP Session
	public int insertErp(String queryId, Object params)
	{
		printQueryIdERP(queryId);
		return erpSession.insert(queryId, params);
	}

	public int updateErp(String queryId, Object params)
	{
		printQueryIdERP(queryId);
		return erpSession.update(queryId, params);
	}

	public int deleteErp(String queryId, Object params)
	{
		printQueryIdERP(queryId);
		return erpSession.delete(queryId, params);
	}

	public Object selectOneErp(String queryId)
	{
		printQueryIdERP(queryId);
		return erpSession.selectOne(queryId);
	}

	public <T> T selectOneErp(String queryId, Object params)
	{
		printQueryIdERP(queryId);
		return erpSession.selectOne(queryId, params);
	}

	public List<Object> selectListErp(String queryId)
	{
		printQueryIdERP(queryId);
		return erpSession.selectList(queryId);
	}

	public List<Map<String, Object>> selectListErp(String queryId, Object params)
	{
		printQueryIdERP(queryId);
		erpSession.update("WipChkMgrTab1.sessionLangUpdate", params);
		return erpSession.selectList(queryId, params);
	}

	// 받는 사람 메일주소
	public Map<String, String> getUserMail(Map<String, Object> map)
	{
		return selectOne("UserMail.getUserMail", map);
	}
	
	// 메일 발송
	public void sendMail(Map<String, Object> map)
	{
		selectOneErp("MailSend.sendMail", map);
	}
	public int mailHistoryInsert(Map<String, Object> map)
	{
		return insert("MailSend.mailHistoryInsert", map);
	}
	
	// SMS 발송
	public int smsSend(Map<String, Object> map)
	{
		return itsmSession.insert("SmsSend.sendSms", map);
	}

	public int smsSendHistory(Map<String, Object> map)
	{
		return itsmSession.insert("SmsSend.smsSendHistory", map);
	}

}