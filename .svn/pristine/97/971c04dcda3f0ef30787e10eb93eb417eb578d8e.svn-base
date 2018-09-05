package com.web.distb.distbMgr.service;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.common.command.CommandMap;
import com.web.common.constants.Constants;
import com.web.common.exceptionHandler.CommonException;
import com.web.common.service.CommonServiceImpl;
import com.web.common.util.MessageUtil;
import com.web.common.util.PageUtil;
import com.web.common.util.StringUtil;
import com.web.distb.distbMgr.dao.DistbMgrDAO;

import net.sf.json.JSONObject;

/**
 * 
 * @파일명		: DistbMgrServiceImpl.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 8. 20. 
 * @작성자		: Cho HeumJun
 * @설명
 * <pre>
 * 		배포 ServiceImpl
 * </pre>
 */
@Service("distb.distbMgr.distbMgrService")
public class DistbMgrServiceImpl extends CommonServiceImpl implements DistbMgrService
{

	@Resource(name = "distb.distbMgr.distbMgrDAO")
	private DistbMgrDAO distbMgrDAO;
	
	/*
	 * 메일 Template 호출
	 */
	@Resource(name = "velocityEngine")
	private VelocityEngine velocityEngine;

	/**
	 * 
	 * @메소드명	: distbRequestList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포신청 리스트	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 */
	@Override
	public Map<String, Object> distbRequestList(CommandMap commandMap)
	{
		// 리스트를 취득한다.
		Object pageSize = commandMap.get(Constants.FROM_GRID_PAGE_SIZE);
		Object curPageNo = commandMap.get(Constants.FROM_GRID_CUR_PAGE_NO);
		commandMap.put(Constants.SET_DB_PAGE_SIZE, pageSize);
		commandMap.put(Constants.SET_DB_CUR_PAGE_NO, curPageNo);
		List<Map<String, Object>> listData = distbMgrDAO.distbRequestList(commandMap.getMap());

		// 리스트 총 사이즈를 구한다.
		Object listRowCnt = listData.size();
		if (listData.size() > 0)
		{
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
	
	/**
	 * 
	 * @메소드명	: distbDelete
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포 신청 삭제	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws CommonException
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public Map<String, String> distbDelete(CommandMap commandMap) throws CommonException
	{
		String result = Constants.RESULT_FAIL;
		
		try {

			String[] p_seq_id = commandMap.get("p_seq_id").toString().split(",");
			
			for (String seq_id : p_seq_id) {
				
				Map<String, Object> pkgParam = new HashMap<String, Object>();

				pkgParam.put(Constants.SET_DB_LOGIN_ID, commandMap.get(Constants.SET_DB_LOGIN_ID));
				pkgParam.put("seq_id", seq_id);
				
				// 그리드에서 선택한 첨부파일 배열
				List<Map<String, Object>> resultList = distbMgrDAO.getAttachFileInfo(pkgParam);
				
				if(resultList.size() > 0) {
					for (Map<String, Object> resultMap : resultList)
					{

						File file = new File((String) resultMap.get("FILE_PATH"));

						if (file.exists())
						{
							if (file.delete())
							{
								System.out.println("파일삭제 성공");
							}
							else
							{
								System.out.println("파일삭제 실패");
							}
						}
						else
						{
							System.out.println("파일이 존재하지 않습니다.");
						}
					}

					// 첨부파일 TABLE에서 삭제 
					int deleteResult = distbMgrDAO.distbAttachDelete(pkgParam);
					if (deleteResult == 0)
					{
						result = Constants.RESULT_FAIL;
					}
					else
					{
						result = Constants.RESULT_SUCCESS;
					}
				}
				
				// 자료실 리스트에서 삭제
				int distbDeleteResult = distbMgrDAO.distbDelete(pkgParam);
				if (distbDeleteResult == 0)
				{
					result = Constants.RESULT_FAIL;
				}
				else
				{
					result = Constants.RESULT_SUCCESS;
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			commandMap.put(Constants.RESULT_MASAGE_KEY, e.getLocalizedMessage());
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
	
	/**
	 * 
	 * @메소드명	: saveDistbRequest
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포신청 등록/수정 저장	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public Map<String, String> saveDistbRequest(CommandMap commandMap) throws Exception
	{
		// 결과값 최초
		String result = Constants.RESULT_FAIL;

		if (commandMap.get("p_seq_id").equals(""))
		{
			// 등록
			// 배포 테이블 SEQ 증가
			String seqId = getSeqType(Constants.DISTB_SEQ);
			commandMap.put(Constants.SEQ_ID, seqId);
			int insertResult = distbMgrDAO.saveDistbRequestInsert(commandMap.getMap());

			if (insertResult == 0)
			{
				result = Constants.RESULT_FAIL;
			}
			else
			{
				result = Constants.RESULT_SUCCESS;
			}
			
			//TODO 메일 보내기(loginId) SET_DB_LOGIN_ID, APPROVAL_ADMIN
			Map<String, String> resultMap = distbMgrDAO.getUserMail(commandMap.getMap());
			
			Template template = velocityEngine.getTemplate("./mailTemplate/distbSendMail.template", "UTF-8");
			VelocityContext velocityContext = new VelocityContext();
			velocityContext.put("conStatus", "R");
			velocityContext.put("title", commandMap.get("p_title"));
			velocityContext.put("contents", commandMap.get("p_contents"));
			velocityContext.put("user_name", resultMap.get("user_name"));
			velocityContext.put("create_date", resultMap.get("create_date"));
			
			StringWriter stringWriter = new StringWriter();
			template.merge(velocityContext, stringWriter);
			
			//commandMap.put("i_sender", "heumjoon.cho@doosan.com");
			//commandMap.put("i_receiver", "byungjin2.lee@doosan.com");
			//commandMap.put("i_receiver", "js.bae@yongkwang.co.kr");
			//commandMap.put("i_receiver", "heumjoon.cho@doosan.com");
			
			commandMap.put("i_sender", resultMap.get("create_mail").toString());
			commandMap.put("i_receiver", resultMap.get("approval_mail").toString());
			commandMap.put("i_message", stringWriter.toString());
			commandMap.put("i_subject", "[ITMS] 배포요청에 따른  승인처리 부탁드립니다.");
			
			if(StringUtil.nullString(MessageUtil.getMessage("distbMgrMail.switch")).equals("Y")) 
			{
				Map<String, String> sendResult = sendMail(commandMap);
				if(sendResult.get(Constants.RESULT_KEY).equals(Constants.RESULT_SUCCESS)) {
					result = Constants.RESULT_SUCCESS;
				} else {
					result = Constants.RESULT_FAIL;
				}
			}
			commandMap.put(Constants.SEQ_ID, seqId);
			
		}
		else
		{
			// 수정
			int updateResult = distbMgrDAO.saveDistbRequestUpdate(commandMap.getMap());

			if (updateResult == 0)
			{
				result = Constants.RESULT_FAIL;
			}
			else
			{
				result = Constants.RESULT_SUCCESS;
			}
		}

		if (result.equals(Constants.RESULT_SUCCESS))
		{
			Map<String, String> map = new HashMap<String, String>();
			map.put(Constants.RESULT_KEY, Constants.RESULT_SUCCESS);
			map.put(Constants.RESULT_MASAGE_KEY, "처리가 완료 되었습니다.");
			map.put("ref_table_seq_id", (String) commandMap.get(Constants.SEQ_ID));
			
			return map;
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
	
	/**
	 * 
	 * @메소드명	: saveDistbAttachFile
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포신청 첨부파일 저장	
	 * 	</pre>
	 * @param commandMap
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public void saveDistbAttachFile(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		MultipartFile mf = null;

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet())
		{
			mf = entity.getValue();
		}

		String uploadDir = MessageUtil.getMessage("distbFile.path");
		File desti = new File(uploadDir);
		if (!desti.exists())
		{
			desti.mkdirs();
		}

		String fileExt = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf('.'));
		String uuidFileName = UUID.randomUUID().toString() + fileExt;
		File uploadFile = new File(uploadDir + uuidFileName);

		commandMap.put("file_path", uploadDir + uuidFileName);
		commandMap.put("file_name", uuidFileName);
		commandMap.put("file_size", mf.getSize());
		commandMap.put("file_type", fileExt);
		commandMap.put("org_file_name", mf.getOriginalFilename());

		// 결과값 최초
		String result = Constants.RESULT_FAIL;

		// 등록
		// 자료실 첨부파일 테이블 SEQ 증가
		commandMap.put(Constants.SEQ_ID, getSeqType(Constants.ATTACH_SEQ));
		int insertResult = distbMgrDAO.saveDistbAttachFileInsert(commandMap.getMap());

		if (insertResult == 0)
		{
			result = Constants.RESULT_FAIL;
		}
		else
		{
			result = Constants.RESULT_SUCCESS;
			try
			{
				mf.transferTo(uploadFile);
			}
			catch (IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
		}

		if (result.equals(Constants.RESULT_SUCCESS))
		{
			// 결과값에 따른 메시지를 담아 전송
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(Constants.RESULT_KEY, Constants.RESULT_SUCCESS);
			map.put(Constants.RESULT_MASAGE_KEY, "처리가 완료 되었습니다.");
			response.setContentType("text/html;charset=utf-8");
			JSONObject jsonObject = JSONObject.fromObject(map);
			response.getWriter().write(jsonObject.toString());
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
	
	/**
	 * 
	 * @메소드명	: getDistb
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포신청 단일건 호출	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 */
	@Override
	public Map<String, String> getDistb(CommandMap commandMap)
	{
		return distbMgrDAO.getDistb(commandMap.getMap());
	}
	
	/**
	 * 
	 * @메소드명	: popUpDistbAttachList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포 View 첨부파일 리스트	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 */
	@Override
	public Map<String, Object> popUpDistbAttachList(CommandMap commandMap)
	{
		// 리스트를 취득한다.
		Object pageSize = commandMap.get(Constants.FROM_GRID_PAGE_SIZE);
		Object curPageNo = commandMap.get(Constants.FROM_GRID_CUR_PAGE_NO);
		commandMap.put(Constants.SET_DB_PAGE_SIZE, pageSize);
		commandMap.put(Constants.SET_DB_CUR_PAGE_NO, curPageNo);
		List<Map<String, Object>> listData = distbMgrDAO.popUpDistbAttachList(commandMap.getMap());

		// 리스트 총 사이즈를 구한다.
		Object listRowCnt = listData.size();
		if (listData.size() > 0)
		{
			listRowCnt = listData.get(0).get("CNT").toString();
		}
		else
		{
			listRowCnt = 0;
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
	 * 
	 * @메소드명	: selectFileInfo
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포 View 첨부파일 단일 건 
	 * 	</pre>
	 * @param commandMap
	 * @return
	 */
	@Override
	public List<Map<String, Object>> selectFileInfo(CommandMap commandMap)
	{
		commandMap.put("p_attach_seq_id", StringUtil.nullString(commandMap.get("p_attach_seq_id")).split(","));
		return distbMgrDAO.selectFileInfo(commandMap.getMap());
	}
	
	/**
	 * 
	 * @메소드명	: updateDistbApproveProcess
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포신청 승인	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public Map<String, String> updateDistbApproveProcess(CommandMap commandMap) throws Exception
	{
		
		String result = Constants.RESULT_FAIL;
		
		try {

			String[] p_seq_id = commandMap.get("p_seq_id").toString().split(",");
			
			for (String seq_id : p_seq_id) {
				
				Map<String, Object> pkgParam = new HashMap<String, Object>();

				pkgParam.put(Constants.SET_DB_LOGIN_ID, commandMap.get(Constants.SET_DB_LOGIN_ID));
				pkgParam.put("p_seq_id", seq_id);
				pkgParam.put("approvalAdmin", commandMap.get("approvalAdmin"));
				
				int updateResult = distbMgrDAO.updateDistbApproveProcess(pkgParam);
				if (updateResult == 0)
				{
					result = Constants.RESULT_FAIL;
				}
				else
				{
					result = Constants.RESULT_SUCCESS;
				}
				
				Map<String, String> resultMap = distbMgrDAO.getDistb(pkgParam);
				
				//TODO 메일 보내기
				Template template = velocityEngine.getTemplate("./mailTemplate/distbSendMail.template", "UTF-8");
				VelocityContext velocityContext = new VelocityContext();
				velocityContext.put("conStatus", "N");
				velocityContext.put("title", resultMap.get("title"));
				velocityContext.put("user_name", resultMap.get("user_name"));
				velocityContext.put("approval_name", resultMap.get("approval_name"));
				velocityContext.put("create_date", resultMap.get("create_date"));
				velocityContext.put("charge_name", resultMap.get("charge_name"));
				velocityContext.put("contents", resultMap.get("contents"));
				velocityContext.put("comments", resultMap.get("comments"));
				StringWriter stringWriter = new StringWriter();
				template.merge(velocityContext, stringWriter);

				
				//pkgParam.put("i_sender", "heumjoon.cho@doosan.com");
				//pkgParam.put("i_receiver", "byungjin2.lee@doosan.com");
				//pkgParam.put("i_receiver", "star4078@naver.com");
				//pkgParam.put("i_receiver", "heumjoon.cho@doosan.com");
				
				pkgParam.put("i_sender", resultMap.get("approval_mail").toString());
				pkgParam.put("i_receiver", resultMap.get("charge_mail").toString());
				pkgParam.put("i_message", stringWriter.toString());
				pkgParam.put("i_subject", "[ITMS] 배포요청에 따른 처리 부탁드립니다.");
				
				commandMap.put("i_sender", pkgParam.get("i_sender"));
				commandMap.put("i_receiver", pkgParam.get("i_receiver"));
				commandMap.put("i_message", pkgParam.get("i_message"));
				commandMap.put("i_subject", pkgParam.get("i_subject"));
				
				if(StringUtil.nullString(MessageUtil.getMessage("distbMgrMail.switch")).equals("Y")) 
				{
					// 오류가 있으면 스탑
					Map<String, String> sendResult = sendMail(commandMap);
					if(sendResult.get(Constants.RESULT_KEY).equals(Constants.RESULT_SUCCESS)) {
						result = Constants.RESULT_SUCCESS;
					} else {
						result = Constants.RESULT_FAIL;
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			commandMap.put(Constants.RESULT_MASAGE_KEY, e.getLocalizedMessage());
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
	
	/**
	 * 
	 * @메소드명	: distbProcessList
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포처리 리스트	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 */
	@Override
	public Map<String, Object> distbProcessList(CommandMap commandMap)
	{
		// 리스트를 취득한다.
		Object pageSize = commandMap.get(Constants.FROM_GRID_PAGE_SIZE);
		Object curPageNo = commandMap.get(Constants.FROM_GRID_CUR_PAGE_NO);
		commandMap.put(Constants.SET_DB_PAGE_SIZE, pageSize);
		commandMap.put(Constants.SET_DB_CUR_PAGE_NO, curPageNo);
		List<Map<String, Object>> listData = distbMgrDAO.distbProcessList(commandMap.getMap());

		// 리스트 총 사이즈를 구한다.
		Object listRowCnt = listData.size();
		if (listData.size() > 0)
		{
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

	/**
	 * 
	 * @메소드명	: updateDistbProcess
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포처리 단일 View	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, String> updateDistbProcess(CommandMap commandMap) throws Exception
	{
		String result = Constants.RESULT_FAIL;
		
		try {
			int updateResult = distbMgrDAO.updateDistbProcess(commandMap.getMap());
			if (updateResult == 0)
			{
				result = Constants.RESULT_FAIL;
			}
			else
			{
				result = Constants.RESULT_SUCCESS;
			}
			
			//TODO 메일 보내기
			Map<String, String> resultMap = distbMgrDAO.getDistb(commandMap.getMap());
			
			Template template = velocityEngine.getTemplate("./mailTemplate/distbSendMail.template", "UTF-8");
			VelocityContext velocityContext = new VelocityContext();
			velocityContext.put("conStatus", "S");
			velocityContext.put("title", resultMap.get("title"));
			velocityContext.put("user_name", resultMap.get("user_name"));
			velocityContext.put("approval_name", resultMap.get("approval_name"));
			velocityContext.put("create_date", resultMap.get("create_date"));
			velocityContext.put("charge_name", resultMap.get("charge_name"));
			velocityContext.put("contents", resultMap.get("contents"));
			velocityContext.put("comments", resultMap.get("comments"));
			velocityContext.put("status", commandMap.get("p_status"));
			
			StringWriter stringWriter = new StringWriter();
			template.merge(velocityContext, stringWriter);
			
			//commandMap.put("i_sender", "heumjoon.cho@doosan.com");
			//commandMap.put("i_receiver", "byungjin2.lee@doosan.com");
			//commandMap.put("i_receiver", "heumjoon.cho@doosan.com");

			commandMap.put("i_sender", resultMap.get("charge_mail").toString());
			commandMap.put("i_receiver", resultMap.get("create_mail").toString());
			commandMap.put("i_message", stringWriter.toString());
			commandMap.put("i_subject", "[ITMS] 배포요청에 따른 처리결과 통보");
			
			Map<String, String> sendResult = new HashMap<String, String>();
			
			if(StringUtil.nullString(MessageUtil.getMessage("distbMgrMail.switch")).equals("Y")) 
			{
				// 오류가 있으면 스탑
				sendResult = sendMail(commandMap);
				if(sendResult.get(Constants.RESULT_KEY).equals(Constants.RESULT_SUCCESS)) {
					result = Constants.RESULT_SUCCESS;
				} else {
					result = Constants.RESULT_FAIL;
				}
			}

			//commandMap.put("i_receiver", "byungjin2.lee@doosan.com");
			//commandMap.put("i_receiver", "heumjoon.cho@doosan.com");
			commandMap.put("i_receiver", resultMap.get("approval_mail").toString());
			
			// 오류가 있으면 스탑
			sendResult = sendMail(commandMap);
			if(sendResult.get(Constants.RESULT_KEY).equals(Constants.RESULT_SUCCESS)) {
				result = Constants.RESULT_SUCCESS;
			} else {
				result = Constants.RESULT_FAIL;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			commandMap.put(Constants.RESULT_MASAGE_KEY, e.getLocalizedMessage());
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
	
	/**
	 * 
	 * @메소드명	: distbAttachFileDelete
	 * @날짜		: 2018. 8. 20.
	 * @작성자		: 조흠준
	 * @설명 
	 * 	<pre>
	 *		배포 View 첨부파일 삭제	
	 * 	</pre>
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public Map<String, String> distbAttachFileDelete(CommandMap commandMap) throws Exception
	{
		// 결과값 최초
		String result = Constants.RESULT_FAIL;

		// 그리드에서 선택한 첨부파일 배열
		commandMap.put("p_attach_seq_id", StringUtil.nullString(commandMap.get("p_attach_seq_id")).split(","));
		List<Map<String, Object>> resultList = distbMgrDAO.selectFileInfo(commandMap.getMap());
		for (Map<String, Object> resultMap : resultList)
		{

			File file = new File((String) resultMap.get("FILE_PATH"));

			if (file.exists())
			{
				if (file.delete())
				{
					System.out.println("파일삭제 성공");
				}
				else
				{
					System.out.println("파일삭제 실패");
				}
			}
			else
			{
				System.out.println("파일이 존재하지 않습니다.");
			}
		}

		int deleteResult = distbMgrDAO.distbAttachFileDelete(commandMap.getMap());
		if (deleteResult == 0)
		{
			result = Constants.RESULT_FAIL;
		}
		else
		{
			result = Constants.RESULT_SUCCESS;
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
