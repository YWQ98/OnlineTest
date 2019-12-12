package xin.tapin.sssp.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.SType;

public interface STypeRepository extends JpaRepository<SType, Integer>,JpaSpecificationExecutor<SType>{
	public SType getBystid(Integer stid);
	
//	@Query("SELECT s FROM SType s;")
//	public List<SType> findAll() ;
	
	
}
