package board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.vo.BaseBallTeam;
import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;
import board.vo.Member;

@Service
public class A02_Service {
	@Autowired(required=false)
	private A03_Dao dao;
	
	public List<Board> boardList(BoardSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getWriter()==null) sch.setWriter("");
		// 1. 총페이지 수(행수)
		sch.setCount(dao.totCnt(sch));
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
		//		100건? 100/5 ==> 20 page 필요
		//		101건? 101/5 ==> 21 page 필요(올림처리 필요)
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
// 		블럭의 [이후]에 대한 예외 처리..
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// 5. 마지막 번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		// 6. 블럭처리
		//		1) 블럭 크기 지정
		sch.setBlockSize(5);
		// 		2) 블럭 번호 지정 : 현재 페이지 번호/블럭의 크기 올림 처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		//		3) 마지막 블럭
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		
		sch.setEndBlock(endBlock);
		//		4) 시작 블럭
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.boardList(sch);
	}
	@Value("${user.upload}")
	private String upload;

	private void uploadFile(MultipartFile f){
		String fname = f.getOriginalFilename();
		File fObj = new File(upload+fname);
		try{
			System.out.println("## 파일 업로드 처리:"+upload+fname);
			f.transferTo(fObj);
		}catch(Exception e){
				System.out.println("업로드예외:"+e.getMessage());
		}			
	}
	public void insertBoard(Board ins) {
		dao.insertBoard(ins);
		String fname = ins.getReport().getOriginalFilename();
		//if( !fname.equals("") ){
			uploadFile(ins.getReport());
			BoardFile f = new BoardFile();
			f.setFname(fname);
			f.setEtc(ins.getSubject());
			dao.insertUploadFile(f);
		//}
	}		
	public Board getBoard(int no) {
		Board b = dao.getBoard(no);
		// 해당 번호에 파일 정보를 가져오는 처리..
		b.setFname(dao.getBoardFile(no));
		return b;
	}	
	public void insertUploadFile(BoardFile f) {
		dao.insertUploadFile(f);
	}
	public String getBoardFile(int no) {
		return dao.getBoardFile(no);
	}
	public void uptReadCnt(int no) {
		dao.uptReadCnt(no);
	}
	public void updateBoard(Board upt) {
		dao.updateBoard(upt);
		String fname = upt.getReport().getOriginalFilename();
		//if( !fname.equals("") ){
			uploadFile(upt.getReport());
			BoardFile f = new BoardFile();
			f.setNo(upt.getNo());
			f.setFname(fname);
			f.setEtc(upt.getSubject());
			// merge르르 이용하면 fname만 추가해도 됨..
			dao.uptBoardFile(f);
		//}
	}
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	public Member login(Member m) {
		return dao.login(m);
	}
	
	//과제
	public List<BaseBallTeam> baseballList(){
		return dao.baseballList();
	}
	public void insertBaseballTeam(BaseBallTeam ins) {
		dao.insertBaseballTeam(ins);
	}
	public BaseBallTeam BaseballTeamDetail(int teamno) {
		return dao.BaseballTeamDetail(teamno);
	}
	
}
