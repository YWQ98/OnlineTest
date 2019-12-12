package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import xin.tapin.sssp.entity.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Integer>,JpaSpecificationExecutor<Teacher>{
	Teacher getBytNum(String tNum);
}
