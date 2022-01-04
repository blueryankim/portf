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
import subak.myPage.model.DownloadListVO;
import subak.myPage.model.Paging;
import subak.myPage.service.MPDownloadListService;

@Controller
public class MPDownloadListController {
	/**
	 * @uml.property  name="mpDownloadListService"
	 * @uml.associationEnd  
	 */
	private MPDownloadListService mpDownloadListService;
	/**
	 * @uml.property  name="myPagePaging"
	 * @uml.associationEnd  
	 */
	private Paging myPagePaging;
	
	/**
	 * @param mpDownloadListService
	 * @uml.property  name="mpDownloadListService"
	 */
	public void setMpDownloadListService(MPDownloadListService mpDownloadListService) {
		this.mpDownloadListService = mpDownloadListService;
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
		
		// �α��� ��
		if(userID == null || userID.equals(null) || userID == "" || userID.equals("")) {
			return new ModelAndView("redirect:/error/loginRequest.do");
		}
		// �α��� ��
		else {
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum == "") {
				pageNum = "1";
			}
			
			// ���� ������
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 5;   // �������� ������ ������ ��
			int pagenavi = 5;   // ��������ȣ ������ ��
			
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("userID", userID);
				
			int count = this.mpDownloadListService.getDownloadCount(map);
			int number = count - (currentPage - 1) * pageSize;
			
			myPagePaging.setPaging(pageSize, pagenavi, count, currentPage);
				map.put("starRow", myPagePaging.getWriting_Start());
				map.put("endRow", myPagePaging.getWriting_End());
				
			List<DownloadListVO> downloadList = this.mpDownloadListService.getDownloadList(map);
			Map<String, Object> model = new HashMap<String, Object>();
				model.put("downloadList", downloadList);
				model.put("count", count);
				model.put("number", number);
				model.put("pageNum", pageNum);
				model.put("mpp", myPagePaging);
				
			ModelAndView mav = new ModelAndView();
				mav.setViewName("/myPage/mpDownloadList.jsp");
				mav.addAllObjects(model);
			
			return mav;
		}
	}
	
}