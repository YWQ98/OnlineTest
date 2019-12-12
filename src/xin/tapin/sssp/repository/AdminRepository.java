package xin.tapin.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import xin.tapin.sssp.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer>{
	Admin getByaName(String aName) ;
//	Admin getByaId(Integer aId);
}
