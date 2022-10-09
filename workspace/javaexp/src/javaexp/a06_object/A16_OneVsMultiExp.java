package javaexp.a06_object;

import java.util.ArrayList;

public class A16_OneVsMultiExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		OnTrain t1 = new OnTrain("모바일");
//		t1.showReserAllList();
//		t1.addReserSeat(new Ticketing(3, 28, 50000));
//		t1.showReserAllList();
		OnTrain onSys = new OnTrain("온라인 기차 예매");
		onSys.setTlist(new Ticketing("서울-부산", "1호차3B", 42000));
		onSys.setTlist(new Ticketing("서울-목포", "2호차3C", 32000));
		onSys.setTlist(new Ticketing("대전-인천", "3호차4B", 40000));
		onSys.showList();
		
	}

}
// ex) 코레인예매시스템
//	OnTrain(시스템명,ArrayList<Ticketing>)		Ticketing(구간, 좌석, 비용)
class OnTrain{
	private String sysName;
	private ArrayList<Ticketing> tlist;
	public OnTrain(String sysName) {
		this.sysName = sysName;
		this.tlist = new ArrayList<Ticketing>();
	}
	public void setTlist(Ticketing tk) {
		this.tlist.add(tk);
		System.out.println(tk.getFromTo()+"예매 추가");
	}
	public void showList() {
		System.out.println("시스템명:"+this.sysName);
		if(this.tlist.size()>0) {
			System.out.println("예매 내역 리스트");
			System.out.println("구간\t좌석\t비용");
			for(Ticketing t:tlist) {
				t.ticketInfo();
			}
		}else {
			System.out.println("예매 내역이 없습니다.");
		}
	}
}
class Ticketing{
	private String fromTo;
	private String seat;
	private int pay;
	public Ticketing(String fromTo, String seat, int pay) {
		this.fromTo = fromTo;
		this.seat = seat;
		this.pay = pay;
	}
	public void ticketInfo() {
		System.out.print(this.fromTo+"\t");
		System.out.print(this.seat+"\t");
		System.out.print(this.pay+"\n");
	}
	public String getFromTo() {
		return fromTo;
	}
	public void setFromTo(String fromTo) {
		this.fromTo = fromTo;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
}
/*
class OnTrain{
	private String systemname;
	private ArrayList<Ticketing> tlist;
	public OnTrain(String systemname) {
		this.systemname = systemname;
		this.tlist = new ArrayList<Ticketing>();
	}
	public void addReserSeat(Ticketing t) {
		this.tlist.add(t);
		System.out.println(t.getSection()+" 구간의 "+t.getSeat()+"좌석이 예약되었습니다.");
	}
	public void addReserAll(ArrayList<Ticketing> tlist){
		this.tlist = tlist;
		this.addReserAll(tlist);
		System.out.println(tlist.size()+"개의 좌석이 예약되었습니다.");
	}
	public void showReserAllList() {
		System.out.println("#"+this.systemname+"시스템의 예약좌석 현황#");
		if(this.tlist.size()>0) {
			System.out.println("구간\t좌석\t비용");
			for(Ticketing t:this.tlist) {
				System.out.print(t.getSection()+"호차\t");
				System.out.print(t.getSeat()+"\t");
				System.out.print(t.getPrice()+"원\t");
			}
		}else {
			System.out.println("아직 예약이 되지 않았습니다.");
		}
	}
	public String getSystemname() {
		return systemname;
	}
	public void setSystemname(String systemname) {
		this.systemname = systemname;
	}
	public ArrayList<Ticketing> getTlist() {
		return tlist;
	}
	public void setTlist(ArrayList<Ticketing> tlist) {
		this.tlist = tlist;
	}
	
	
}
class Ticketing{
	private int section;
	private int seat;
	private int price;
	public Ticketing(int section, int seat, int price) {
		this.section = section;
		this.seat = seat;
		this.price = price;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
*/