package subak.admin.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.nboard.model.BoardVO;
import subak.nboard.model.Paging;
import subak.nboard.service.BoardListService;

@Controller
public class NoticePageViewController {
	/**
	 * @uml.property  name="boardListService"
	 * @uml.associationEnd  
	 */
	private BoardListService boardListService;
	/**
	 * @uml.property  name="boardPaging"
	 * @uml.associationEnd  
	 */
	private Paging boardPaging;

	/**
	 * @param boardListService
	 * @uml.property  name="boardListService"
	 */
	public void setBoardListService(BoardListService boardListService) {
		this.boardListService = boardListService;
	}

	/**
	 * @param boardPaging
	 * @uml.property  name="boardPaging"
	 */
	public void setBoardPaging(Paging boardPaging) {
		this.boardPaging = boardPaging;
	}

	@RequestMapping
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		} else if (!session.getAttribute("id").equals("admin")) {
			mav.setViewName("redirect:/home/home.do");
			return mav;
		}
		
		
		// 페이지 번호
		
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;   // 페이지당 보여줄 데이터수
		int pagenavi = 5;   // 페이지번호 보여줄수
		// 검색기능
		String search_type = request.getParameter("search_type");
		String search_text = request.getParameter("search_text");
		if (search_text != null)
			search_text = new String(search_text.getBytes("8859_1"), "utf-8");
		System.out.println(search_text);
		if (search_type == null) {
			search_type = "";
		}
		if (search_text == null) {
			search_text = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_type", search_type);
		map.put("search_text", search_text);
		// List 처리
		// 전체 글 수 or 검색하고자 하는 글 수
		int count = this.boardListService.getListCount(map);
		// List에 보여지는 글번호
		int number = count - (currentPage - 1) * pageSize;
		boardPaging.setPaging(pageSize, pagenavi, count, currentPage);   // 페이징 클래스
			map.put("starRow", boardPaging.getWriting_Start());
			map.put("endRow", boardPaging.getWriting_End());
		List<BoardVO> boardList = this.boardListService.getBoardList(map);   // 전체글 or 검색하고자 하는 글
		Map<String, Object> model = new HashMap<String, Object>();
			model.put("boardList", boardList);
			model.put("count", count);
			model.put("number", number);
			model.put("search_text", search_text);
			model.put("search_type", search_type);
			model.put("pageNum", pageNum);
			model.put("bp", boardPaging);
		// 해당 뷰에서 사용할 속성
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("/admin/admin_notice.jsp");
			modelAndView.addAllObjects(model);
		return modelAndView;
	}
}
