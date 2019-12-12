package xin.tapin.sssp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.Subject;
import xin.tapin.sssp.repository.SubjectRepository;

@Service
public class SubjectService {

	@Autowired
	private SubjectRepository subjectRepository;
	public Object save(Subject subject) 
	{
		return subjectRepository.save(subject);
	}
	@Transactional(readOnly=true)
	public Subject getBysjid(Integer sjid) 
	{
		return subjectRepository.getBysjid(sjid);
	}
	
	@Transactional(readOnly=true)
	public Subject getBysjname(String sjname) 
	{
		return subjectRepository.getBysjname(sjname);
	}
	
	@Transactional(readOnly=true)
	public List<Subject> findAll()
	{
		return subjectRepository.findAll();
	}
}
