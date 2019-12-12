package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.EPaper;

public interface EPaperRepository extends JpaRepository<EPaper, Integer>,JpaSpecificationExecutor<EPaper>{

	public EPaper getByename(String ename);
	public EPaper getByeid(Integer eid);
	
}
