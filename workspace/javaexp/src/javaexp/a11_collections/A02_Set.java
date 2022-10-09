package javaexp.a11_collections;

import java.util.HashSet;
import java.util.Set;

public class A02_Set {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 # Set 컬렉션
		 1. 특징
		 	수학의 집합에 비유
		 	저장 순서가 유지되지 않음.
		 	객체를 중복 저장 불가
		 	하나의 null만 저장 가능
		 2. 구현 클래스
		 	HashSet, LinkedHashSet, TreeSet
		 3. 주요 메서드
		 	.add()
		 	.contains()
		 	.isEmpty()
		 	Iterator<E> iterator()
		 	.size()
		 	.clear()
		 	.remove(Object ob)
		 	# 전체 객체 대상으로 한번씩 반복해 가져오는 반복자(Iterator) 제고
		 		- 인덱스로 객체를 검색해서 가져오는 메소드 없음.
		 4. HashSet
		 	1) Set<E> set = new HashSet<E>();
		 	2) 특징
		 		동일 객체 및 동등 객체는 중복 저장하지 않음.
		 		동등 객체 판단 hashCode ==> equals
		 */
		Set<String> set = new HashSet<String>();
		set.add("오렌지");
		set.add("수박");
		set.add("오렌지");
		set.add("사과");
		set.add("바나나");
		set.add("딸기");
		set.add("딸기");
		set.add("딸기");
		System.out.println("#저장된 set#");
		for(String fruit:set) {
			System.out.println(fruit);
		}
		// ex) 주머니 속에 구슬 빨강 2개, 파랑 3개, 노랑 2개를 Set으로 할당하고 for문을 통해 
		//		출력해서, 들어가 있는 모든 구슬의 갯수를 출력하세요.
		Set<String> bead= new HashSet<String>();
		bead.add("빨강구슬");
		bead.add("빨강구슬");
		bead.add("파랑구슬");
		bead.add("파랑구슬");
		bead.add("파랑구슬");
		bead.add("노랑구슬");
		bead.add("노랑구슬");
		System.out.println("# 마법 주머니(set) 속에 구슬 #");
		for(String one:bead) {
			System.out.println(one);
		}
		System.out.println("총 구슬 수:"+bead.size());
	
	}
}
