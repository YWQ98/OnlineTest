package xin.tapin.sssp.handler;


import java.security.Key;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xin.tapin.sssp.entity.Admin;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminHandler {

	@Autowired
	private AdminService adminService;
	
	//退出管理员--学生--教师
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) throws Exception 
	{
		String view=StaticPage.INDEX;

		session.removeAttribute("admin");
		session.removeAttribute("student");
		session.removeAttribute("teacher");
		
		return view;
	}
	
	//登录验证
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpSession session,Admin admin,Map<String, Object> map) 
	{
		String view=StaticPage.ADMINMAINPAGE;
		//获取秘钥解密
		Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
		Admin admin2=adminService.loginCheck(admin,keyMap);
		
		if(admin2!=null) //登录验证成功
		{
			session.setAttribute("admin", admin2);
			//移除秘钥
			session.removeAttribute("keyMap");
			session.removeAttribute("publicKey");
		}
		else 
		{
			view = StaticPage.ADMINLOGINPAGE;
			map.put("msg", "用户名或者密码错误");
		}
		return view;
	}
	//登录界面
	@RequestMapping("/loginRegister")
	public String loginRegister(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINLOGINPAGE;
		
		session.removeAttribute("student");//登录管理员账号退出其他角色账号
		session.removeAttribute("teacher");
		
		if(session.getAttribute("publicKey")==null) //秘钥生成
		{
			Map<String, Key> keyMap=RSACoder.initKey();
			session.setAttribute("keyMap", keyMap);
			session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
		}
		if(session.getAttribute("admin")!=null) //已登录账号直接跳转后台页面
		{
			view=StaticPage.ADMINMAINPAGE;
		}
		return view;
	}
	

}
