package xin.tapin.sssp.service;


import java.security.Key;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xin.tapin.sssp.entity.Admin;
import xin.tapin.sssp.md5util.Md5Util;
import xin.tapin.sssp.repository.AdminRepository;
import xin.tapin.sssp.rsa.RSACoder;

@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepository;
	
	@Transactional(readOnly=true)
	public Admin loginCheck(Admin admin1,Map<String, Key> keyMap) {
		//先查询
		Admin admin2=adminRepository.getByaName(admin1.getaName());
		if(admin2!=null) //如果用户名存在
		{
			
			String privateKey;
			try {
				privateKey = RSACoder.getPrivateKey(keyMap);//获取私钥
				byte[] pwd = RSACoder.decryptByPrivateKey(admin1.getaPwd(),privateKey);//使用私钥解密
				admin1.setaPwd(new String(pwd));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String MD5aPwd=Md5Util.MD5(admin1.getaPwd(),admin1.getaName());
			admin1.setaPwd(MD5aPwd);
			if(!admin2.getaPwd().equals(admin1.getaPwd()))//密码错误
			{
				admin2=null;
			}
		}
		return admin2;
	}
}
