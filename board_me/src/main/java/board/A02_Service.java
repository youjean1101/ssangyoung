package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
