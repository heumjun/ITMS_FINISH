package com.web.common.util;

import javax.annotation.Resource;

import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.dao.CommonDAO;
import com.web.common.exceptionHandler.CommonException;
import com.web.common.service.CommonServiceImpl;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

public class SmsUtil extends CommonServiceImpl
{
	
	@Resource(name = "commonDAO")
	private static CommonDAO commonDAO;
	
	@Resource(name = "egovIdSqtype008GnrService")
	private static EgovIdGnrService	egovIdGnrService008;
	
	public static void sendSMS(CommandMap commandMap) throws CommonException 
	{
		// system.properties 에서 SMS설정이 Y가 되어있어야 발송
		if(StringUtil.nullString(MessageUtil.getMessage("common.smsSendSwitch")).equals("Y")) 
		{
			// 결과값 최초
			String result = Constants.RESULT_SUCCESS;
			
			// 받는 사람
			commandMap.get(Constants.SEND_PHONE);
			// 메세지
			commandMap.get(Constants.MSG_BODY);
			
			try
			{
				int smsInsertResult = commonDAO.smsSend(commandMap.getMap());
				if (smsInsertResult == 0)
				{
					result = Constants.RESULT_FAIL;
				}
				else
				{
					result = Constants.RESULT_SUCCESS;
				}
				
				// SMS 발송 이력
				// SEQ 취득
				commandMap.put(Constants.SEQ_ID, egovIdGnrService008.getNextStringId());
	
				// 근태관리 타입 : B
				commandMap.put(Constants.SMS_TYPE, commandMap.get(Constants.SMS_TYPE));
				
				int smsSendHistoryResult = commonDAO.smsSendHistory(commandMap.getMap());
				if (smsSendHistoryResult == 0)
				{
					result = Constants.RESULT_FAIL;
				}
				else
				{
					result = Constants.RESULT_SUCCESS;
				}
				
				if (result.equals(Constants.RESULT_SUCCESS))
				{
					//Map<String, String> map = new HashMap<String, String>();
					//map.put(Constants.RESULT_KEY, Constants.RESULT_SUCCESS);
					//map.put(Constants.RESULT_MASAGE_KEY, "처리가 완료 되었습니다.");
					//map.put("ref_table_seq_id", (String) commandMap.get(Constants.SEQ_ID));
					//
					//return map;
					System.out.println("메일전송성공");
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
			catch (FdlException e)
			{
				e.printStackTrace();
				// 실패한경우(실패 메시지가 없는 경우)
				throw new CommonException();
			}
			
		}
	}
}
