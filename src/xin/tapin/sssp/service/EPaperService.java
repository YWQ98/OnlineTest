package xin.tapin.sssp.service;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.EPaper;
import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.repository.EPaperRepository;

@Service
public class EPaperService {

	@Autowired
	private EPaperRepository ePaperRepository;
	
	public EPaper save(EPaper ePaper) 
	{
		return ePaperRepository.saveAndFlush(ePaper);
	}
	@Transactional(readOnly=true)
	public EPaper getByename(String ename) 
	{
		return ePaperRepository.getByename(ename);
	}
	@Transactional(readOnly=true)
	public EPaper getByeid(Integer eid) 
	{
		return ePaperRepository.getByeid(eid);
	}
	@Transactional(readOnly=true)
	public Page<EPaper> findPagEPapers(final Teacher teacher,Integer page)
	{
		PageRequest pageRequest=new PageRequest(page-1, 100);
		Specification<EPaper> specification=new Specification<EPaper>() {
			
			@Override
			public Predicate toPredicate(Root<EPaper> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<Teacher> path=arg0.get("teacher");
				return arg2.equal(path, teacher);
			}
		};
		return ePaperRepository.findAll(specification, pageRequest);
	}

}
