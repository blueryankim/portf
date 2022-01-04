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
import subak.nboard.model.BoardVO;
import subak.nboard.model.Paging;
import subak.nboard.service.BoardListService;
import subak.qboard.model.QBoardVO;
import subak.qboard.service.QBoardListService;

public class MBoardListController implements Controller{
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
	 * @uml.property  name="fboardListService"
	 * @uml.associationEnd  
	 */
	private FBoardListService fboardListService;
	/**
	 * @uml.property  name="fboardPaging"
	 * @uml.associationEnd  
	 */
	private FPaging fboardPaging;
	/**
	 * @uml.property  name="qboardListService"
	 * @uml.associationEnd  
	 */
	private QBoardListService qboardListService;
	/**
	 * @param fboardListService
	 * @uml.property  name="fboardListService"
	 */
	public void setFboardListService(FBoardListService fboardListService) {
		this.fboardListService = fboardListService;
	}

	/**
	 * @param fboardPaging
	 * @uml.property  name="fboardPaging"
	 */
	public void setFboardPaging(FPaging fboardPaging) {
		this.fboardPaging = fboardPaging;
	}

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
	/**
	 * @param qboardListService
	 * @uml.property  name="qboardListService"
	 */
	public void setQboardListService(QBoardListService qboardListService) {
		this.qboardListService = qboardListService;
	}
	
   
	public ModelAndView getList(Object obj){
		Map<String, Object> map = new HashMap<String, Object>();
		List<FBoardVO> fboardList = // ��ü�� or �˻��ϰ��� �ϴ� ��
				this.fboardListService.getBoardList(map);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fboardList", fboardList);
		model.put("bp", fboardPaging);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fboard/boardList.jsp");
		modelAndView.addAllObjects(model);
		return modelAndView;
		
	}

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
		List<BoardVO> boardList = // ��ü�� or �˻��ϰ��� �ϴ� ��
		this.boardListService.getBoardList(map);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("boardList", boardList);
		model.put("bp", boardPaging);
		
		// ���� �Խ���
				map.put("starRow", 1);
				map.put("endRow", 5);
				List<FBoardVO> fblist = fboardListService.getBoardList(map);
				model.put("ff", fblist);
				
				//Q&A�Խ���
				map.put("starRow", 1);
				map.put("endRow", 5);
				List<QBoardVO> qblist = qboardListService.getBoardList(map);
				model.put("qq", qblist);
				
		// �ش� �信�� ����� �Ӽ�
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fboard/boardList.jsp");
		modelAndView.addAllObjects(model);
		return modelAndView;
	}

	
}
