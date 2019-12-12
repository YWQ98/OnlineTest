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
import xin.tapin.sssp.entity.EPaperDetail;
import xin.tapin.sssp.repository.EPaperDetailRepository;

@Service
public class EPaperDetailService {
	
	@Autowired
	private EPaperDetailRepository ePaperDetailRepository;
	
	public EPaperDetail save(EPaperDetail ePaperDetail) 
	{
		return ePaperDetailRepository.save(ePaperDetail);
	}
	@Transactional(readOnly=true)
	public Page<EPaperDetail> finallEPaperDetail(final EPaper ePaper)
	{
		PageRequest pageRequest=new PageRequest(0, 9999);
		Specification<EPaperDetail> specification=new Specification<EPaperDetail>() {
			
			@Override
			public Predicate toPredicate(Root<EPaperDetail> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> path=arg0.get("ePaper");
				return arg2.equal(path, ePaper);
			}
		};
		return ePaperDetailRepository.findAll(specification, pageRequest);
	}

}
