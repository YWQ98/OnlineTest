package xin.tapin.sssp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.QType;
import xin.tapin.sssp.repository.QTypeRepository;

@Service
public class QtypeService {

	@Autowired
	private QTypeRepository qTypeRepository;
	
	public Object sava(QType qType) 
	{
		return qTypeRepository.saveAndFlush(qType);
	}
	@Transactional(readOnly=true)
	public QType getByqitd(Integer qtid) 
	{
		return qTypeRepository.getByqtid(qtid);
	}
	
	@Transactional(readOnly=true)
	public List<QType> findAll()
	{
		return qTypeRepository.findAll();
	}

}
