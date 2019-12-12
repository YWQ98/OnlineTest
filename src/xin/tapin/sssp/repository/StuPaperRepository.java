package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.StuPaper;

public interface StuPaperRepository extends JpaRepository<StuPaper, Integer>,JpaSpecificationExecutor<StuPaper>{
	public StuPaper getByspid(Integer spid);
}
