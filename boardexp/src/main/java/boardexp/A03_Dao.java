package boardexp;

import java.util.List;

import boardexp.vo.Boardexp;
import boardexp.vo.Boardexp_seq;

public interface A03_Dao {
	public List<Boardexp> boardexpList(Boardexp_seq bno);
}
