package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.StuPaperDetail;

public interface StuPaperDetailRepository extends JpaRepository<StuPaperDetail, Integer>,JpaSpecificationExecutor<StuPaperDetail>{
	public StuPaperDetail getByspdid(Integer spdid);
}
