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

import xin.tapin.sssp.entity.Answer;
import xin.tapin.sssp.entity.EPaper;
import xin.tapin.sssp.entity.EPaperDetail;
import xin.tapin.sssp.entity.Option;
import xin.tapin.sssp.entity.QItem;
import xin.tapin.sssp.entity.QType;
import xin.tapin.sssp.entity.SType;
import xin.tapin.sssp.entity.StuPaper;
import xin.tapin.sssp.entity.Subject;
import xin.tapin.sssp.entity.Teacher;
import xin.tapin.sssp.page.StaticPage;
import xin.tapin.sssp.rsa.RSACoder;
import xin.tapin.sssp.service.AnswerService;
import xin.tapin.sssp.service.EPaperDetailService;
import xin.tapin.sssp.service.EPaperService;
import xin.tapin.sssp.service.OptionService;
import xin.tapin.sssp.service.QItemService;
import xin.tapin.sssp.service.QtypeService;
import xin.tapin.sssp.service.STypeService;
import xin.tapin.sssp.service.StuPaperService;
import xin.tapin.sssp.service.SubjectService;
import xin.tapin.sssp.tool.AutoEPaper;

@Controller
@RequestMapping("/teacher/manage")
public class TeacherManagePageHandler {

	@Autowired
	private QtypeService qtypeService;
	
	@Autowired
	private STypeService sTypeService;
	
	@Autowired
	private QItemService qItemService;

	@Autowired
	private SubjectService subjectService;
	@Autowired
	private OptionService optionService;
	@Autowired
	private AnswerService answerService;
	@Autowired
	private EPaperService ePaperService;
	@Autowired
	private EPaperDetailService ePaperDetailService;
	@Autowired
	private StuPaperService stuPaperService;
	
	
	@RequestMapping("/checkoutEPScore")
	public String checkoutEPScore(Integer eid,Map<String, Object> map,HttpSession session) throws Exception {
		String view=StaticPage.TEACHERCHECKOUTEPAPER;
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if(teacher==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			EPaper byeid = ePaperService.getByeid(eid);
			Page<StuPaper> finAllStuPaper = stuPaperService.finAllStuPaper(byeid);
			map.put("finAllStuPaper", finAllStuPaper);
		}
		return view;
	}
	
	

	@RequestMapping("/autoAddEPaper")//随机生成试卷
	public String autoAddEPaper(String autorpname,Integer autottl,Integer autosjid ,Integer autoscore,Map<String, Object> map,HttpSession session) throws Exception 
	{
		String view=StaticPage.TEACHERPAPLE;
		String msgItem="添加失败！！！";
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if(teacher==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			Subject bysjid = subjectService.getBysjid(autosjid);
			if(bysjid!=null) 
			{
				EPaper ePaper=new EPaper(autorpname, autoscore, "0", autottl, teacher, new Date());
				ePaperService.save(ePaper);
				ArrayList<Integer> raList = AutoEPaper.getArrayList(34, 12, 2);//单选随机数
				ArrayList<Integer> chList = AutoEPaper.getArrayList(33, 12, 2);//多选随机数
				ArrayList<Integer> judgeList = AutoEPaper.getArrayList(23, 10, 2);//判断随机数
				int p=0;
				int q=raList.size();
				SType findOneSType = sTypeService.findOneSType(1, bysjid.getSjid());
				Page<QItem> bySType = qItemService.getBySType(findOneSType);
				List<QItem> content = bySType.getContent();
				for (int i = 0; i < content.size(); i++) {
					if(p<q) 
					{
						if(raList.get(p)==content.get(i).getQiscore()) 
						{
							EPaperDetail ePaperDetail=new EPaperDetail(ePaper, content.get(i));
							ePaperDetailService.save(ePaperDetail);
							p++;
						}
					}else {
						break;
					}
				}
				
				p=0;
				q=chList.size();
				findOneSType = sTypeService.findOneSType(2, bysjid.getSjid());
				bySType = qItemService.getBySType(findOneSType);
				content = bySType.getContent();
				for (int i = 0; i < content.size(); i++) {
					if(p<q) 
					{
						if(chList.get(p)==content.get(i).getQiscore()) 
						{
							EPaperDetail ePaperDetail=new EPaperDetail(ePaper, content.get(i));
							ePaperDetailService.save(ePaperDetail);
							p++;
						}
					}else {
						break;
					}
				}
				
				p=0;
				q=judgeList.size();
				findOneSType = sTypeService.findOneSType(3, bysjid.getSjid());
				bySType = qItemService.getBySType(findOneSType);
				content = bySType.getContent();
				for (int i = 0; i < content.size(); i++) {
					if(p<q) 
					{
						if(judgeList.get(p)==content.get(i).getQiscore()) 
						{
							EPaperDetail ePaperDetail=new EPaperDetail(ePaper, content.get(i));
							ePaperDetailService.save(ePaperDetail);
							p++;
						}
					}else {
						break;
					}
				}
				
				if(autoscore==100) 
				{
					findOneSType = sTypeService.findOneSType(4, bysjid.getSjid());
					bySType = qItemService.getBySType(findOneSType);
					content = bySType.getContent();
					for (int i = 0; i < content.size(); i++) {
						int random=(int)(Math.random()*content.size());
						if(10==content.get(random).getQiscore()) 
						{
							EPaperDetail ePaperDetail=new EPaperDetail(ePaper, content.get(random));
							ePaperDetailService.save(ePaperDetail);
							break;
						}
					}

					msgItem="添加成功！！！";
				}else if(autoscore==120) 
				{
					ArrayList<Integer> jdList = AutoEPaper.getArrayList(30, 2, 10);//简答随机数
					p=0;
					q=jdList.size();
					findOneSType = sTypeService.findOneSType(4, bysjid.getSjid());
					bySType = qItemService.getBySType(findOneSType);
					content = bySType.getContent();
					for (int i = 0; i < content.size(); i++) {
						if(p<q) 
						{
							if(jdList.get(p)==content.get(i).getQiscore()) 
							{
								EPaperDetail ePaperDetail=new EPaperDetail(ePaper, content.get(i));
								ePaperDetailService.save(ePaperDetail);
								p++;
							}
						}else {
							break;
						}
					}
					msgItem="添加成功！！！";
				}
			}
		}
		map.put("subject", subjectService.findAll());
		map.put("msgItem", msgItem);
		return view;
	}
	
	
	//查询试卷名称是否存在
	@ResponseBody
	@RequestMapping(value="/checkSPaperName",produces = "application/json; charset=utf-8")
	public String checkSPaperName(String paplename) throws Exception 
	{
		String ITJson="";
		EPaper byename = ePaperService.getByename(paplename);
		if(byename==null) 
		{
			ITJson="[{\"a\":\"1\"}]";
		}
		return ITJson;
	}
	
//	//修改试卷状态 并页面跳转到试卷管理  
//	@RequestMapping("/updateEstate")
//	public String updateEstate(Integer eid,String estate,Map<String, Object> map,HttpSession session) throws Exception 
//	{
//		String view=StaticPage.TEACHERMAINPAGE;
//		Teacher teacher = (Teacher) session.getAttribute("teacher");
//		if(teacher==null) 
//		{
//			view=StaticPage.TEACHERLOGINPAGE;
//			if(session.getAttribute("publicKey")==null) //秘钥生成
//			{
//				Map<String, Key> keyMap=RSACoder.initKey();
//				session.setAttribute("keyMap", keyMap);
//				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
//			}
//		}else {
//			Page<EPaper> findPagEPapers = ePaperService.findPagEPapers(teacher, 1);
//			map.put("PagEPapers", findPagEPapers);
//		}
//		return view;
//	}
	
	
	@RequestMapping("/addPaple")//添加试卷
	public String addPaple(Map<String, Object> map,Integer paple_score,String paplename,String estate,Integer ttl,String addpapleqiid,HttpSession session) throws Exception 
	{
		String view=StaticPage.TEACHERPAPLE;
		String msgItem="添加失败！！！";
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if(teacher==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			if(ePaperService.getByename(paplename)==null && addpapleqiid!=null && ttl!=null && !paplename.equals("")) 
			{
				EPaper ePaper=new EPaper(paplename, paple_score, estate, ttl, teacher, new Date());
				ePaperService.save(ePaper);
				String[] split = addpapleqiid.split(",");
//				System.out.println(ePaper);
				for (String string : split) {
					QItem byqiid = qItemService.getByqiid(Integer.valueOf(string));
					EPaperDetail ePaperDetail=new EPaperDetail(ePaper, byqiid);
					ePaperDetailService.save(ePaperDetail);
				}
				msgItem="添加成功！！！";
			}
			System.out.println(addpapleqiid+"----"+paplename+"---"+estate+"----"+ttl+"----"+paple_score);
			map.put("subject", subjectService.findAll());
		}
		map.put("msgItem", msgItem);
		return view;
	}
	
	
	
	
	//根据科目和类型查询题目
	@ResponseBody
	@RequestMapping(value="/searchItem",produces = "application/json; charset=utf-8")
	public String searchItem(String page,Integer typeQT,Integer typeSJ,HttpSession session,Map<String, Object> map) throws Exception 
	{
		String ITJson="";
		Gson gson=new Gson();
		Page<QItem> bySType=null;
		List<QItem> list=null;
		SType findOneSType = sTypeService.findOneSType(typeQT, typeSJ);
		if(findOneSType!=null) 
		{
			if(page==null) {
				bySType = qItemService.getBySType(findOneSType, 1);
				list=bySType.getContent();
				ITJson = gson.toJson(list);
				ITJson = ITJson.substring(0,ITJson.length()-2)+",\"sPages\":\""+bySType.getTotalPages()+"\"}]";
			}
			else 
			{
				bySType = qItemService.getBySType(findOneSType, Integer.valueOf(page));
				list=bySType.getContent();
				ITJson = gson.toJson(list);
			}
		}
		System.out.println(typeSJ+"---"+typeQT);
		System.out.println(ITJson);
		return ITJson;
	}
	
	@RequestMapping("/addQItem")//添加题目
	public String addQItem(Map<String, Object> map,String radioch,String radioan ,
			String cbchoice,String choicech, String judge,  Integer qiscore,
			String sjid,String qiname,String qtid,HttpSession session,String jdanswer) throws Exception 
	{
		String view=StaticPage.TEACHERITEMBANK;
		String msgItem="添加失败！！！";
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if(teacher==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			SType findOneSType = sTypeService.findOneSType(Integer.valueOf(qtid), Integer.valueOf(sjid));
			String op[]= {"A","B","C","D"};
			int l=0;
			if(qtid.equals("1")) 
			{//单选
				if(!radioch.equals(",,,")) 
				{
					String answerString="";
					QItem qItem=new QItem(qiname, qiscore, "0", teacher, findOneSType);
					QItem save = qItemService.save(qItem);
					String[] split = radioch.split(",");
					l=0;
					for (String string : split) {
						Option option=new Option(save, op[l++] +string) ;
						optionService.save(option);
					}
					for (int i = 0; i < radioan.length(); i++) {
						answerString+=radioan.substring(i, i+1);
						if((i+1)<radioan.length()) 
						{
							answerString+=",";
						}
					}
//					System.out.println(answerString);
					Answer answer2=new Answer(save, answerString);
					answerService.save(answer2);
//					System.out.println(sjid+"--"+qtid+"--"+qiname+"--"+qiscore+"--"+choice+"--"+answer);
					map.put("subject", subjectService.findAll());
					msgItem="添加成功！！！";
				}
			}
			else if(qtid.equals("2"))
			{//多选
				if(!choicech.equals(",,,") && cbchoice!=null) 
				{
					String answerString="";
					QItem qItem=new QItem(qiname, qiscore, "0", teacher, findOneSType);
					QItem save = qItemService.save(qItem);
					String[] split = choicech.split(",");
					l=0;
					for (String string : split) {
						Option option=new Option(save, op[l++]+string);
						optionService.save(option);
					}
//					String[] cbchoice = cbchoice.split(",");
//					for (int i = 0; i < cbchoice.length(); i++) {
//						answerString+=radioan.substring(i, i+1);
//						if((i+1)<radioan.length()) 
//						{
//							answerString+=",";
//						}
//					}
//					System.out.println(answerString);
					String[] split2 = cbchoice.split(",");
					String answercb="";
					for (String string : split2) {
						answercb+=string;
					}
					Answer answer2=new Answer(save, answercb);
					answerService.save(answer2);
//					System.out.println(sjid+"--"+qtid+"--"+qiname+"--"+qiscore+"--"+choice+"--"+answer);
					map.put("subject", subjectService.findAll());
					msgItem="添加成功！！！";
				}
			}
			else if(qtid.equals("3"))
			{//判断
				QItem item=new QItem(qiname, qiscore, "0", teacher, findOneSType);
				qItemService.save(item);
				Answer answer = new Answer(item, judge);
				answerService.save(answer);
				msgItem="添加成功！！！";
			}
			else if(qtid.equals("4"))
			{//简答题
				QItem item=new QItem(qiname, qiscore, "0", teacher, findOneSType);
				qItemService.save(item);
				Answer answer = new Answer(item, jdanswer);
				answerService.save(answer);
				msgItem="添加成功！！！";
			}
			map.put("subject", subjectService.findAll());
		}
		map.put("msgItem", msgItem);
		return view;
	}
	
//	@RequestMapping("/addQItem")
//	public String addQItem(Map<String, Object> map,String answer,String choice,Integer qiscore,String sjid,String qiname,String qtid,HttpSession session) throws Exception 
//	{
//		String view=StaticPage.TEACHERITEMBANK;
//		String msgItem="添加失败！！！";
//		Teacher teacher = (Teacher) session.getAttribute("teacher");
//		if(teacher==null) 
//		{
//			view=StaticPage.TEACHERLOGINPAGE;
//			if(session.getAttribute("publicKey")==null) //秘钥生成
//			{
//				Map<String, Key> keyMap=RSACoder.initKey();
//				session.setAttribute("keyMap", keyMap);
//				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
//			}
//		}else {
//			SType findOneSType = sTypeService.findOneSType(Integer.valueOf(qtid), Integer.valueOf(sjid));
//			if(!qtid.equals("4")) 
//			{//非简答题
//				String answerString="";
//				QItem qItem=new QItem(qiname, qiscore, "0", teacher, findOneSType);
//				QItem save = qItemService.save(qItem);
//				String[] split = choice.split(",");
//				for (String string : split) {
//					Option option=new Option(save, string);
//					optionService.save(option);
//				}
//				for (int i = 0; i < answer.length(); i++) {
//					answerString+=answer.substring(i, i+1);
//					if((i+1)<answer.length()) 
//					{
//						answerString+=",";
//					}
//				}
////				System.out.println(answerString);
//				Answer answer2=new Answer(save, answerString);
//				answerService.save(answer2);
//				System.out.println(sjid+"--"+qtid+"--"+qiname+"--"+qiscore+"--"+choice+"--"+answer);
//				map.put("subject", subjectService.findAll());
//				msgItem="添加成功！！！";
//			}
//			else 
//			{//简答题
//				QItem item=new QItem(qiname, qiscore, "0", teacher, findOneSType);
//				QItem save = qItemService.save(item);
//				msgItem="添加成功！！！";
//			}
//			map.put("subject", subjectService.findAll());
//		}
//		map.put("msgItem", msgItem);
//		return view;
//	}
	
	@RequestMapping("/addSubJect")
	public String addSubJect(Map<String, Object> map,String sjname,HttpSession session) throws Exception 
	{
		String view=StaticPage.TEACHERITEMBANK;
		String msgSubJect="添加失败！！！";
		if(session.getAttribute("teacher")==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			Subject bysjname = subjectService.getBysjname(sjname);
			if(bysjname==null && sjname!="") 
			{
				Subject subject = new Subject(sjname);
				Subject save = (Subject) subjectService.save(subject);
				List<QType> findall = qtypeService.findAll();
				for (QType qType : findall) {//添加一个科目自动添加一些基本类型
					SType sType=new SType(qType, save);
					sTypeService.save(sType);
				}
				msgSubJect="添加成功！！！";
			}
			map.put("msgSubJect", msgSubJect);
			map.put("subject", subjectService.findAll());
		}
		return view;
	}
	
	//页面跳转到生成试卷
	@RequestMapping("/teaching_paple")
	public String teaching_paple(HttpSession session,Map<String, Object> map) throws Exception 
	{
		String view=StaticPage.TEACHERPAPLE;
		if(session.getAttribute("teacher")==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		map.put("subject", subjectService.findAll());
		return view;
	}
	
	
	
	//页面跳转到题库管理
	@RequestMapping("/teaching_itembank")
	public String teaching_itembank(Map<String, Object> map,HttpSession session) throws Exception 
	{
		String view=StaticPage.TEACHERITEMBANK;
		if(session.getAttribute("teacher")==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}
		else 
		{
			map.put("subject", subjectService.findAll());
		}
		return view;
	}

	//页面跳转到试卷管理 --更新试卷状态 
	@RequestMapping("/teaching_class")
	public String teaching_class(Integer eid,String estate,Map<String, Object> map,HttpSession session) throws Exception 
	{
		String view=StaticPage.TEACHERMAINPAGE;
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		if(teacher==null) 
		{
			view=StaticPage.TEACHERLOGINPAGE;
			if(session.getAttribute("publicKey")==null) //秘钥生成
			{
				Map<String, Key> keyMap=RSACoder.initKey();
				session.setAttribute("keyMap", keyMap);
				session.setAttribute("publicKey", RSACoder.getPublicKey(keyMap));
			}
		}else {
			if(eid!=null && !estate.equals("")) 
			{
				EPaper byeid = ePaperService.getByeid(eid);
				byeid.setEstate(estate);
				ePaperService.save(byeid);
			}
			Page<EPaper> findPagEPapers = ePaperService.findPagEPapers(teacher, 1);
			map.put("PagEPapers", findPagEPapers);
		}
		return view;
	}

}
