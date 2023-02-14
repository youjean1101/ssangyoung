package board;

import java.util.List;

import board.vo.BaseBallTeam;
import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;
import board.vo.Member;

public interface A03_Dao {
	public int totCnt(BoardSch sch);
	
	public List<Board> boardList(BoardSch sch);
	public void insertBoard(Board ins);
	public Board getBoard(int no);
	public void uptReadCnt(int no);
	public void insertUploadFile(BoardFile f);
	public void uptBoardFile(BoardFile upt);
	public String getBoardFile(int no);
	
	public void updateBoard(Board upt);
	public void deleteBoard(int no);
	
	public Member login(Member m);
	
	// 과제
	public List<BaseBallTeam> baseballList();
	public void insertBaseballTeam(BaseBallTeam ins);
	public BaseBallTeam BaseballTeamDetail(int teamno);
}
