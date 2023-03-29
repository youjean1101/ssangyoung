package jspexp.z01_util;

import com.google.gson.Gson;

import jspexp.vo.Person;
// import = "com.google.gson.Gson, jspexp.vo.Dept"
public class A01_Gson {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p = new Person("홍길동",25,"서울");
		Gson gson = new Gson();
		String json = gson.toJson(p);
		System.out.println(json);
	}

}
