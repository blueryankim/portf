package subak.myPage.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import subak.myPage.service.MyPageHomeService;

@Controller
public class MyPageHomeController {
	/**
	 * @uml.property  name="myPageHomeService"
	 * @uml.associationEnd  
	 */
	private MyPageHomeService myPageHomeService;
	
	/**
	 * @param myPageHomeService
	 * @uml.property  name="myPageHomeService"
	 */
	public void setMyPageHomeService(MyPageHomeService myPageHomeService) {
		this.myPageHomeService = myPageHomeService;
	}
	
	@RequestMapping
	public ModelAndView modelView(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String userID = (String) session.getAttribute("id");
		
		// 로그인 전
		if(userID == null || userID.equals(null) || userID == "" || userID.equals("")) {
			return new ModelAndView("redirect:/error/loginRequest.do");
		}
		// 로그인 후
		else {
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("userID", userID);
				
			int dmcCount = this.myPageHomeService.getDownloadCount(map);
			int macCount = this.myPageHomeService.getMyAlbumCount(map);
			int havingPoint = this.myPageHomeService.getHavingPoint(map);
			
			Map<String, Object> model = new HashMap<String, Object>();
				model.put("dmcCount", dmcCount);
				model.put("macCount", macCount);
				model.put("havingPoint", havingPoint);
					
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/myPage/myPageHome.jsp");
				mav.addAllObjects(model);
			
			return mav;
		}
	}
	
}