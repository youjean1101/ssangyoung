package boardexp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boardexp.vo.Boardexp;
import boardexp.vo.Boardexp_seq;

@Service
public class A02_Service {
	
	@Autowired(required=false)
	private A03_Dao dao;
	
	public List<Boardexp> boardexpList(Boardexp_seq bno){
		return dao.boardexpList(bno);
	}
}
