package a01_diexp.z9_homework.vo;
//a01_diexp.z9_homework.vo.Pencil
//a01_diexp.z9_homework.vo.Eraser

public class Pencil {
	private String vendor;
	private Eraser eraserName;
	public Pencil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pencil(String vendor) {
		super();
		this.vendor = vendor;
	}
	public void eraserInfo() {
		System.out.println(vendor+"펜의 세트 지우개정보");
		if(eraserName!=null) {
			System.out.println("지우개이름:"+eraserName.getName());
			System.out.println("지우개제조사:"+eraserName.getVendor());
		}
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public Eraser getEraserName() {
		return eraserName;
	}
	public void setEraserName(Eraser eraserName) {
		this.eraserName = eraserName;
	}
}
