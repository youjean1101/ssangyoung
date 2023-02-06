package board;

import java.util.List;

import board.vo.BaseBallTeam;
import board.vo.Board;
import board.vo.BoardSch;

public interface A03_Dao {
	public List<Board> boardList(BoardSch sch);
	public void insertBoard(Board ins);
	public Board getBoard(int no);
	public void uptReadCnt(int no);
	
	public List<BaseBallTeam> baseballList();
	public void insertBaseballTeam(BaseBallTeam ins);
	public BaseBallTeam BaseballTeamDetail(int teamno);
}