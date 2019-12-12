package xin.tapin.sssp.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.SType;
import xin.tapin.sssp.repository.STypeRepository;

@Service
public class STypeService {

	@Autowired
	private STypeRepository sTypeRepository;
	
	public Object save(SType sType) 
	{
		return  sTypeRepository.save(sType);
	}
	@Transactional(readOnly=true)
	public SType getBystid(Integer stid) 
	{
		return sTypeRepository.getBystid(stid);
	}
	
	@Transactional(readOnly=true)
	public List<SType> findAll() 
	{
		return sTypeRepository.findAll();
	}
	
	@Transactional(readOnly=true)
	public SType findOneSType(Integer qtid,Integer sjid) 
	{
		SType sType=null;
		List<SType> findAll = sTypeRepository.findAll();
		for (SType sType2 : findAll) {
			if(qtid==sType2.getqType().getQtid() && sjid==sType2.getSubject().getSjid()) 
			{
				sType=sType2;
			}
		}
		return sType;
	}
}
