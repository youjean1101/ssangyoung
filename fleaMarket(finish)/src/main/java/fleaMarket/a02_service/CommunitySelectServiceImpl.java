package fleaMarket.a02_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import fleaMarket.a03_dao.CommunitySelectDao;
import fleaMarket.a03_dao.ReplyDao;
import fleaMarket.util.FileService;
import vo.CapplicationList;
import vo.Criteria;
import vo.guestBookVo;
import vo.irregularReportVo;



@Service
public class CommunitySelectServiceImpl implements CommunitySelectService {
	
	private CommunitySelectDao mapper;
	private ReplyDao rmapper;
	private FileService fservice;
	
	
	@Value("${board.upload2}")
	private String filePath;
	/**
	 * @param dao
	 * 생성자 주입 
	 */
	@Autowired
	public CommunitySelectServiceImpl(CommunitySelectDao mapper,ReplyDao rmapper,FileService fservice) {
		this.mapper = mapper;
		this.rmapper = rmapper;
		this.fservice = fservice;
	}
	// 페이징 처리를 위한 전체 게시물 갯수
	@Override
	public int getCommunitySelectNum(Criteria cri) {
		// TODO Auto-generated method stub	
		return mapper.getCommunitySelectNum(cri);
	}
	// 페이징 쿼리 적용한 게시물 리스트 
	public List<CapplicationList> getCommunityList(Criteria cri) {
		// TODO Auto-generated method stub
		//service에서 set을 통해 정렬 된 리스트를 받아올 수 있게 비즈니스 로직 처리
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("likeCnt");
		}
		
		System.out.println("shift"+":"+cri.getShift());
		//게시판 카테고리 비즈니스 로직 설정
		List<CapplicationList> clist = new ArrayList<CapplicationList>();
		clist = mapper.getCommunityList(cri);
		//좋아요 처리 
		//이미지 파일 처리 
		if (clist.size() >= 1) {
			for (int i = 0; i < clist.size(); i++) {
				CapplicationList cap = (CapplicationList) clist.get(i);
				//좋아요 처리
				int likecnt = mapper.getLikeCnt(cap.getCommunitynumber());
				cap.setLikeCnt(likecnt);
				Optional<String> opt = Optional.ofNullable(cap.getImgName());
				String separate = opt.orElse("default_Img.png");
				
				if(separate==null) separate="";
				// 공백처리
				// System.out.println(separate);
				StringTokenizer st = new StringTokenizer(separate, "&SEP&");
				if (st.hasMoreElements()) {
					clist.get(i).setImgName(st.nextToken());
				}
			}
		}
		// 댓글 수 처리 
		for(int i = 0;i<clist.size();i++) {
			int s = rmapper.getReplyCnt(clist.get(i).getCommunitynumber());
			clist.get(i).setRepCnt(s);
		}
		
		return clist;
	}
	@Override
	public int getCommunityBestCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getBestCommunityListNum(cri);
	}
	@Override
	public List<CapplicationList> getCommunityBestList(Criteria cri) {
		// TODO Auto-generated method stub
		List<CapplicationList> clist = new ArrayList<CapplicationList>();
		
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("likeCnt");
		}		
		clist = mapper.getBestCommunityList(cri);
		
		if (clist.size() >= 1) {
			for (int i = 0; i < clist.size(); i++) {
				CapplicationList cap = (CapplicationList) clist.get(i);
				int likecnt = mapper.getLikeCnt(cap.getCommunitynumber());
				cap.setLikeCnt(likecnt);
				Optional<String> opt = Optional.ofNullable(cap.getImgName());
				String separate = opt.orElse("default_Img.png");
				// 공백처리
				// System.out.println(separate);
				StringTokenizer st = new StringTokenizer(separate, "&SEP&");
				if (st.hasMoreElements()) {
					clist.get(i).setImgName(st.nextToken());
				}
			}
		}
		// 댓글 수 처리 
				for(int i = 0;i<clist.size();i++) {
					int s = rmapper.getReplyCnt(clist.get(i).getCommunitynumber());
					clist.get(i).setRepCnt(s);
				}
		return clist;
	
	}
	@Override
	public List<CapplicationList> getCommunityDetailList(Criteria cri) {
		// TODO Auto-generated method stub
		if(cri.getShift()==null || cri.getShift().equals("1")) {
			cri.setShift("registDate");
		}
		if(cri.getShift().equals("2")) {
			cri.setShift("viewCnt");
		}
		if(cri.getShift().equals("3")) {
			cri.setShift("likeCnt");
		}		
	    
		return mapper.getCommunityDetailList(cri);
	}
	
	@Override
	public List<String> getCommunityImg(int communityNumber) {
		// TODO Auto-generated method stub
		String img = mapper.getCommunityImgList(communityNumber);
		List<String> slist = new ArrayList<>();
		//Null 처리 
		Optional<String> opt = Optional.ofNullable(img);
	    String separate = opt.orElse("default_Img.png");
	    
		System.out.println(separate);
	    StringTokenizer st = new StringTokenizer(separate,"&SEP&");
		int s = 0;
		//이미지 파일이 한개일때 
		if(st.countTokens()==1) {
			slist.add(separate);
		}
		//이미지 파일이 여러개일때 
		if(st.countTokens()>1) {				
				while(st.hasMoreTokens()) {
					slist.add(s, st.nextToken());
					s++;
				}
		}
		
		return slist;					
	}
	
	@Override
	// int 1, 0 
	public int getFollowYesOrNot(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber", communityNumber);
		map.put("session",email);
		return mapper.getFollowYesOrNot(map);
				
	}
	@Override
	public int getInsertFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		if(myEmail==null) myEmail = "";
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getInsertFriend(map);
	}
	@Override
	public int getDeleteFriend(String myEmail, String following) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap<String,String>();
		if(myEmail==null) myEmail = "";
		map.put("myEmail",myEmail);
		map.put("following",following);
		return mapper.getDeleteFriend(map);
	}
	@Override
	public int getLikeYesOrNot(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber", communityNumber);
		map.put("session",email);
		return mapper.getLikeYesOrNot(map);
	}
	@Override
	public int getLikeCnt(int communityNumber) {
		// TODO Auto-generated method stub	
		return mapper.getLikeCnt(communityNumber);
	}
	@Override
	public String getInsertLike(int communityNumber,String email) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber",communityNumber);
		map.put("email", email);
		int result = mapper.getLikeInsert(map);
		String msg = "";
		if(result == 1) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		return msg;
	}
	@Override
	public String getDeleteLike(int communityNumber,String email) {
		// TODO Auto-generated method stub
		//파일 삭제 
		
		Map<String,Object> map = new HashMap<String,Object>();
		if(email==null) email = "";
		map.put("communityNumber",communityNumber);
		map.put("email", email);
		int result = mapper.getLikeDelete(map);
		String msg = "";
		if(result == 1) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		return msg;		
	}
	@Override
	//조회수 update 
	public void updateViewCnt(int communityNumber) {
		// TODO Auto-generated method stub
		mapper.updateViewCnt(communityNumber);
	}
	@Override
	public int getDeleteBoard(int communityNumber, String email) {
		// TODO Auto-generated method stub
		// 파일 DB 삭제
		
		String img = mapper.getCommunityImgList(communityNumber);
		List<String> slist = new ArrayList<>();
		//Null 처리 
		Optional<String> opt = Optional.ofNullable(img);
	    String separate = opt.orElse("");
	    
	    if(separate!="") {
	    	StringTokenizer st = new StringTokenizer(separate,"&SEP&");
	    	int s = 0;
			//이미지 파일이 한개일때 
			if(st.countTokens()==1) {
				slist.add(separate);
			}
			//이미지 파일이 여러개일때 
			if(st.countTokens()>1) {				
					while(st.hasMoreTokens()) {
						slist.add(s, st.nextToken());
						s++;
					}
			}
			
			for(int i=0;i<slist.size();i++) {
				System.out.println(slist.get(i));
				//파일 삭제 
			    fservice.DeleteFile(filePath, slist.get(i));
			}
	    }
	    
	    
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("communityNumber",communityNumber);
		map.put("email", email);
		return mapper.deleteBoard(map);
	}
	@Override
	public int insertIrrReport(irregularReportVo vo) {
		// TODO Auto-generated method stub
		int result = 0;
		//중복확인 
		if(mapper.getCountReport(vo)==0) {
			result = mapper.insertIrrReport(vo);
		}
		
		return result;
	}
	@Override
	public List<irregularReportVo> getIrrReportList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getIrrReportList(cri);
	}
	@Override
	public int getIrrNum(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getIrrNum(cri);
	}
	@Override
	public List<guestBookVo> guestBookList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.guestBookList(cri);
	}
	@Override
	public int getGuestBookNum(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.guestBookNum(cri);
	}
	@Override
	public int insertGuestBook(guestBookVo vo) {
		// TODO Auto-generated method stub
		return mapper.insertGuestBook(vo);
	}
	@Override
	public int updateGuestBook(guestBookVo vo) {
		// TODO Auto-generated method stub
		return mapper.updateGuestBook(vo);
	}
	@Override
	public int deleteGuestBook(int guestBookid) {
		// TODO Auto-generated method stub
		return mapper.deleteGuestBook(guestBookid);
	}
	
	
		
}
