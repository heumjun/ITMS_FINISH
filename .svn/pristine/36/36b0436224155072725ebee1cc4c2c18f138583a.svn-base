package com.web.admin.mailNoticeMgr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.admin.mailNoticeMgr.dao.MailNoticeMgrDAO;
import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.service.CommonServiceImpl;
import com.web.common.util.PageUtil;

@Service("admin.mailNoticeMgr.mailNoticeMgrService")
public class MailNoticeMgrServiceImpl extends CommonServiceImpl implements MailNoticeMgrService
{

	@Resource(name = "admin.mailNoticeMgr.mailNoticeMgrDAO")
	private MailNoticeMgrDAO mailNoticeMgrDAO;

	@Override
	public Map<String, Object> mailNoticeMgrList(CommandMap commandMap) throws Exception
	{
		//commandMap.put(Constants.IS_PAGING, Constants.NO);
		
		// 리스트를 취득한다.
		Object pageSize = commandMap.get(Constants.FROM_GRID_PAGE_SIZE);
		Object curPageNo = commandMap.get(Constants.FROM_GRID_CUR_PAGE_NO);
		commandMap.put(Constants.SET_DB_PAGE_SIZE, pageSize);
		commandMap.put(Constants.SET_DB_CUR_PAGE_NO, curPageNo);
		List<Map<String, Object>> listData = mailNoticeMgrDAO.mailNoticeMgrList(commandMap.getMap());

		// 리스트 총 사이즈를 구한다.
		Object listRowCnt = listData.size();
		if(listData.size() > 0) {
			listRowCnt = listData.get(0).get("CNT").toString();
		} 
		else 
		{
			listRowCnt = 0;
		}
		
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

	@Override
	public Map<String, Object> getMailNotice(CommandMap commandMap) throws Exception
	{
		return mailNoticeMgrDAO.getMailNotice(commandMap.getMap());
	}

}
