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

import xin.tapin.sssp.entity.QItem;
import xin.tapin.sssp.entity.SType;
import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.repository.QItemRepository;

@Service
public class QItemService {

	@Autowired
	private QItemRepository qItemRepository;
	
	public QItem save(QItem qitem) 
	{
		return qItemRepository.save(qitem);
	}
	@Transactional(readOnly=true)
	public QItem getByqiid(Integer qiid) 
	{
		return qItemRepository.getByqiid(qiid);
	}
	
	@Transactional(readOnly=true)
	public Page<QItem> getBySType(final SType sType)
	{
		PageRequest pageRequest=new PageRequest(0, 9999);
		Specification<QItem> specification=new Specification<QItem>() {
			
			@Override
			public Predicate toPredicate(Root<QItem> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<SType> theme =arg0.get("sType");
				return arg2.equal(theme, sType);
			}
		};
		return qItemRepository.findAll(specification, pageRequest);
	}
	
	@Transactional(readOnly=true)
	public Page<QItem> getBySType(final SType sType,Integer page)
	{
		PageRequest pageRequest=new PageRequest(page-1, 3);
		Specification<QItem> specification=new Specification<QItem>() {
			
			@Override
			public Predicate toPredicate(Root<QItem> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<SType> theme =arg0.get("sType");
				return arg2.equal(theme, sType);
			}
		};
		return qItemRepository.findAll(specification, pageRequest);
	}
	
	
}
