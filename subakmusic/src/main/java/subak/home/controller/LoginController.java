package subak.home.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import subak.home.model.MemberVO;
import subak.home.service.LoginService;

@Controller
public class LoginController {
	/**
	 * @uml.property  name="loginService"
	 * @uml.associationEnd  
	 */
	private LoginService loginService;

	/**
	 * @param loginService
	 * @uml.property  name="loginService"
	 */
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	ModelAndView modelView(HttpServletRequest request,HttpSession session){
		System.out.println("로그인 컨트롤러");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		String checkPass = loginService.getPass(id);
		System.out.println("비밀번호 확인 : "+checkPass);
		
		if(id.equals("admin") && pass.equals("admin")){
			model.put("pass", pass);
			mav.setViewName("/admin/adminView.do");
			session.setAttribute("id", "admin");
			mav.addAllObjects(model);
			return mav;
		}
		
		if(checkPass == null){
			model.put("error", "아이디가 존재하지 않습니다.");
			mav.setViewName("/home/home_loginForm.jsp");
			
		}else if(checkPass!= null){
			if(checkPass.equals(pass)){
				MemberVO vo = loginService.getMemberInfo(id);
				session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pass", pass);
				session.setAttribute("point", vo.getPoint());
				System.out.println("Success!!");
				mav.setViewName("redirect:"+request.getHeader("referer"));
				
			}else{
				model.put("error", "비밀번호가 잘못되었습니다.");
				mav.setViewName("/home/home_loginForm.jsp");
			}
		}
		mav.addAllObjects(model);
		return mav;
	}
	
}