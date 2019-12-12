package xin.tapin.sssp.page;

public final class StaticPage {

	//首页
	public static final String INDEX="../../index";
	//管理员登录界面
	public static final String ADMINLOGINPAGE="admin/loginregister";

	//管理员管理用户增删改查页面----默认登录管理员账号跳转到这个界面
	public static final String ADMINMAINPAGE="admin/manage/admin_userCURD";

	//管理员用户导入
	public static final String ADMINIMPORT="admin/manage/admin_addUser";

	//管理员题库增删改查
	public static final String ADMINQUESTIONBANK="admin/manage/admin_itembankCURD";

	//管理员新增科目
	public static final String ADMINADDSUBJEST="admin/manage/admin_subjectCURD";

	//管理员班级增删改查
	public static final String ADMINCLASS="admin/manage/admin_classCURD";
	
	//学生登录注册找回密码界面
	public static final String STUDENTLOGINPAGE="student/loginregister";
	
	//学生主界面
	public static final String STUDENTMAINPAGE="student/manage/account_info";
	
	//学生试卷管理
	public static final String STUDENTMYCLASS="student/manage/account_myclass";

	//学生考试界面
	public static final String STUDENTEX="student/manage/examination";
	//学生考试界面
	public static final String STUDENTCHECKOUTEX="student/manage/checkoutex";
	
	//学生修改邮箱界面
	public static final String STUDENTSECURITY="student/manage/account_security";
	
	//教师登录注册找回密码界面
	public static final String TEACHERLOGINPAGE="teacher/loginregister";
	
	//教师主界面---默认班级管理界面
	public static final String TEACHERMAINPAGE="teacher/manage/teaching_class";
	
	//教师题库管理
	public static final String TEACHERITEMBANK="teacher/manage/teaching_itembank";

	//教师题库管理
	public static final String TEACHERPAPLE="teacher/manage/teaching_paple";
	//教师查看成绩
	public static final String TEACHERCHECKOUTEPAPER="teacher/manage/teaching_checkoutepaper";
	
	

}
