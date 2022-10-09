package javaexp.z01_homework;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;

public class A22_0921 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 3. List<Player>를 통해 Player팀명,선수명,성적을 선언하고, 
		 회원등록/수정/삭제 처리를 하세요.
		 Player 클래스 선언
		  add(new Player())
		  set(index,new Player())
		  remove(index)*/
		/*
		List<Player> plist = new ArrayList<Player>();
		// 객체 등록
		// 기본 제일 뒤에 
		plist.add(new Player("LG","김길동",0.342));
		plist.add(new Player("SSG","신길동",0.292));
		plist.add(new Player("두산","마길동",0.321));
		//3번쨰 위치에 할당(0부터 index)
		plist.add(2,new Player("삼성","삼성",0.341));
		System.out.println("크기:"+plist.size());
		// 객체 수정.
		plist.set(1, new Player( "KT","오길동", 0.285));
		// 객체 삭제
		plist.remove(0);
		for(Player p : plist) {
			System.out.println(p.getName()+":"+p.getTname()+":"+p.getRecord());
		}
	*/
		/*
		5. 위 3번 선수데이터를 임의로 5명 정도 등록하고, 
		  				선수의 이름과 성적으로 검색되는 로직를 처리하세요.
		 	1.선수등록 plist.add(new Player())
		 	2.Scanner 생성
		 		이름: ==> schName
		 		성적: ==> schRecord 형변환 처리 Double.parseDouble()
		 		둘 중에 하나만 맞으면 검색(or)
		 	3. 
		 	   List<Player> schRList = new ArrayList<Player>();
		 		for(Player p : plist)
		 			if(p.getName().equals(schName)){ //정확한 이름이 있을 때
		 			}
		 			if(p.getName().indexOf(schName)!=-1 || 
		 				schRecord==p.getRecord()){ // 해당 keyword가 있으면 검색
					schRList.add(p);
					}
				}
			4. 검색 결과 출력
				if(schRList.size()>0){
					for(Player p : schRList){
						p.getTname(), p.getName(),p.getRecord()
					}
				}else{
					검색된 결과가 없습니다.
				}
				
		*/
		/*
		// 정답
		plist.add(new Player("KT","이영철", 0.301));
		plist.add(new Player("SK","홍현만", 0.312));
		System.out.println("데이터 건수:"+plist.size());
		System.out.println("# 전체 list #");
		for(Player p:plist) {
			System.out.println(p.getTname()+"\t"+p.getName()+"\t"+p.getRecord());
		}
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 이름:");
		String schName = sc.nextLine();
		System.out.print("검색할 성적:");
		double schRecord = Double.parseDouble(sc.nextLine());
		List<Player> schRList = new ArrayList<Player>(); //검색된 결과 내용
		for(Player p : plist) {
			// indexOf() : 해당 문자가 포함되어 있으며 해당 index 위치를 리턴.
			// equals() : 해당 문자열이 정확하게 있으면...
			if(p.getName().indexOf(schName)!=-1 ||  // 해당 keyword가 있으면 검색
	 				schRecord==p.getRecord()){ 
				schRList.add(p);
				}
		}
		System.out.println(" # 검색 결과 #");
		if(schRList.size()>0) {
			for(Player p : schRList) {
				System.out.println(p.getTname()+"\t"+p.getName()+"\t"+p.getRecord());
			}
		}else{
			System.out.println("검색된 결과가 없습니다.");
		}
	}
}
class Player{
	private String tname;
	private String name;
	private double record;
	public Player(String tname, String name, double record) {
		super();
		this.tname = tname;
		this.name = name;
		this.record = record;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getRecord() {
		return record;
	}
	public void setRecord(double record) {
		this.record = record;
	}
	
}*/
		/*
		
		List<Player> plist = new ArrayList<Player>();
		plist.add(new Player("토트넘", "손흥민", 3));
		plist.add(new Player("토트넘", "케인", 1));
		plist.add(new Player("토트넘", "벤탄쿠르", 1));
		plist.add(new Player("토트넘", "다이어", 1));
		plist.add(new Player("토트넘", "세세뇽", 0));
		System.out.println("등록되어있는 선수 수: "+plist.size()+"명");
		
		
		Map<String, Integer> playerMap = new HashMap<String,Integer>();
		for(Player p:plist) {
		System.out.println(p.getTname()+" 팀의 "+p.getPlayername()+" 선수 "+p.getScore()+"골");
		playerMap.put(p.getPlayername(), p.getScore());
		}
		System.out.println("\n# 선수의 이름과 성적 로직 #");
		System.out.println("성적이 궁금한 선수의 이름을 검색하세요.");
		Scanner sc = new Scanner(System.in);
		String inputPlayer = sc.nextLine();
		Set<String> playerMapKey =  playerMap.keySet();
		for(String key:playerMapKey) {
//			System.out.println(key+":"+playerMap.get(key));
			int findIdx = key.indexOf(inputPlayer);
			if(findIdx!=-1) {
				System.out.println(key+":"+playerMap.get(key)+"골");
			}
		}
	
		
		System.out.println();
		System.out.println("# 선수등록 수정 후 #");
		plist.set(3, new Player("레스터","메디슨", 1)); // 다이어 선수를 변경
		for(Player p:plist) {
			System.out.println(p.getTname()+" 팀의 "+p.getPlayername()+" 선수 "+p.getScore()+"골");
			}
		System.out.println();
		System.out.println("# 선수등록 삭제 후 #");
		plist.remove(2); // 벤탄쿠르 삭제
		System.out.println("등록되어있는 선수 수: "+plist.size()+"명");
		for(Player p:plist) {
			System.out.println(p.getTname()+" 팀의 "+p.getPlayername()+" 선수 "+p.getScore()+"골");
			}
		}
}
class Player{
	private String tname;
	private String playername;
	private int Score;
	public Player(String tname, String playername, int score) {
		this.tname = tname;
		this.playername = playername;
		Score = score;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getPlayername() {
		return playername;
	}
	public void setPlayername(String playername) {
		this.playername = playername;
	}
	public int getScore() {
		return Score;
	}
	public void setScore(int score) {
		Score = score;
	}
}
*/
		/*
		 * 4. List<Card>를 통해 카드(모양,번호) 52장을 만들고, 
		 * 임의의 카드 7장을 추출하여 출력하세요.
		 1. Card 클래스 shape, no
		 2. 2중 for문을 이용해서 Card 생성
		 	모양 배열 선언
		 	번호 ArrayList 선언
		 	for(){} 모양
		 		for(){} 번호
		 			cardList.add(new Card(모양, 번호));
		 3. 임의의 카드 7장 추출
		 	Random r = new Random();
		 	ArrayList<Card> team01 = new ArrayList<Card>();
		 	for(1~7)
		 		int rIdx = r.nextInt(52); // 0~51 임의값 추출
		 		team01.add(cardList.get(rIdx));
		 */
//	정답
		/*
		String[] shapes = {"♥","♣","♠","◆"};
		ArrayList<String> nums = new ArrayList<String>();
		nums.add("A");
		for(int cnt=2;cnt<=10;cnt++) {
			nums.add(""+cnt); // 자동 형변환
//			nums.add(Integer.valueOf(cnt).toString());
		}
		nums.add("J");nums.add("Q");nums.add("K");
		List<Card> cardList = new ArrayList<Card>();
		for(String shape:shapes) {	// 모양 반복
			for(String num:nums) {	// 번호 반복
				cardList.add(new Card(shape,num));
				}
			}
		int cnt=1;
		for(Card c:cardList) {
			System.out.println(cnt+++":"+c.getShape()+c.getNo());
		}
		// 7개 카드 추출
		List<Card> team01 = new ArrayList<Card>();
		List<Card> team02 = new ArrayList<Card>();
		Random r = new Random();
		for(cnt=1;cnt<=7;cnt++) {
			int rIdx = r.nextInt(52);
			team01.add(cardList.get(rIdx));
		}
		for(cnt=1;cnt<=7;cnt++) {
			int rIdx = r.nextInt(52);
			team02.add(cardList.get(rIdx));
		}
		System.out.println("# 1번째 팀카드 #");
		for(Card d:team01) System.out.print(d.getShape()+d.getNo()+" ");
		System.out.println();
		System.out.println("# 2번째 팀카드 #");
		for(Card d:team02) System.out.print(d.getShape()+d.getNo()+" ");
		System.out.println();
		// 로직에 의해 중복을 배제 1..
		// 기능 객체에 의해 섞어 주는 처리.
		
		Collections.shuffle(cardList); //52객체를 임의의 순서로 만들기.
		cnt=1;
		System.out.println("# 1번 팀 #");
		for(int idx=0;idx<7;idx++) {	// 1~7
			Card d = cardList.get(idx);
			System.out.print(d.getShape()+d.getNo()+" ");
		}
		System.out.println();
		System.out.println("# 2번 팀 #");
		for(int idx=7;idx<14;idx++) {	// 8~14
			Card d = cardList.get(idx);
			System.out.print(d.getShape()+d.getNo()+" ");
		}
	}
}

class Card{
	private String shape;
	private String no;
	public Card(String shape, String no) {
		super();
		this.shape = shape;
		this.no = no;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
}*/
		/*
//		String []clist.main(args) = {"♠","♥","♣","◆"};
//		String []nums = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
//		String cards[] = new String[52];
//		Card sh = new Card();
		String shapeData = "♠&♥&♣&◆";
		String [] shapeArr = shapeData.split("&");
		String numberData = "A&2&3&4&5&6&7&8&9&10&J&Q&K";
		String [] numArr = numberData.split("&");
//		sh.setShape(shapeData.split("&"));
//		sh.setNumber(numberData.split("&"));
		
//		System.out.println(sh.getShape()[1]);
//		System.out.println(sh.getDataShape(););
		
		List<Card> clist = new ArrayList<Card>();
		
//		clist.add(new Card(shapeArr,numArr));
			for(String s:shapeArr) {
				for(String n:numArr) {
					clist.add(new Card(s,n));
				}
			}
//			for(String s:sh.getShape()) {
//				for(String n:sh.getNumber()) {
//					clist.add(new Card(s,n));
//				}
//			}
		
//			for(int idx=0;idx<shapeArr.length;idx++) {
//				for(int jdx=1;jdx<numArr.length;jdx++) {
//					clist.add(new Card(shapeArr,numArr));
////					clist.add(new Card(sh.setShape,sh.setNumber);
//				}
				System.out.println("# 임의의 7장의 카드 #");
				for(int cnt1=1;cnt1<=7;cnt1++) {
					int rIdx = (int)(Math.random()*52);
					Card ca1 = clist.get(rIdx);
					System.out.println(ca1.getShape()+" "+ca1.getNumber());
				}
//				clist.add(new Card(sh.getShape()[idx], sh.getNumber()[jdx]));
				
//				clist.get(0) = sh.getShape()[idx] + sh.getNumber()[jdx];
//				clist.add(new Card(sh.getShape()[idx], sh.getNumber()[jdx]));
//				System.out.println(sh.getShape()[idx]);
//				System.out.print(sh.getNumber()[jdx]+" ");
			}
		}
class Card{
	private String shape;
	private String number;
	public Card() {
	}
	public Card(String shape, String number) {
		this.shape = shape;
		this.number = number;
	}
	public String getShape() {
			return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
}
*/

/*
 * 6. 주머니속에 1000원 2장, 5000원 3장, 10000원 2장을 넣었을 때, Set객체로 처리하여 안에 있는
      금액의 합산을 출력하세요
		Set<Integer> pouch = new HashSet<Integer>();
		pouch.add(1000);
		pouch.add(1000);
		pouch.add(5000);
		pouch.add(5000);
		pouch.add(5000);
		pouch.add(10000);
		pouch.add(10000);
		int tot =0;
		System.out.print("주머니 속에 있는 돈:");
		for(int money:pouch) {
			System.out.print(money+"원\t");
			tot+= money;
		}
		System.out.println("\n주머니속 금액의 합산: "+tot+"원");
		 */
		/*
		 8. Map<String, Civilian> 형태로 주민번호와 주민(이름, 사는곳)을 설정하여 5명을 할당하고, 출력하세요
		 
			Map<String,Civilian> id= new HashMap<String,Civilian>();
			id.put("971101-1******", new Civilian("김 빈", "인천"));
			id.put("911201-2******", new Civilian("이영희", "서울"));
			id.put("950101-2******", new Civilian("신 진", "시흥"));
			id.put("980316-1******", new Civilian("김우빈", "부산"));
			id.put("990627-2******", new Civilian("김진희", "천안"));
			Set<String> idKey =  id.keySet();
			System.out.println("주민번호\t\t이름\t사는곳");
			for(String key:idKey) {
				System.out.print(key+"\t");
				Civilian cv = id.get(key);
				System.out.print(cv.getName()+"\t");
				System.out.print(cv.getAddress()+"\n");
			}
	}
}
class Civilian {
	private String name;
	private String address;
	public Civilian(String name, String address) {
		this.name = name;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
		*/
/*
1. ArrayList<Integer>로 데이터를 1~100까지 임의로 할당 후, 가장 적은 데이터를 가져오는 로직 중,
잘못된 line은 무엇인가?*/
		ArrayList<Integer> points = new ArrayList<Integer>();
		points.add(new Integer(70));	
		points.add(90); 
		points.add(new Integer("80"));
		int minPoint = 100;		// 배열에서 최소값을 도출할 떄는 나올 수 있는 최대값을 
		int maxPoint = 0; // 최대값을 도출할 때는 나올 수 있는 최소값을 설정..
		// 초기값을 설정하고
		for(int num01:points){	
			System.out.println("최소값:"+num01+":"+minPoint);
			System.out.println("최대값:"+num01+":"+maxPoint);
			// 초기 최소값보다 적은 값이 나올 때, 최소값으로 설정..
			if(minPoint > num01){
					minPoint=num01;
			}		
			if(num01 > maxPoint) { // 나온 값이 현재 설정된 최대값보다 많을 때..
				maxPoint=num01;
			}
		}
		System.out.println("최소값:"+minPoint);
		System.out.println("최대값:"+maxPoint);
	}
}
