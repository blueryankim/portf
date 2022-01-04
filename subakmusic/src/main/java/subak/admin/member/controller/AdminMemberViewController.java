package subak.admin.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.admin.member.service.MemberListService;
import subak.member.model.MemberVO;
import subak.member.model.Paging;

@Controller
public class AdminMemberViewController {
	/**
	 * @uml.property  name="memberListService"
	 * @uml.associationEnd  
	 */
	private MemberListService memberListService;
	/**
	 * @uml.property  name="memberPaging"
	 * @uml.associationEnd  
	 */
	private Paging memberPaging;
	
	
	/**
	 * @param memberListService
	 * @uml.property  name="memberListService"
	 */
	public void setMemberListService(MemberListService memberListService) {
		this.memberListService = memberListService;
	}


	/**
	 * @param memberPaging
	 * @uml.property  name="memberPaging"
	 */
	public void setMemberPaging(Paging memberPaging) {
		this.memberPaging = memberPaging;
	}


	@RequestMapping
	public ModelAndView setView(HttpServletRequest request, HttpSession session){
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		} else if (!session.getAttribute("id").equals("admin")) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		}
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int pageNavi = 5;
		String search_type = request.getParameter("search_type");
		String search_text = request.getParameter("search_text");
		
		if(search_text != null){
			try {
				search_text = new String(search_text.getBytes("8859_1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(search_text == null){
			search_text = "";
		}
		if(search_type == null){
			search_type = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search_type", search_type);
		map.put("search_text", search_text);
		
		int count= memberListService.getListCount(map);

		int number = count - (currentPage - 1)*pageSize;
		memberPaging.setPaging(pageSize, pageNavi, count, currentPage);
		map.put("startRow", memberPaging.getWriting_Start());
		map.put("endRow", memberPaging.getWriting_End());
		List<MemberVO> memberList = memberListService.getMemberList(map);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("memberList", memberList);
		model.put("count", count);
		model.put("number", number);
		model.put("search_text", search_text);
		model.put("search_type", search_type);
		model.put("pageNum", pageNum);
		model.put("mp",memberPaging);
		mav.setViewName("/admin/admin_member.jsp");
		mav.addAllObjects(model);
		return mav;
	}
}