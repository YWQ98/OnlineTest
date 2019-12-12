package xin.tapin.sssp.handler;


import java.security.Key;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import xin.tapin.sssp.entity.Student;
import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.StudentService;
import xin.tapin.sssp.service.TeacherService;


@Controller
@RequestMapping("/admin/manage")
public class AdminManagePageHandler {

	
	@Autowired
	StudentService studentService;
	
	
	@Autowired
	TeacherService teacherservice;
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/changeState",produces = "application/json; charset=utf-8")
	public String changeState(String nowState,String num,String typeTS,HttpSession session) 
	{//修改用户状态   nowState当前状态   num学生或者教师num    typeTS  学生或者教师
		String str="";
		if(session.getAttribute("admin")!=null) 
		{
			String stateNum="1";
			if(nowState.equals("激活")) 
			{
				stateNum="0";
			}
			
			if(typeTS.equals("student")) 
			{
				Student student = studentService.getStudent(num);
				if(student!=null)
				{
					student.setsState(stateNum);
					studentService.save(student);
					str="1";
				}
			}
			else if(typeTS.equals("teacher")) 
			{
				Teacher teacher = teacherservice.getTeacher(num);
				if(teacher!=null) {
					teacher.settState(stateNum);
					teacherservice.save(teacher);
					str="1";
				}
			}
		}
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/getPage",produces = "application/json; charset=utf-8")
	public String getPage(String page1,String typeTS,String typeNN,String searchStr,HttpSession session) 
	{//根据name或num查询学生或教师      page1参数分页   typeTS学生或教师   typeNN按照name或者num查询
//		System.out.println(searchStr);
		String GJson="";
		if(session.getAttribute("admin")!=null) 
		{
			Page<Student> pageS=null;
			Page<Teacher> pageT=null;
			if(typeTS.equals("student")) 
			{
				if(typeNN.equals("num")) 
				{
					if(page1==null) 
					{
						pageS=studentService.getPageAndsNum(searchStr, 1);
					}
					else
					{
						pageS=studentService.getPageAndsNum(searchStr, Integer.valueOf(page1));
					}
				}
				else if(typeNN.equals("name")) 
				{
					if(page1==null) 
					{
						pageS=studentService.getPageAndsName(searchStr, 1);
					}
					else
					{
						pageS=studentService.getPageAndsName(searchStr, Integer.valueOf(page1));
					}
				}
			}
			else if(typeTS.equals("teacher")) 
			{
				if(typeNN.equals("num")) 
				{
					if(page1==null) 
					{
						pageT=teacherservice.getPageAndtNum(searchStr, 1);
						System.out.println(pageT);
					}
					else
					{
						pageT=teacherservice.getPageAndtNum(searchStr, Integer.valueOf(page1));
					}
				}
				else if(typeNN.equals("name")) 
				{
					if(page1==null) 
					{
						pageT=teacherservice.getPageAndtName(searchStr, 1);
					}
					else
					{
						pageT=teacherservice.getPageAndtName(searchStr, Integer.valueOf(page1));
					}
				}
			}
			if(pageS!=null) 
			{
				Gson gson=new Gson();
				List<Student> list=pageS.getContent();
				GJson=gson.toJson(list);
	//			System.out.println(GJson);
				if(page1==null) 
				{
					GJson=GJson.substring(0,GJson.length()-2)+",\"sPages\":\""+pageS.getTotalPages()+"\""+"}]";
				}
			}
			if(pageT!=null) 
			{
				Gson gson=new Gson();
				List<Teacher> list=pageT.getContent();
				GJson=gson.toJson(list);
	//			System.out.println(GJson);
				if(page1==null) 
				{
					GJson=GJson.substring(0,GJson.length()-2)+",\"sPages\":\""+pageT.getTotalPages()+"\""+"}]";
				}
			}
	//		if(page1==null) 
	//		{
	//			GJson=GJson.substring(0,GJson.length()-2)+",\"sPages\":\""+pageS.getTotalPages()+"\""+"}]";
	//		}
	//		for (Student student : page) {
	//			System.out.println(student);
	//		}
	//		GJson="";
		}
		return GJson;
	}
	
	//页面跳转到班级查删
	@RequestMapping("/admin_classCURD")
	public String admin_classCURD(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINCLASS;
		if(session.getAttribute("admin")==null) 
		{
			view=StaticPage.ADMINLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		return view;
	}
	
	//页面跳转到题库查删
	@RequestMapping("/admin_subjectCURD")
	public String admin_subjectCURD(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINADDSUBJEST;
		if(session.getAttribute("admin")==null) 
		{
			view=StaticPage.ADMINLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		return view;
	}
	
	
	
	
	//页面跳转到题库查删
	@RequestMapping("/admin_itembankCURD")
	public String admin_itembankCURD(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINQUESTIONBANK;
		if(session.getAttribute("admin")==null) 
		{
			view=StaticPage.ADMINLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		return view;
	}
	
	
	
	//页面跳转到用户导入
	@RequestMapping("/admin_addUser")
	public String admin_addUser(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINIMPORT;
		if(session.getAttribute("admin")==null) 
		{
			view=StaticPage.ADMINLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		return view;
	}
	
	
	
	//页面跳转到用户增删改查  
	@RequestMapping("/userCURD")
	public String admin(HttpSession session) throws Exception 
	{
		String view=StaticPage.ADMINMAINPAGE;
		if(session.getAttribute("admin")==null) 
		{
			view=StaticPage.ADMINLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		return view;
	}

}
