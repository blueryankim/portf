package subak.fboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import subak.fboard.model.FBoardVO;
import subak.fboard.model.FPaging;
import subak.fboard.service.FBoardListService;



public class FListController implements Controller {
	/**
	 * @uml.property  name="boardListService"
	 * @uml.associationEnd  
	 */
	private FBoardListService boardListService;
	/**
	 * @uml.property  name="boardPaging"
	 * @uml.associationEnd  
	 */
	private FPaging boardPaging;

	

	/**
	 * @param boardListService
	 * @uml.property  name="boardListService"
	 */
	public void setBoardListService(FBoardListService boardListService) {
		this.boardListService = boardListService;
	}



	/**
	 * @param boardPaging
	 * @uml.property  name="boardPaging"
	 */
	public void setBoardPaging(FPaging boardPaging) {
		this.boardPaging = boardPaging;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// ������ ��ȣ
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// ���� ������
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10; // �������� ������ �����ͼ�
		int pagenavi = 5; // ��������ȣ �����ټ�
		// �˻����
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
		// List ó��
		// ��ü �� �� or �˻��ϰ��� �ϴ� �� ��
		int count = this.boardListService.getListCount(map);
		// List�� �������� �۹�ȣ
		int number = count - (currentPage - 1) * pageSize;
		boardPaging.setPaging(// ����¡ Ŭ����
				pageSize, pagenavi, count, currentPage);
		map.put("starRow", boardPaging.getWriting_Start());
		map.put("endRow", boardPaging.getWriting_End());
		List<FBoardVO> boardList = // ��ü�� or �˻��ϰ��� �ϴ� ��
		this.boardListService.getBoardList(map);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("boardList", boardList);
		model.put("count", count);
		model.put("number", number);
		model.put("search_text", search_text);
		model.put("search_type", search_type);
		model.put("pageNum", pageNum);
		model.put("bp", boardPaging);
		// �ش� �信�� ����� �Ӽ�
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fboard/flist.jsp");
		//modelAndView.setViewName("/fboard/boardList.jsp");
		modelAndView.addAllObjects(model);
		return modelAndView;
	}
}