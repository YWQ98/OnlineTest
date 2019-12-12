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

import xin.tapin.sssp.entity.Answer;
import xin.tapin.sssp.entity.QItem;
import xin.tapin.sssp.repository.AnswerRepository;

@Service
public class AnswerService {

	@Autowired
	private AnswerRepository answerRepository;
	
	@Transactional(readOnly=true)
	public Page<Answer> findAnswer(final QItem qItem) 
	{
		PageRequest pageRequest=new PageRequest(0, 1);
		Specification<Answer> specification=new Specification<Answer>() {
			
			@Override
			public Predicate toPredicate(Root<Answer> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> path=arg0.get("item");
				return arg2.equal(path, qItem);
			}
		};
		return answerRepository.findAll(specification, pageRequest);
	}
	
	@Transactional(readOnly=true)
	public Answer findOneAnswer(final QItem qItem) 
	{
		PageRequest pageRequest=new PageRequest(0, 1);
		Specification<Answer> specification=new Specification<Answer>() {
			
			@Override
			public Predicate toPredicate(Root<Answer> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> path=arg0.get("item");
				return arg2.equal(path, qItem);
			}
		};
		Page<Answer> findAll = answerRepository.findAll(specification, pageRequest);
		Answer answer=null;
		for (Answer answer1 : findAll) {
			if(answer1.getItem().getQiid()==qItem.getQiid()) 
			{
				answer=answer1;
			}
		}
		return answer;
	}
	public Answer save(Answer answer) 
	{
		return answerRepository.save(answer);
	}

}
