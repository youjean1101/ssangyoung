package bikeweb.dao;

import com.bikeWeb.vo.MemberVo;

public interface UserDao {
	public void signup(MemberVo ins);
	
	public int invalidId(String id);
	public int login(MemberVo login);
	
	public MemberVo getId(String id);
	public void uptInfo(MemberVo upt);
	public void delInfo(String id);
	public String getAuth(String id);
}
