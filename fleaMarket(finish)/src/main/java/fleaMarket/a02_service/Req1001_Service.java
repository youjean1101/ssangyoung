package fleaMarket.a02_service;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import fleaMarket.a03_dao.Req1001_Dao;
import fleaMarket.util.FileService;
import vo.FApplicationSch;
import vo.FleaMarket;
import vo.Member;
import vo.ProfileImg;
import vo.QNA;
import vo.QNAFile;
@Service 
public class Req1001_Service {
	
	@Value("${qna.upfile}")
	private String qnafilepath;
	@Value("${board.upload2}")
	private String communityfilepath;
	@Value("${fleamarket.upload3}")
	private String fleamarketfilepath;
	@Value("${app.upload}")
	private String applicationfilepath;
	@Value("${profile.upload}")
	private String profilepath;
	
	@Autowired
	private Req1001_Dao dao;
	@Autowired
	private FileService fileservice;
	
	public List<Member> MemberList(FApplicationSch sch){
		
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getSearch()==null) sch.setSearch("전체");
		
		// 1. 총페이지 수
				sch.setCount(dao.totMemCnt(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		
		
		
		return dao.MemberList(sch);
}
	public Member getMember(String nickname) {
		return dao.getMember(nickname);
	}
	
	public void UpdateMemberInfo(Member upt){
		dao.UpdateMemberInfo(upt);
	}
	
	public void UpdateProfile(ProfileImg upt) {
		dao.UpdateProfile(upt);
	}
	
	public void UpdatePassword(Member upt) {
		upt.setPassword(BCrypt.hashpw(upt.getPassword(), BCrypt.gensalt()));
		dao.UpdatePassword(upt);
	}
	
	public Member getLogin(String email){
		return dao.Login(email);
	}
	
	
	

	/*
	 * public void DeleteMember(List<String> email) { dao.DeleteMember(email); }
	 */
	public List<FleaMarket> FleaMarketList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt2(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.FleaMarketList(sch);
	}
	//공지사항 리스트
	public List<QNA> QNAListNotics(){
		return dao.QNAListNotics();
	}
	//문의/답변 리스트
	public List<QNA> MemberQNAList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt3(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.MemberQNAList(sch);
	}
	//미답변글 갯수
	public int NoAnswerQnaList() {
		return dao.NoAnswerQnaList();
	}
	public ProfileImg getMemberProfile(String email) {
		return dao.getMemberProfile(email);
	}
	
	public List<QNA> QNAList(FApplicationSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(10);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//		100건?	100/5 ==> 20 page 필요
				//		101건?	101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				if(((blocknum-1)*sch.getBlockSize()+1)<0) {
					sch.setStartBlock(0);
				}
		return dao.QNAList(sch);
	}
	public QNA getQNA(String qnano) {
		return dao.getQNA(qnano);
		
	}	
	public List<QNAFile> getQNAFile(String qnano) {
		return dao.getQNAFile(qnano);
	}
	
public void DeleteMembers(List<String> email) {
	for(String e:email) {
		LeaveMember(e);
	}
}
	
//회원 삭제시 받아올 파일리스트들
public void LeaveMember(String email) {
	
	//파일 경로 리스트
	List<String> filepaths = Arrays.asList(profilepath,qnafilepath,communityfilepath,fleamarketfilepath,applicationfilepath);
	//파일 이름 리스트의 리스트 ㅋㅋ!!
	List<List<String>> totfileLists = new ArrayList<List<String>>();
	// 경로,파일List를 담을 MapList
	List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
	
	//1.프로필 이미지
	String profile =  dao.DeleteProFileList(email);
	List<String> PFL = Arrays.asList((profile==null)?"NoneImageName":profile);
	totfileLists.add(PFL);
	
	
	//2.문의/공지글 파일리스트
	List<String> QFL = dao.DeleteQnaFileList(email);
	totfileLists.add(QFL);
	
	
	//3.커뮤니티 파일리스트 - 쿼리문에 where imgfilename = not null추가해서 오류방지 추가
	List<String> CFL = dao.DeleteCommunityFileList(email);
	List<String> CFLS = new ArrayList<String>(); //정리해서 담을 새로운 List선언하고 잘라서 만든 list를 최종 List에 할당
	 for(String a:CFL) {
		 List<String> b = Arrays.asList(a.split("&SEP&")); 
		 CFLS.addAll(b);
	 }
	 totfileLists.add(CFLS);
	 
	 
	//4.동은파일리스트
	List<String> FFL = dao.DeleteFleamarketFileList(email);
	totfileLists.add(FFL);
	 
		 
	//5.미리파일리스트
	List<String> AFL = dao.DeleteApplicationFileList(email);
	List<String> AFLS = new ArrayList<String>(); //미리파트 정리해서 담을 새로운 List
	for(String c:AFL) {
		List<String> d = Arrays.asList(c.split(","));
		AFLS.addAll(d);
	}
	System.out.println(AFLS.size());
	totfileLists.add(AFLS);
	 
	 
    //파일경로 리스트,파일 이름리스트를 ==> 맵형식으로 바꿈 ==> 리스트맵에 할당 
	Map<String, Object> map;
	for(int i=0; i<filepaths.size()-1; i++) {
		 map = new HashMap<String,Object>();
		 map.put("filepath", filepaths.get(i));
		 map.put("filename", totfileLists.get(i));
		 listmap.add(map);
	}
	 
		
	for(Map<String,Object> filemap:listmap) {
		 String filepath = (String)filemap.get("filepath");
		 for(String filename:(List<String>)filemap.get("filename")) {
			 fileservice.DeleteFile(filepath,filename);
		 }
	 }
		dao.DeleteMember(email);
	}
	
	
	
}
