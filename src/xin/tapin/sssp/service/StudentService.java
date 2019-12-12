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

import xin.tapin.sssp.entity.Student;
import xin.tapin.sssp.md5util.Md5Util;
import xin.tapin.sssp.repository.StudentRepository;
import xin.tapin.sssp.rsa.RSACoder;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;
	
	@Transactional
	public Student getBysName(String sName) 
	{
		return studentRepository.getBysName(sName);
	}
	
	
	@Transactional(readOnly=true)
	public Page<Student> getPageAndsNum(final String sNum,Integer page)
	{//按sNum模糊查询
		PageRequest pageRequest=new PageRequest(page-1, 7);
		Specification<Student> specification=new Specification<Student>() {
			
			@Override
			public Predicate toPredicate(Root<Student> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> theme =arg0.get("sNum");
				return arg2.like(theme, "%"+sNum+"%");
			}
		};
		return studentRepository.findAll(specification, pageRequest);
	}
	
	
	
	@Transactional(readOnly=true)
	public Page<Student> getPageAndsName(final String sName,Integer page)
	{//按sName模糊查询
		PageRequest pageRequest=new PageRequest(page-1, 7);
		Specification<Student> specification=new Specification<Student>() {
			
			@Override
			public Predicate toPredicate(Root<Student> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
				Path<String> theme =arg0.get("sName");
				return arg2.like(theme, "%"+sName+"%");
			}
		};
		return studentRepository.findAll(specification, pageRequest);
	}
	
	@Transactional(readOnly=true)
	public Page<Student> getPage(Integer page,Integer size)
	{
		PageRequest pageRequest=new PageRequest(page-1, size);
		return studentRepository.findAll(pageRequest);
	}
	
	
	@Transactional(readOnly=true)
	public Student getStudent(String sNum) 
	{
		return studentRepository.getBysNum(sNum);
	}
	
	public Object save(Student student) //修改状态
	{
		return	studentRepository.saveAndFlush(student);
	}
	
	
	public Object save(Student student,Map<String, Key> keyMap) //注册修改密码
	{
		if(student.getsId()==null) //注册时没有id
		{
			student.setsCreateTime(new Date());
		}
		String privateKey;
		try {
			privateKey=RSACoder.getPrivateKey(keyMap);
			byte[] pwd=RSACoder.decryptByPrivateKey(student.getsPwd(), privateKey);
			student.setsPwd(new String(pwd));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String MD5aPwd=Md5Util.MD5(student.getsPwd(),student.getsNum().toString());
		student.setsPwd(MD5aPwd);
		return	studentRepository.saveAndFlush(student);
	}
	
	@Transactional(readOnly=true)
	public Student loginCheck(Student student1,Map<String, Key> keyMap) 
	{
		Student student2=studentRepository.getBysNum(student1.getsNum());
		if(student2!=null) //如果用户名存在
		{
			
			String privateKey;
			try {
				privateKey = RSACoder.getPrivateKey(keyMap);//获取私钥
				byte[] pwd = RSACoder.decryptByPrivateKey(student1.getsPwd(),privateKey);//使用私钥解密
				student1.setsPwd(new String(pwd));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String MD5aPwd=Md5Util.MD5(student1.getsPwd(),student1.getsNum().toString());
			student1.setsPwd(MD5aPwd);
			if(!student2.getsPwd().equals(student1.getsPwd()))//密码错误
			{
				student2=null;
			}
		}
		
		return student2;
	}

}
