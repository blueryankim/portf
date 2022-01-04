package subak.qcomment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import subak.qcomment.model.QCommentVO;
import subak.qcomment.service.QCommentListImpl;


public class QCommentListController implements Controller {
	/**
	 * @uml.property  name="commentListImpl"
	 * @uml.associationEnd  
	 */
	private QCommentListImpl commentListImpl;
	/**
	 * @param commentListImpl
	 * @uml.property  name="commentListImpl"
	 */
	public void setCommentListImpl(QCommentListImpl commentListImpl) {
		this.commentListImpl = commentListImpl;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		List<QCommentVO>list = commentListImpl.getMessageList(1,Integer.parseInt(num));
		//모델 생성---------------------
		Map<String,Object>model = new HashMap<String,Object>();
		model.put("list", list);
		
		//반환값인 ModelAndView 인스턴스 생성
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.setViewName("/qcomment/list.jsp");
		modelAndView.addAllObjects(model);
		return modelAndView;
	}

}
