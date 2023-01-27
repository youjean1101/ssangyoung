package springweb.z01_vo;
// springweb.z01_vo.EmpDeptCom
public class EmpDeptCom {
	private Emp emp;
	private Dept dept;
	
	
	public EmpDeptCom() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EmpDeptCom(Emp emp, Dept dept) {
		super();
		this.emp = emp;
		this.dept = dept;
	}

	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
}
