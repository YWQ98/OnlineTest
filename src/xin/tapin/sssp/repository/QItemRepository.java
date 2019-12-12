package xin.tapin.sssp.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.QItem;

public interface QItemRepository extends JpaRepository<QItem, Integer>,JpaSpecificationExecutor<QItem>{
	public QItem getByqiid(Integer qiid);
}
