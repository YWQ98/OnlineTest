package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.Answer;

public interface AnswerRepository extends JpaRepository<Answer, Integer>,JpaSpecificationExecutor<Answer>{
}
