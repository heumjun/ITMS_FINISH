package com.web.admin.smsSendServiceMgr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.dao.CommonDAO;
import com.web.common.exceptionHandler.CommonException;
import com.web.common.service.CommonServiceImpl;
import com.web.common.util.MessageUtil;
import com.web.common.util.PageUtil;
import com.web.common.util.StringUtil;
import com.web.admin.smsSendServiceMgr.dao.SmsSendServiceMgrDAO;

/**
 * 
 * @파일명	: SmsSendServiceMgrServiceImpl.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 	SMS 전송 서비스 	ServiceImpl	
 * </pre>
 */
@Service("admin.smsSendServiceMgr.smsSendServiceMgrService")
public class SmsSendServiceMgrServiceImpl extends CommonServiceImpl implements SmsSendServiceMgrService
{
	@Resource(name = "admin.smsSendServiceMgr.smsSendServiceMgrDAO")
	private SmsSendServiceMgrDAO smsSendServiceMgrDAO;

	@Resource(name = "commonDAO")
	private CommonDAO	commonDAO;
	
	/**
	 * @메소드명	: smsSendServiceMgrList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명 
	 * 	<pre>
	 *	 SMS 전송 서비스 리스트
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> smsSendServiceMgrList(CommandMap commandMap)
	{
		// 리스트를 취득한다.
		Object pageSize = commandMap.get(Constants.FROM_GRID_PAGE_SIZE);
		Object curPageNo = commandMap.get(Constants.FROM_GRID_CUR_PAGE_NO);
		commandMap.put(Constants.SET_DB_PAGE_SIZE, pageSize);
		commandMap.put(Constants.SET_DB_CUR_PAGE_NO, curPageNo);
		List<Map<String, Object>> listData = smsSendServiceMgrDAO.smsSendServiceMgrList(commandMap.getMap());

		// 리스트 총 사이즈를 구한다.
		Object listRowCnt = listData.size();
		listRowCnt = listData.get(0).get("CNT").toString();
		if (!Constants.NO.equals(commandMap.get(Constants.IS_PAGING)))
		{
			// listRowCnt = getGridListSize(commandMap.getMap());
		}
		// 라스트 페이지를 구한다.
		Object lastPageCnt = "page>total";
		if (!Constants.NO.equals(commandMap.get(Constants.IS_PAGING)))
		{
			lastPageCnt = PageUtil.getPageCount(pageSize, listRowCnt);
		}

		// 결과값 생성
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(Constants.GRID_RESULT_CUR_PAGE, curPageNo);
		result.put(Constants.GRID_RESULT_LAST_PAGE, lastPageCnt);
		result.put(Constants.GRID_RESULT_RECORDS_CNT, listRowCnt);
		result.put(Constants.GRID_RESULT_DATA, listData);

		return result;
	}
	
	/**
	 * @메소드명	: getUserSelectBoxList
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명 
	 * 	<pre>
	 *	 SMS 전송 서비스  화면 그리드 내 사용자 SelectBox 조회		
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */	
	@Override
	public List<Map<String, Object>> getUserSelectBoxList(CommandMap commandMap)
	{
		List<Map<String, Object>> resultList = smsSendServiceMgrDAO.getUserSelectBoxList(commandMap.getMap());
		return resultList;
	}

	/**
	 * @메소드명	: SaveSmsSendServiceMgr
	 * @날짜		: 2018. 5. 04.
	 * @작성자	: LEE BYOUNGJIN
	 * @설명 
	 * 	<pre>
	 *	 SMS 전송 서비스  등록
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public Map<String, String> SaveSmsSendServiceMgr(CommandMap commandMap) throws Exception
	{
		// 제이슨 데이터를 List Map 형식으로 형변환하기 위한 타입참조
		TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>() {};
		
		// 그리드로부터 데이타리스트를 제이슨 형식으로 받아온다.
		String gridDataList = commandMap.get(Constants.FROM_GRID_DATA_LIST).toString();
		commandMap.remove(Constants.FROM_GRID_DATA_LIST);

		// List Map 형식으로 형변환
		List<Map<String, Object>> saveList = new ObjectMapper().readValue(gridDataList, typeRef);

		// 결과값 최초
		String result = Constants.RESULT_FAIL;

		for (Map<String, Object> rowData : saveList)
		{
			// CommandMap에 저장되어있는 DB용 로그인 아이디, 맵퍼네임 등을 설정한다.
			rowData.put(Constants.SET_DB_LOGIN_ID, commandMap.get(Constants.SET_DB_LOGIN_ID));
			rowData.put(Constants.MAPPER_NAME, commandMap.get(Constants.MAPPER_NAME));
			
			// INSERT인경우 중복체크
			if (Constants.INSERT.equals(rowData.get(Constants.FROM_GRID_OPER)))
			{				
				String strIcuiSeqId = (String)rowData.get("icui_seq_id"); 

				if(strIcuiSeqId.equals("ALL") || strIcuiSeqId.equals("E") || strIcuiSeqId.equals("L"))
				{
					List<Map<String, Object>> smUserList = smsSendServiceMgrDAO.getSmUserList(rowData);
				
					for(int inx=0; inx < smUserList.size(); inx++)
					{
						Map<String, Object> rowDataSmUser = smUserList.get(inx);
						
						rowData.put("icui_seq_id", rowDataSmUser.get("seq_id"));
						
						// system.properties 에서 SMS설정이 Y가 되어있어야 발송
						if(StringUtil.nullString(MessageUtil.getMessage("common.smsSendSwitch")).equals("Y")) 
						{
							commonDAO.insert("SaveSmsSendServiceMgr.insert", rowData);
							commonDAO.insert("SaveSmsSendServiceMgr.insert2", rowData);
						}
						
					}	
					
					result = Constants.RESULT_SUCCESS;
				}	
				else
				{
					rowData.put(Constants.SEQ_ID, getSeqType(Constants.SMS_SEQ));
					String result1 = gridDataInsert(rowData);
					String result2 = "";
					
					// system.properties 에서 SMS설정이 Y가 되어있어야 발송
					if(StringUtil.nullString(MessageUtil.getMessage("common.smsSendSwitch")).equals("Y")) 
					{
						if (commonDAO.insert("SaveSmsSendServiceMgr.insert2", rowData) == 0)
						{
							result2 =  Constants.RESULT_FAIL;
						}
						else
						{
							result2 =  Constants.RESULT_SUCCESS;
						}
						
						if(result1.equals(Constants.RESULT_SUCCESS) && result2.equals(Constants.RESULT_SUCCESS))
						{
							result = Constants.RESULT_SUCCESS;
						}	
						else
						{
							result = Constants.RESULT_FAIL;
						}	
					} //system.properties 에서 SMS설정이 Y가 되어있어야 발송 END
				}	
			}
		}
		
		if (result.equals(Constants.RESULT_SUCCESS))
		{
			// 결과값에 따른 메시지를 담아 전송
			return MessageUtil.getResultMessage(result);
		}
		else if (result.equals(Constants.RESULT_FAIL))
		{
			// 실패한경우(실패 메시지가 없는 경우)
			throw new CommonException();
		}
		else
		{
			// 실패한경우(실패 메시지가 있는 경우)
			throw new CommonException(result);
		}
	}
}
