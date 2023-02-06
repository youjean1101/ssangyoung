package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.vo.BaseBallTeam;
import board.vo.Board;
import board.vo.BoardSch;

@Service
public class A02_Service {
	@Autowired(required=false)
	private A03_Dao dao;
	
	public List<Board> boardList(BoardSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getWriter()==null) sch.setWriter("");
		return dao.boardList(sch);
	}
	public void insertBoard(Board ins){
		dao.insertBoard(ins);
	}
	
	public Board getBoard(int no) {
		return dao.getBoard(no);
	}
	public void uptReadCnt(int no) {
		dao.uptReadCnt(no);
	}
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
