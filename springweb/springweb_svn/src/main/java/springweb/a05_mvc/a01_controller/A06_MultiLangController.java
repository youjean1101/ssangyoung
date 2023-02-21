package springweb.a05_mvc.a01_controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class A06_MultiLangController {
	// 컨테이너에 선언한 다국어 처리 객체.
	@Autowired(required=false)
	private LocaleResolver localeResolver;
	
	// get방식 post방식으로 언어선택에 따라 호출되게 처리
	@RequestMapping("multi.do")
	public String multi(@RequestParam(value="lang", defaultValue="ko")String lang,
								HttpServletRequest request, HttpServletResponse rsponse) {
		System.out.println("선택한 언어:"+lang);
		localeResolver.setLocale(request, rsponse, new Locale(lang));
		return "WEB-INF\\views\\a05_mvc\\a06_multilangShow.jsp";
	}
}
