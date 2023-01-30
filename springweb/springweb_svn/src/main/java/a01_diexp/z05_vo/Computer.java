package a01_diexp.z05_vo;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {
	// 1:1 관계로 설정하여
	// 컴퓨터(제조사, Ram)
	// 생성자 - 제조사할당
	// public void show() 컴퓨터 제조사, Ram
	private String company;
	@Autowired
	private Ram ram; // 제조사, 용량정보
	public Computer() {
		// TODO Auto-generated constructor stub
	}
	public Computer(String company) {
		super();
		this.company = company;
	}
	public void showInfo() {
		System.out.println("# 컴퓨터 정보 #");
		System.out.println("제조사:"+company);
		if(ram!=null) {
			System.out.println("1. 램정보");
			System.out.println("	제조사:"+ram.getCompany());
			System.out.println("	용량:"+ram.getMemory());
		}else {
			System.out.println("램이 없습니다.");
		}
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Ram getRam() {
		return ram;
	}
	public void setRam(Ram ram) {
		this.ram = ram;
	}
	
}
