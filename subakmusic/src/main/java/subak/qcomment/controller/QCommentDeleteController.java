package subak.qcomment.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import subak.qcomment.service.QCommentDeleteImpl;


public class QCommentDeleteController implements Controller {
	
	/**
	 * @uml.property  name="commentDeleteImpl"
	 * @uml.associationEnd  
	 */
	@SuppressWarnings("unused")
	private QCommentDeleteImpl commentDeleteImpl;
	
	/**
	 * @param commentDeleteImpl
	 * @uml.property  name="commentDeleteImpl"
	 */
	public void setCommentDeleteImpl(QCommentDeleteImpl commentDeleteImpl) {
		this.commentDeleteImpl = commentDeleteImpl;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		//�� ���� ----------------------------
		Map<String, Object> model = new HashMap<String,Object>();
		model.put("id", id);
		
		//��ȭ���� modelandview �ν��Ͻ� ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/qcomment/delete.jsp");
		modelAndView.addAllObjects(model);
		
		return modelAndView;
	
	}

}
