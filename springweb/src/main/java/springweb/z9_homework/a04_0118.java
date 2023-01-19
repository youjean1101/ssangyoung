package springweb.z9_homework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class a04_0118 {
	//http://localhost:7080/springweb/memberForAjax.do
		@GetMapping("/memberForAjax.do")
		public String memberForAjax() {
			return "a01_jquery\\homework\\0118\\_ex2.html";
		}
		//http://localhost:7080/springweb/memberForAjax2.do
		@GetMapping("/memberForAjax2.do")
		public String memberForAjax2() {
			return "a01_jquery\\homework\\0118\\ex4.html";
		}
		//http://localhost:7080/springweb/deptView.do
		@Autowired
		private a04_0118_service service;
		
		@GetMapping("/deptView.do")
		public String deptView(Model d) {
			d.addAttribute("deptno", service.getDeptNo());
			d.addAttribute("dname", service.getDeptDname());
			d.addAttribute("loc", service.getDeptLoc());
			return "WEB-INF\\z9_homework\\0118.jsp";
			// <h2>${show}</h2>
		}
		/*
		 [1단계:확인] 3. jquery ajax를 이용해서 물건가격과 갯수를 입력시, 결과로 컨트롤에서 총계를 받아서 alert으로 처리하게 하세요.
		 1) 초기화면 호출 Controller 작성
            H08_Controller.java
            @GetMapping("buyProd99.do")
            public String buyProd99(){
               return "z08-3.jsp
            }
         2) RestController에 요청값에 의해 결과 데이터 리턴하는 처리
            // Get/Post방식이 따로 선언할 떄는 동일한 url 선언 가능
            @PostMapping("buyProd99.do")
            public String buyProd99(Product p){
               // 총계값 전달
               return ""+p.getPrice()*p.getCnt();
            }
         3) 화면단 jquery ajax 처리
            <form>
               물건가격:<input class="sch" type="number" name="price" value="0"/>
               물건갯수:<input class="sch" type="number" name="cnt" value="0"/>
            이벤트 핸들러 선언
               $(".sch").on("keyup",function(){
                  if(event.keyCode==13){
                     $.ajax({
                        url:"${path}/buyProd99.do",
                        type:"post",
                        data:$("form").serialize(),
                        success:function(tot){
                           alert("총계:"+tot)
                        }
                        error:function(xhr,status,err){
                           console.log(err)
                        }
                     })
                  }
               })
            ajax 처리
		 [1단계:확인] 4. 초기화면을 로딩해서 회원명과 권한으로 조회해서 회원 정보를 ajax로 출력하여 처리를 하세요.
		 	1) 초기화면 호출 및 구현
		 		A02_Controller.java
		 		@GetMapping("memListAjax.do")
		 		public String memListAjax(){
		 			return "z10_homework\0118.jsp";
		 		}
		 		view:z10_homework\0118.jsp
		 		회원명:<input type="text"  class="sch" name="name"
		 		권한 : <input type="text" class="sch" name="auth"
		 		
		 	2) Rest컨트롤러 선언
		 		@PostMapping("/memListAjax.do")
		 		public String memeListAjax(Member sch){
		 			Gson g = new Gson()
		 			A06_PareparedDao dao = new A06_PareparedDao();
		 			return g.toJson(dao.getMemberList(sch));
		 		}
		 	3) 화면단 이벤트 핸들러 및 ajax 처리
		 		$(".sch").keyup(function(){
		 			if(event.keyCode==13){
		 				$.ajax({
		 					url:"${path}/memListAjax.do
		 					type:"post",
		 					data:$("#frm02").serialize(),
		 					dataType:"json",
		 					success:function(mlist){
		 						var addHTML=""
		 						$(mlist).each(function(idx,mem){
		 							addHTML += "<tr>"
		 							addHTML += "<td>"+mem.getId()+"</td>"
		 							addHTML += "<td>"+mem.getName()+"</td>"
		 							addHTML += "<td>"+mem.getPoint()+"</td>"
		 							addHTML += "<td>"+mem.getAuth()+"</td>"
		 							addHTML += "</tr>"
		 						})
		 						error
		 					},
		 					
		 				})
		 			}
		 		})
		 	
		 	
		 [1단계:확인] 6. Service단에 Dept객체를 리턴하고, 코드상 의존성 자동주입을 해서 화면단에 부서정보를 출력하게 처리하세요
		 
		 */
		// 0118 4번 정답
		//http://localhost:7080/springweb/deptDI01.do
		@Autowired
		private a04_0118_service service2;
		
		@GetMapping("/deptDI01.do")
		public String dept(Model d) {
			d.addAttribute("dept",service2.getDeptInfo());
			return "WEB-INF\\z9_homework\\0118_ans.jsp";
		}
		
}
