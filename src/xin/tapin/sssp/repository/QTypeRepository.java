package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.QType;

public interface QTypeRepository extends JpaRepository<QType, Integer>,JpaSpecificationExecutor<QType>{
	public QType getByqtid(Integer qtid);
}
