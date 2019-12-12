package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Integer>,JpaSpecificationExecutor<Subject>{
	public Subject getBysjid(Integer sjid);
	public Subject getBysjname(String sjname);
}
