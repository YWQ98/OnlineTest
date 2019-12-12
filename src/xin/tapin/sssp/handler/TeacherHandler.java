package xin.tapin.sssp.handler;

import java.security.Key;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import xin.tapin.sssp.email.Email;
import xin.tapin.sssp.entity.EPaper;
import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.EPaperService;
import xin.tapin.sssp.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherHandler {

	@Autowired
	private TeacherService teacherService;
	

	@Autowired
	private EPaperService ePaperService;
	
	
	@RequestMapping(value="/forgetPassword")
	public String update(Teacher teacher,String fEmailCode,Map<String, Object> map,HttpSession session){
		String view=StaticPage.TEACHERLOGINPAGE;
		fEmailCode=fEmailCode.toUpperCase();
		if(fEmailCode.equals(session.getAttribute("emailcode"))) {
			Teacher teacher2=teacherService.getTeacher((String)session.getAttribute("fTeacher"));
			session.removeAttribute("fTeacher");
			teacher2.settPwd(teacher.gettPwd());
			Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
			teacherService.save(teacher2,keyMap);
			map.put("msg", "找回密码成功,请登录");
			session.removeAttribute("emailcode");
		}else {
			map.put("msg", "找回失败，验证码有误");
		}
		return view;
	}
	
	@RequestMapping("/register")
	public String register(Teacher teacher,Map<String, Object> map,HttpSession session) 
	{
		String view=StaticPage.TEACHERLOGINPAGE;
		Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
		if(teacher.gettId()==null) //注册时没有id
		{
			map.put("msg", "注册成功，请登录");
			teacher.settState("0");
			teacherService.save(teacher, keyMap);
			session.removeAttribute("emailcode");
		}else {
			map.put("msg", "注册失败，请重新注册");
		}
		return view;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckEmailCode")
	public String ajaxCheckEmailCode(@RequestParam(value="emailcode",required=true) String emailcode,HttpSession session) 
	{
		String msg="1";
		emailcode=emailcode.toUpperCase();
		if(emailcode.equals(session.getAttribute("emailcode"))) 
		{
			msg="0";
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckTNum")
	public String ajaxCheckSNum(@RequestParam(value="tNum",required=true) String tNum) 
	{
		String msg="1";
		if(teacherService.getTeacher(tNum)==null) 
		{
			msg="0";
		}
		return msg;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/ajaxFSendEmail")
	public String ajaxFSendEmail(@RequestParam(value="tNum",required=true) String tNum,HttpSession session) 
	{
		String msg="1";
		String code=Email.randomChar();
		session.setAttribute("emailcode", code);
		Boolean b=Email.sendEmail(teacherService.getTeacher(tNum).gettEmail(), code);
		if(!b) 
		{
			msg="0";
		}else 
		{
			session.setAttribute("fTeacher", tNum);
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxSendEmail")
	public String ajaxSendEmail(@RequestParam(value="tEmail",required=true) String tEmail,HttpSession session) 
	{
		String msg="1";
		String code=Email.randomChar();
		session.setAttribute("emailcode", code);
		Boolean b=Email.sendEmail(tEmail, code);
		if(!b) 
		{
			msg="0";
		}
		return msg;
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpSession session,Teacher teacher,Map<String, Object> map) {
		String view=StaticPage.TEACHERMAINPAGE;
		
		Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
		Teacher teacher2=teacherService.loginCheck(teacher, keyMap);
		if(teacher2!=null) //登录验证成功
		{
			if(teacher2.gettState().equals("1")) //且状态不可为1----1为位冻结
			{
				view = StaticPage.TEACHERLOGINPAGE;
				map.put("msg","该账号已被冻结！！！");
			}
			else 
			{
				session.setAttribute("teacher", teacher2);
				//移除秘钥
				session.removeAttribute("keyMap");
				session.removeAttribute("publicKey");
				Page<EPaper> findPagEPapers = ePaperService.findPagEPapers(teacher2, 1);
				map.put("PagEPapers", findPagEPapers);
			}
		}
		else 
		{
			view = StaticPage.TEACHERLOGINPAGE;
			map.put("msg", "用户名或者密码错误");
		}
		return view;
	}
	
	@RequestMapping("/loginRegister")
	public String loginRegister(HttpSession session) throws Exception 
	{
		String	view=StaticPage.TEACHERLOGINPAGE;
		
		session.removeAttribute("admin");//登录学生账号退出其他角色账号
		session.removeAttribute("student");
		
		if(session.getAttribute("publicKey")==null) //秘钥生成
		{
			//生成秘钥
			Map<String, Key> keyMap=RSACoder.initKey();
			session.setAttribute("keyMap", keyMap);
			session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
		}
		if(session.getAttribute("teacher")!=null) //已登录账号直接跳转后台页面
		{
			view=StaticPage.TEACHERMAINPAGE;
		}
		
		return view;
	}
	
}
