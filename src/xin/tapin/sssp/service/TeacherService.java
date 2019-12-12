package xin.tapin.sssp.service;

import java.security.Key;
import java.util.Date;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.md5util.Md5Util;
import xin.tapin.sssp.repository.TeacherRepository;
import xin.tapin.sssp.rsa.RSACoder;

@Service
public class TeacherService {

	@Autowired
	private TeacherRepository teacherRepository;
	
	
	
	
	
	
	@Transactional(readOnly=true)
	public Page<Teacher> getPageAndtNum(final String tNum,Integer page)
	{//按tNum模糊查询
		PageRequest pageRequest=new PageRequest(page-1, 7);
		Specification<Teacher> specification=new Specification<Teacher>() {
			
			@Override
			public Predicate toPredicate(Root<Teacher> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> theme =arg0.get("tNum");
				return arg2.like(theme, "%"+tNum+"%");
			}
		};
		return teacherRepository.findAll(specification, pageRequest);
	}
	
	
	
	@Transactional(readOnly=true)
	public Page<Teacher> getPageAndtName(final String tName,Integer page)
	{//按tName模糊查询
		PageRequest pageRequest=new PageRequest(page-1, 7);
		Specification<Teacher> specification=new Specification<Teacher>() {
			
			@Override
			public Predicate toPredicate(Root<Teacher> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> theme =arg0.get("tName");
				return arg2.like(theme, "%"+tName+"%");
			}
		};
		return teacherRepository.findAll(specification, pageRequest);
	}
	
	
	
	
	
	
	
	@Transactional(readOnly=true)
	public Teacher getTeacher(String tNum) 
	{
		return teacherRepository.getBytNum(tNum);
	}
	
	public Object save(Teacher teacher) //修改状态
	{
		return	teacherRepository.saveAndFlush(teacher);
	}
	
	public Object save(Teacher teacher,Map<String, Key> keyMap) //注册修改密码
	{
		if(teacher.gettId()==null) //注册时没有id
		{
			teacher.settCreateTime(new Date());
		}
		String privateKey;
		try {
			privateKey=RSACoder.getPrivateKey(keyMap);
			byte[] pwd=RSACoder.decryptByPrivateKey(teacher.gettPwd(), privateKey);
			teacher.settPwd(new String(pwd));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String MD5aPwd=Md5Util.MD5(teacher.gettPwd(),teacher.gettNum().toString());
		teacher.settPwd(MD5aPwd);
		return	teacherRepository.saveAndFlush(teacher);
	}
	
	@Transactional(readOnly=true)
	public Teacher loginCheck(Teacher teacher1,Map<String, Key> keyMap) 
	{
		Teacher teacher2=teacherRepository.getBytNum(teacher1.gettNum());
		if(teacher2!=null) //如果用户名存在
		{
			
			String privateKey;
			try {
				privateKey = RSACoder.getPrivateKey(keyMap);//获取私钥
				byte[] pwd = RSACoder.decryptByPrivateKey(teacher1.gettPwd(),privateKey);//使用私钥解密
				teacher1.settPwd(new String(pwd));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String MD5aPwd=Md5Util.MD5(teacher1.gettPwd(),teacher1.gettNum().toString());
			teacher1.settPwd(MD5aPwd);
			if(!teacher2.gettPwd().equals(teacher1.gettPwd()))//密码错误
			{
				teacher2=null;
			}
		}
		
		return teacher2;
	}

}
