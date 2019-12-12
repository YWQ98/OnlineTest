package xin.tapin.sssp.handler;

import java.security.Key;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import xin.tapin.sssp.email.Email;
import xin.tapin.sssp.entity.Student;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentHandler {

	@Autowired
	private StudentService studentService;
	
	
	
	
	@RequestMapping(value="/forgetPassword")
	public String update(Student student,String fEmailCode,Map<String, Object> map,HttpSession session){
		String view=StaticPage.STUDENTLOGINPAGE;
		fEmailCode=fEmailCode.toUpperCase();
		if(fEmailCode.equals(session.getAttribute("emailcode"))) {
			Student student2=studentService.getStudent((String)session.getAttribute("fStudent"));
			session.removeAttribute("fStudent");
			student2.setsPwd(student.getsPwd());
			Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
			studentService.save(student2,keyMap);
			map.put("msg", "找回密码成功,请登录");
			session.removeAttribute("emailcode");
		}else {
			map.put("msg", "找回失败，验证码有误");
		}
		return view;
	}
	
	@RequestMapping("/register")
	public String register(Student student,Map<String, Object> map,HttpSession session) 
	{
		String view=StaticPage.STUDENTLOGINPAGE;
		Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
		if(student.getsId()==null) //注册时没有id
		{
			map.put("msg", "注册成功，请登录");
			student.setsState("0");
			studentService.save(student, keyMap);
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
	@RequestMapping("/ajaxCheckSNum")
	public String ajaxCheckSNum(@RequestParam(value="sNum",required=true) String sNum) 
	{
		String msg="1";
		if(studentService.getStudent(sNum)==null) 
		{
			msg="0";
		}
		return msg;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/ajaxFSendEmail")
	public String ajaxFSendEmail(@RequestParam(value="sNum",required=true) String sNum,HttpSession session) 
	{
		String msg="1";
		String code=Email.randomChar();
		session.setAttribute("emailcode", code);
		Boolean b=Email.sendEmail(studentService.getStudent(sNum).getsEmail(), code);
		if(!b) 
		{
			msg="0";
		}else 
		{
			session.setAttribute("fStudent", sNum);
		}
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxSendEmail")
	public String ajaxSendEmail(@RequestParam(value="sEmail",required=true) String sEmail,HttpSession session) 
	{
		String msg="1";
		String code=Email.randomChar();
		session.setAttribute("emailcode", code);
		Boolean b=Email.sendEmail(sEmail, code);
		if(!b) 
		{
			msg="0";
		}
		return msg;
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpSession session,Student student,Map<String, Object> map) {
		String view=StaticPage.STUDENTSECURITY;
		
		Map<String, Key> keyMap = (Map<String, Key>) session.getAttribute("keyMap");
		Student student2=studentService.loginCheck(student, keyMap);
		if(student2!=null) //登录验证成功
		{
			if(student2.getsState().equals("1")) //且状态不可为1----1为位冻结
			{
				view = StaticPage.STUDENTLOGINPAGE;
				map.put("msg","该账号已被冻结！！！");
			}
			else 
			{
				session.setAttribute("student", student2);
				//移除秘钥
				session.removeAttribute("keyMap");
				session.removeAttribute("publicKey");
			}
		}
		else 
		{
			view = StaticPage.STUDENTLOGINPAGE;
			map.put("msg", "用户名或者密码错误");
		}
		return view;
	}
	
	@RequestMapping("/loginRegister")
	public String loginRegister(HttpSession session) throws Exception 
	{
		String	view=StaticPage.STUDENTLOGINPAGE;
		
		session.removeAttribute("admin");//登录学生账号退出其他角色账号
		session.removeAttribute("teacher");
		
		if(session.getAttribute("publicKey")==null) //秘钥生成
		{
			//生成秘钥
			Map<String, Key> keyMap=RSACoder.initKey();
			session.setAttribute("keyMap", keyMap);
			session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
		}
		if(session.getAttribute("student")!=null) //已登录账号直接跳转后台页面
		{
			view=StaticPage.STUDENTMAINPAGE;
		}
		
		return view;
	}
	
}
