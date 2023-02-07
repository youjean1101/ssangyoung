package springweb.a05_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.FileExpVo;
import springweb.z01_vo.FileRep;
//springweb.a05_mvc.a03_dao.A05_FileDao
public interface A05_FileDao {
	public void insertFile(FileRep f);
	public List<FileRep> getFileList(String fname);
	
	public void insertExFile(FileExpVo f);
	public List<FileRep> getFileExList();
	
}
