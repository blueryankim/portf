package subak.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardListController {
	@RequestMapping
	public String setView() {
		return "/board/boardList.jsp";
	}

}