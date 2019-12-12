package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.EPaperDetail;

public interface EPaperDetailRepository extends JpaRepository<EPaperDetail, Integer>,JpaSpecificationExecutor<EPaperDetail>{
	
	public EPaperDetail getByedid(String edid);

}
