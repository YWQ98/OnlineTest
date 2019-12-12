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

import xin.tapin.sssp.entity.Option;
import xin.tapin.sssp.entity.QItem;
import xin.tapin.sssp.repository.OptionRepository;

@Service
public class OptionService {

	@Autowired
	private OptionRepository optionRepository;
	
	public Option save(Option option) 
	{
		return  optionRepository.save(option);
	}
	
	@Transactional(readOnly=true)
	public Page<Option> finqItem(final QItem qItem)
	{
		PageRequest pageRequest=new PageRequest(0, 9999);
		Specification<Option> specification=new Specification<Option>() {
			
			@Override
			public Predicate toPredicate(Root<Option> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> path=arg0.get("qItem");
				return arg2.equal(path, qItem);
			}
		};
		return optionRepository.findAll(specification, pageRequest);
	}

}
