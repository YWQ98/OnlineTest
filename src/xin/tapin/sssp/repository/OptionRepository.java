package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.Option;

public interface OptionRepository extends JpaRepository<Option, Integer>,JpaSpecificationExecutor<Option>{

}
