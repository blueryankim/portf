package subak.myPage.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import subak.myPage.model.Paging;
import subak.myPage.model.PointVO;
import subak.myPage.service.MPPointListService;

@Controller
public class MPPointListController {
	/**
	 * @uml.property  name="mpPointListService"
	 * @uml.associationEnd  
	 */
	private MPPointListService mpPointListService;
	/**
	 * @uml.property  name="myPagePaging"
	 * @uml.associationEnd  
	 */
	private Paging myPagePaging;
	
	/**
	 * @param mpPointListService
	 * @uml.property  name="mpPointListService"
	 */
	public void setMpPointListService(MPPointListService mpPointListService) {
		this.mpPointListService = mpPointListService;
	}

	/**
	 * @param myPagePaging
	 * @uml.property  name="myPagePaging"
	 */
	public void setMyPagePaging(Paging myPagePaging) {
		this.myPagePaging = myPagePaging;
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
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum == "") {
				pageNum = "1";
			}
			
			// 현재 페이지
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 5;   // 페이지당 보여줄 데이터 수
			int pagenavi = 5;   // 페이지번호 보여줄 수
			
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("userID", userID);
			
			int havingPoint = this.mpPointListService.getHavingPoint(map);
			int count = this.mpPointListService.getPointListCount(map);
			int number = count - (currentPage - 1) * pageSize;
			
			myPagePaging.setPaging(pageSize, pagenavi, count, currentPage);
				map.put("starRow", myPagePaging.getWriting_Start());
				map.put("endRow", myPagePaging.getWriting_End());
			
			List<PointVO> pointList = this.mpPointListService.getPointList(map);
			Map<String, Object> model = new HashMap<String, Object>();
				model.put("havingPoint", havingPoint);
				model.put("pointList", pointList);
				model.put("count", count);
				model.put("number", number);
				model.put("pageNum", pageNum);
				model.put("mpp", myPagePaging);
				
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/myPage/mpPointList.jsp");
				mav.addAllObjects(model);
			
			return mav;
		}
		
	}
	
}