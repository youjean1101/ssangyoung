package fleaMarket.a02_service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vo.Calendar;
import vo.FFile;
import vo.FleaMarket;

@Service
public interface Req3000_Service {
	public void insertFleaMarket(FleaMarket ins);
	public int insprofile(FFile fins);
	public FleaMarket fleaDetail(String postingNumber);	  
	public void UptFleaMarket(FleaMarket upt);
	public void delFleaMarket(String postingNumber);
	public List<FleaMarket> getFleaMarketList(FleaMarket sch);	
	public String FileNum(String postingNumber);
	public List<Calendar> calList();
	public List<FFile> DelFail(String postingNumber);	
	public void UptFFile(FFile fupt);
	//업로드 
	public String insertFleaFileModule(List<MultipartFile> pro);
	public void delFfile(String postingNumber);
	public String uptFleaFileModule(List<MultipartFile> pro, String postingNumber); 
}
