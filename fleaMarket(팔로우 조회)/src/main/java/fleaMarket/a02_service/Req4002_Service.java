package fleaMarket.a02_service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import fleaMarket.a03_dao.Req4002_Dao;
import vo.BoardImg;
import vo.Capplication;
import vo.FollowMemberInfo;

@Service
public class Req4002_Service {
	@Autowired(required=false)
	private Req4002_Dao dao;
	
	@Value("${board.upload2}")
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
	public void communityInsert(Capplication ins) {
		if(ins.getHashtag()==null) ins.setHashtag("");
		dao.communityInsert(ins);
		String fname = ins.getReport().getOriginalFilename();
		if( !fname.equals("") ){
			uploadFile(ins.getReport());
			BoardImg f = new BoardImg();
			f.setImgname(fname);
			f.setImgpath(upload);
			dao.communityFileInsert(f);
		}
	}
	
	public void communityUpdate(Capplication upt) {
		if(upt.getHashtag()==null) upt.setHashtag("");
		dao.communityUpdate(upt);
	}
	
	public List<FollowMemberInfo> followerSelect(FollowMemberInfo index) {
		if(index.getKeyword()==null) index.setKeyword("");
		if(index.getMyemail()==null) index.setMyemail("");
		return dao.followerSelect(index);
	}
	
	public void followmemberdelete(FollowMemberInfo del) {
		dao.followmemberdelete(del);
	}
}
