package xin.tapin.sssp.tool;

import java.util.ArrayList;

public class AutoEPaper {
	
//	public static void main(String[] args) {
//		ArrayList<Integer> arrayList = getArrayList(34, 12, 2);
//		for (Integer integer : arrayList) {
//			System.out.println(integer);
//		}
//		int gettotalPoints1 = gettotalPoints1(arrayList);
//		System.out.println(gettotalPoints1);
//		System.out.println(arrayList.size());
//		boolean listEQTotalPoints = listEQTotalPoints(11, 10);
//		System.out.println(listEQTotalPoints);
//		Double double1=(double) 10/3;
//		System.out.println(double1);
//		System.out.println(Math.random()*4+1);
//	}
	

	public static ArrayList<Integer> getArrayList(int totalPoints,int num,
			int lowest)
	{//totalPoints总分  num几题  lowest最低几分 
		ArrayList<Integer> list=new ArrayList<Integer>();
		for (int i = 0; i < num; i++) {//最低分添加到ArrayList中
			list.add(Integer.valueOf(lowest));
		}
//		tallest+=1;
		int gettotalPoints1 = gettotalPoints1(list);
		boolean listEQTotalPoints = listEQTotalPoints(gettotalPoints1, totalPoints);
		for (; !listEQTotalPoints; ) {//随机在加分
			int local=(int)(Math.random()*list.size());
			list.set(local, list.get(local)+1);
			gettotalPoints1+=1;
			listEQTotalPoints=listEQTotalPoints(gettotalPoints1, totalPoints);
		}
		
		
		return list;
	}
	
	public static boolean listEQTotalPoints(int list,int totalPoint) 
	{
		return list==totalPoint?true:false;
	}

	
	public static int gettotalPoints1(ArrayList<Integer> list) 
	{
		int totalPoints=0;
		for (Integer integer : list) {
			totalPoints+=integer;
		}
		return totalPoints;
	}

}
