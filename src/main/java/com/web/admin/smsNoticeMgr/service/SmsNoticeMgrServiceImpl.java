package com.web.admin.smsNoticeMgr.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.admin.smsNoticeMgr.dao.SmsNoticeMgrDAO;
import com.web.common.service.CommonServiceImpl;

/**
 * 
 * @파일명	: SmsNoticeMgrServiceImpl.java 
 * @프로젝트	: ITMS
 * @날짜		: 2018. 5. 04.
 * @작성자	: LEE BYOUNGJIN
 * @설명
 * <pre>
 * 	sms통지이력
 * </pre>
 */
@Service("admin.smsNoticeMgr.smsNoticeMgrService")
public class SmsNoticeMgrServiceImpl extends CommonServiceImpl implements SmsNoticeMgrService
{

	@Resource(name = "admin.smsNoticeMgr.smsNoticeMgrDAO")
	private SmsNoticeMgrDAO smsNoticeMgrDAO;
	

}
