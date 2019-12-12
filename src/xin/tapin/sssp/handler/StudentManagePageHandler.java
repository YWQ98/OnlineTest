package xin.tapin.sssp.handler;

import java.security.Key;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import xin.tapin.sssp.email.Email;
import xin.tapin.sssp.entity.Answer;
import xin.tapin.sssp.entity.EPaper;
import xin.tapin.sssp.entity.EPaperDetail;
import xin.tapin.sssp.entity.Option;
import xin.tapin.sssp.entity.QItem;
import xin.tapin.sssp.entity.SType;
import xin.tapin.sssp.entity.StuPaper;
import xin.tapin.sssp.entity.StuPaperDetail;
import xin.tapin.sssp.entity.Student;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.AnswerService;
import xin.tapin.sssp.service.EPaperDetailService;
import xin.tapin.sssp.service.EPaperService;
import xin.tapin.sssp.service.OptionService;
import xin.tapin.sssp.service.StuPaperDetailService;
import xin.tapin.sssp.service.StuPaperService;
import xin.tapin.sssp.service.StudentService;
import xin.tapin.sssp.tool.StringCompare;

@Controller
@RequestMapping("/student/manage")
public class StudentManagePageHandler {

	@Autowired
	private EPaperService ePaperService;
	@Autowired
	private StudentService studentService;

	@Autowired
	private AnswerService answerService;

	@Autowired
	private OptionService optionService;
	@Autowired
	private StuPaperService stuPaperService;
	@Autowired
	private EPaperDetailService ePaperDetailService;
	@Autowired
	private StuPaperDetailService stuPaperDetailService;
	
	
	
	
//	@RequestMapping("/updatePWD")
//	public String updatePWD(String newPWD,String emailcode,HttpSession session,Map<String, Object> map) throws Exception {
//		String view=StaticPage.STUDENTSECURITY;
//		map.put("pwdmsg", "修改失败！！！");
//		emailcode=emailcode.toUpperCase();
//		Student student=(Student) session.getAttribute("student");
//		String updaterandomChar = (String) session.getAttribute("updaterandomChar");
//		if(student==null) 
//		{
//			view=StaticPage.STUDENTLOGINPAGE;
//			if(session.getAttribute("publicKey")==null) //秘钥生成
//			{
//				Map<String, Key> keyMap=RSACoder.initKey();
//				session.setAttribute("keyMap", keyMap);
//				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
//			}
//		}else if(updaterandomChar!=null)
//		{
//			if(updaterandomChar.equals(emailcode)) {
//				student.setsPwd(newPWD);
//				studentService.save(student);
//				session.removeAttribute("updaterandomChar");
//				map.put("pwdmsg", "修改成功！！！");
//			}
//		}
//		return view;
//	}
//	
//	
//	
//	@ResponseBody
//	@RequestMapping(value="/sendEmailCode",produces = "application/json; charset=utf-8")
//	public String sendEmailCode(HttpSession session) throws Exception 
//	{
//		String ITJson="";
//		
//		Student student=(Student) session.getAttribute("student");
//		if(student!=null) {
//			String getsEmail = student.getsEmail();
//			String updaterandomChar = Email.randomChar();
//			boolean sendEmail = Email.sendEmail(getsEmail, updaterandomChar);
//			session.setAttribute("updaterandomChar", updaterandomChar);
//			if(sendEmail) {
//				ITJson="[{\"a\":\"1\"}]";
//			}
//		}
//		return ITJson;
//	}
	
	
	@RequestMapping("/updateEmail")
	public String updateEmail(String newemailcode,String oldemailcode,HttpSession session,Map<String, Object> map) throws Exception {
		String view=StaticPage.STUDENTSECURITY;
		map.put("emmsg", "修改失败！！！");
		newemailcode=newemailcode.toUpperCase();
		oldemailcode=oldemailcode.toUpperCase();
		Student student=(Student) session.getAttribute("student");
		String newemail=(String) session.getAttribute("newemail");
		String newrandomChar = (String) session.getAttribute("newrandomChar");
		String oldrandomChar=(String) session.getAttribute("oldrandomChar");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else if(newemail!=null&&newrandomChar!=null&&oldrandomChar!=null)
		{
			if(newrandomChar.equals(newemailcode) && oldrandomChar.equals(oldemailcode)) {
				student.setsEmail(newemail);
				studentService.save(student);
				session.removeAttribute("newrandomChar");
				session.removeAttribute("oldrandomChar");
				session.removeAttribute("newemail");
				map.put("emmsg", "修改成功！！！");
			}
		}
		return view;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/sendNewAndOldEmail",produces = "application/json; charset=utf-8")
	public String sendNewAndOldEmail(String newemail,HttpSession session) throws Exception 
	{
		String ITJson="";
		
		Student student=(Student) session.getAttribute("student");
		if(student!=null) {
			String getsEmail = student.getsEmail();
			
			String newrandomChar = Email.randomChar();
			String oldrandomChar = Email.randomChar();
			
			Boolean b1=Email.sendEmail(getsEmail, oldrandomChar);
			Boolean b2=Email.sendEmail(newemail, newrandomChar);

			session.setAttribute("newrandomChar", newrandomChar);
			session.setAttribute("oldrandomChar", oldrandomChar);
			session.setAttribute("newemail", newemail);
			if(b1&&b2) {
				ITJson="[{\"a\":\"1\"}]";
			}
		}
		return ITJson;
	}
	
	@RequestMapping("/updateinfo")
	public String updateinfo(String ssex,String sintroduction,String sname,HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.STUDENTMAINPAGE;
		Student student=(Student) session.getAttribute("student");
		
		if(sname.equals("")) {
			sname=student.getsName();
		}
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			student.setsGender(ssex);
			student.setsIntroduction(sintroduction);
			student.setsName(sname);
			studentService.save(student);
			session.setAttribute("student", student);
		}

		
		return view;
	}
	
	@RequestMapping("/checkoutEX")
	public String checkoutEX(Integer Spid,String ename,HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.STUDENTMYCLASS;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else if(!ename.equals(""))
		{
			EPaper byename = ePaperService.getByename(ename);
			StuPaper stuPaper = stuPaperService.getByspid(Spid);
			if(byename.getEstate().equals("2")) 
			{//0不能考试不能查看成绩--1可以考试但不能查看成绩---2不能考试能查看成绩  SpidStuPaper对应主键
				//添加跳转到查看成绩界面view
				view=StaticPage.STUDENTCHECKOUTEX;
				List<Option> list=new ArrayList<Option>();
				List<Answer> answerlist=new ArrayList<Answer>();
				Page<StuPaperDetail> findStuPaper = stuPaperDetailService.findStuPaper(stuPaper);
				for (StuPaperDetail stuPaperDetail : findStuPaper) {
					Page<Option> finqItem = optionService.finqItem(stuPaperDetail.getqItem());
					for (Option option : finqItem) {
						list.add(option);
					}
					Page<Answer> optionfinqItem = answerService.findAnswer(stuPaperDetail.getqItem());
					for (Answer option : optionfinqItem) {
						 answerlist.add(option);
					}
				}
				map.put("PageSPD",findStuPaper);
				map.put("optionPageSPD",list);
				map.put("answerPageSPD",answerlist);
				map.put("Spid",Spid);
				System.out.println(list);
				System.out.println(answerlist);
				System.out.println(findStuPaper.getContent());
				map.put("endtime", stuPaper.getDate().toString().subSequence(0, stuPaper.getDate().toString().length()-2));
			}else {
				map.put("msg", "试卷名称："+ename+"---此试卷还不能查看成绩！！！");
			}
		}
		if(student!=null) 
		{
			Page<StuPaper> finAll = stuPaperService.finAll(student);
			map.put("studentPage", finAll);
//			System.out.println(finAll.getContent());
		}

		
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/saveStuPaperDetail",produces = "application/json; charset=utf-8")
	public String saveStuPaperDetail(String data,Integer spid,HttpSession session) throws Exception 
	{
		String ITJson="";
		Student student=(Student) session.getAttribute("student");
		StuPaper stuPaper = stuPaperService.getByspid(spid);
		String[] dataSplit = data.split(",");
		List<Integer> dataIntegerList=new ArrayList<Integer>();
		List<String> dataStringList=new ArrayList<String>();
		if(student!=null && stuPaper!=null) {//学生已经登录且试卷存在
			long nowtime = new Date().getTime();
			long endtime = stuPaper.getDate().getTime();
			boolean ttlB=((endtime-nowtime)/60/1000)<=-1;//可以晚1分钟 
			if(!ttlB && stuPaper.getStudent().getsId()==student.getsId()&&stuPaper.getePaper().getEstate().equals("1")) {
				//考试未结束、改试卷是属于登录学生的试卷且改试卷处于可以考试的状态
				for (String string : dataSplit) {
	//				dataStringList.add(string.split("-"));
	//				System.out.println(string);
	//				System.out.println(string.length());
					String[] split = string.split("-");
					int i=0;
					for (int j = 0; j < split.length/2; j++) {
						Integer spiid1=Integer.valueOf(split[i]);
						dataIntegerList.add(spiid1);
						String spiid2=split[1+i];
						dataStringList.add(spiid2);
						i+=2;
					}
				}
	//			for (String string : dataStringList) {
	//				System.out.println(string);
	//			}
				int k=0;
				Answer findOneAnswer = null;
				QItem getqItem =null;
				for (Integer string : dataIntegerList) {
					StuPaperDetail byspdid = stuPaperDetailService.getByspdid(string);
					String string2 = dataStringList.get(k++);
					if(!string2.equals("没有答案")) {
						byspdid.setEdanswer(string2);
					}
					if(!string2.equals("没有答案")&&byspdid.getqItem().getsType().getqType().getQtid()!=4) {
						//除了简答的评分方式
						getqItem = byspdid.getqItem();
						findOneAnswer = answerService.findOneAnswer(getqItem);
						boolean equals = false;
						if(byspdid.getEdanswer()!=null && findOneAnswer.getAnswer()!=null) {
							equals = byspdid.getEdanswer().equals(findOneAnswer.getAnswer());
						}
						if(equals) {//学生答案正确
							byspdid.setScore(getqItem.getQiscore());
						}
						else {
							byspdid.setScore(0);
						}
					}
					if(!string2.equals("没有答案")&&byspdid.getqItem().getsType().getqType().getQtid()==4){
						//简答评分方式
						getqItem = byspdid.getqItem();
						findOneAnswer = answerService.findOneAnswer(getqItem);
						String stuan = byspdid.getEdanswer();
						String answer = findOneAnswer.getAnswer();
						if(stuan!=null && answer!=null) {
							StringCompare stringCompare=new StringCompare();
							float similarityRatio = stringCompare.getSimilarityRatio(stuan, answer);
							byspdid.setScore(Math.round(getqItem.getQiscore()*similarityRatio));
						}
					}
					System.out.println(byspdid);
					stuPaperDetailService.save(byspdid);
				}
				
				Page<StuPaperDetail> findStuPaper = stuPaperDetailService.findStuPaper(stuPaper);
				stuPaper.setSpscore(0);
				for (StuPaperDetail stuPaperDetail : findStuPaper) {
					stuPaper.setSpscore(stuPaper.getSpscore()+stuPaperDetail.getScore());
				}
				stuPaperService.save(stuPaper);
				System.out.println(data+"==="+spid);
				ITJson="[{\"a\":\"1\"}]";
			}
		}
		return ITJson;
	}
	
	
	@RequestMapping("/beginTest")
	public String beginTest(Integer Spid,String ename,HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.STUDENTMYCLASS;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else if(!ename.equals(""))
		{
			EPaper byename = ePaperService.getByename(ename);
			Integer ettl = byename.getEttl();
			StuPaper stuPaper = stuPaperService.getByspid(Spid);
			if(byename.getEstate().equals("1")) 
			{//0不能考试不能查看成绩--1可以考试但不能查看成绩---2不能考试能查看成绩  SpidStuPaper对应主键
				//添加开始考试时间--表StuPaper 添加开始考试时间字段
//				map.put("msg", "试卷名称："+ename+"---可以开始考试！！！");
				if(stuPaper.getDate()==null) 
				{//如果时间结束时间为空添加  并设置结束时间ettl为试卷考试时长
					stuPaper.setDate(new Date());
					stuPaper.getDate().setTime((new Date().getTime()+ettl*60*1000));
					stuPaperService.save(stuPaper);
					//添加跳转到考试界面view
					view=StaticPage.STUDENTEX;
					List<Option> list=new ArrayList<Option>();
					Page<StuPaperDetail> findStuPaper = stuPaperDetailService.findStuPaper(stuPaper);
					for (StuPaperDetail stuPaperDetail : findStuPaper) {
						Page<Option> finqItem = optionService.finqItem(stuPaperDetail.getqItem());
						for (Option option : finqItem) {
							list.add(option);
						}
					}
					map.put("PageSPD",findStuPaper);
					map.put("optionPageSPD",list);
					map.put("Spid",Spid);
					System.out.println(findStuPaper.getContent());
					map.put("endtime", stuPaper.getDate().toString().subSequence(0, stuPaper.getDate().toString().length()-2));
				}else if(stuPaper.getDate()!=null)
				{
					long nowtime = new Date().getTime();
					long endtime = stuPaper.getDate().getTime();
					boolean ttlB=((endtime-nowtime)/60/1000)<=-1;//可以晚1分钟 
					if(ttlB) 
					{
						map.put("msg", "试卷名称："+ename+"，结束时间："+stuPaper.getDate()+"，考试时间已经结束");
					}else {
						//添加跳转到考试界面view
						view=StaticPage.STUDENTEX;
						List<Option> list=new ArrayList<Option>();
						Page<StuPaperDetail> findStuPaper = stuPaperDetailService.findStuPaper(stuPaper);
						for (StuPaperDetail stuPaperDetail : findStuPaper) {
							Page<Option> finqItem = optionService.finqItem(stuPaperDetail.getqItem());
							for (Option option : finqItem) {
								list.add(option);
							}
						}
						map.put("PageSPD",findStuPaper);
						map.put("optionPageSPD",list);
						map.put("Spid",Spid);
						System.out.println(list);
						System.out.println(findStuPaper.getContent());
						map.put("endtime", stuPaper.getDate().toString().subSequence(0, stuPaper.getDate().toString().length()-2));
					}
				}
			}else {
				map.put("msg", "试卷名称："+ename+"---此试卷还不能开始考试！！！");
			}
		}
		if(student!=null) 
		{
			Page<StuPaper> finAll = stuPaperService.finAll(student);
			map.put("studentPage", finAll);
//			System.out.println(finAll.getContent());
		}

		
		return view;
	}
	
	@RequestMapping("/addSPaper")
	public String addSPaper(String paperName,HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.STUDENTMYCLASS;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else if(!paperName.equals(""))
		{
			EPaper ePaper = ePaperService.getByename(paperName);
			StuPaper stuPaper=new StuPaper(0, ePaper, student);
			stuPaperService.save(stuPaper);//保存基本信息
			Page<EPaperDetail> finallEPaperDetail = ePaperDetailService.finallEPaperDetail(ePaper);
			for (EPaperDetail ePaperDetail : finallEPaperDetail) {
				QItem qItem = ePaperDetail.getqItem();
				StuPaperDetail stuPaperDetail=new StuPaperDetail("", 0, qItem, stuPaper);
				stuPaperDetailService.save(stuPaperDetail);
			}
		}
		if(student!=null) 
		{
			Page<StuPaper> finAll = stuPaperService.finAll(student);
			map.put("studentPage", finAll);
//			System.out.println(finAll.getContent());
		}
		return view;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/searchPaper",produces = "application/json; charset=utf-8")
	public String searchPaper(String paperName,HttpSession session) throws Exception 
	{
		String str="";
		
		EPaper ePaper = ePaperService.getByename(paperName);
		if(ePaper!=null) 
		{
			Gson gson=new Gson();
			str = gson.toJson(ePaper);
		}
		System.out.println(str);
		return str;
	}
	
	@RequestMapping("/account_info")
	public String account_info(HttpSession session) throws Exception 
	{
		String view=StaticPage.STUDENTMAINPAGE;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		
		return view;
	}
	
	@RequestMapping("/account_myclass")
	public String account_myclass(HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.STUDENTMYCLASS;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			Page<StuPaper> finAll = stuPaperService.finAll(student);
			map.put("studentPage", finAll);
		}
		
		return view;
	}

	@RequestMapping("/account_security")
	public String account_security(HttpSession session) throws Exception 
	{
		String view=StaticPage.STUDENTSECURITY;
		Student student=(Student) session.getAttribute("student");
		if(student==null) 
		{
			view=StaticPage.STUDENTLOGINPAGE;
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
