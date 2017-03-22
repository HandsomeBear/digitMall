package com.sh.mall.service.impl.admin;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sh.mall.domain.DigitAdmin;
import com.sh.mall.domain.DigitDetail;
import com.sh.mall.repository.admin.IDigitDAO;
import com.sh.mall.service.admin.IDigitService;
import com.sh.mall.util.PageUtil;

@Service
public class DigitServiceImpl implements IDigitService{
	private static final Logger logger = LoggerFactory.getLogger(DigitServiceImpl.class);
	
	@Autowired
	private IDigitDAO adigitDAO;

	@Override
	public String getDataAmount(Map<String, String> con) throws Exception {
		logger.info("Execute getDataAmount");
		
		return adigitDAO.getDataAmount(con);
	}

	@Override
	public List<DigitDetail> showDigitList(PageUtil pageUtil, Map<String, String> con) throws Exception {
		logger.info("Execute showDigitList");
		
		return adigitDAO.showDigitList(pageUtil, con);
	}

	@Override
	public List<DigitAdmin> showMoreInfo(String digital_id) throws Exception {
		logger.info("Execute showMoreInfo");
		
		return adigitDAO.showMoreInfo(digital_id);
	}

	@Override
	public void updateDigit(DigitDetail detail) throws Exception {
		logger.info("Execute updateDigit");
		
		adigitDAO.updateDigit(detail);
	}

	@Override
	@Transactional
	public void updateDigitExt(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute updateDigitExt");
		
		adigitDAO.updateDigitExt(digitAdmin);
	}

	@Override
	@Transactional
	public void deleteOne(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute deleteOne");
		
		adigitDAO.deleteOne(digitAdmin);
	}

	@Override
	@Transactional
	public String addDigit(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute addDigit");
		
		return adigitDAO.addDigit(digitAdmin);
	}

	@Override
	public void addExt(DigitAdmin digitAdmin) throws Exception {
		logger.info("Execute addExt");
		
		adigitDAO.addExt(digitAdmin);
	}

	@Override
	@Transactional
	public void down(String digital_id) throws Exception {
		logger.info("Execute down");
		
		adigitDAO.down(digital_id);
	}
}
