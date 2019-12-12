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

import xin.tapin.sssp.entity.StuPaper;
import xin.tapin.sssp.entity.StuPaperDetail;
import xin.tapin.sssp.repository.StuPaperDetailRepository;

@Service
public class StuPaperDetailService {

	@Autowired
	private StuPaperDetailRepository stuPaperDetailRepository;
	
	
	@Transactional(readOnly=true)
	public StuPaperDetail getByspdid(Integer spdid) 
	{
		return stuPaperDetailRepository.getByspdid(spdid);
	}
	public StuPaperDetail save(StuPaperDetail stuPaperDetail) 
	{
		return stuPaperDetailRepository.saveAndFlush(stuPaperDetail);
	}
	@Transactional(readOnly=true)
	public Page<StuPaperDetail> findStuPaper(final StuPaper paper)
	{
		
		PageRequest pageRequest=new PageRequest(0, 9999);
		Specification<StuPaperDetail> specification=new Specification<StuPaperDetail>() {
			
			@Override
			public Predicate toPredicate(Root<StuPaperDetail> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> path=arg0.get("stuPaper");
				return arg2.equal(path, paper);
			}
		};
		return stuPaperDetailRepository.findAll(specification, pageRequest);
	}

}
