package subak.fcomment.controller;

import java.text.DateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import subak.fcomment.model.FCommentVO;
import subak.fcomment.service.FCommentUpdateImpl;


public class FCommentUpdateController implements Controller {

	/**
	 * @uml.property  name="commentUpdateImpl"
	 * @uml.associationEnd  
	 */
	private FCommentUpdateImpl commentUpdateImpl;
	/**
	 * @uml.property  name="comment"
	 * @uml.associationEnd  
	 */
	private FCommentVO comment;
	/**
	 * @param commentUpdateImpl
	 * @uml.property  name="commentUpdateImpl"
	 */
	public void setCommentUpdateImpl(FCommentUpdateImpl commentUpdateImpl) {
		this.commentUpdateImpl = commentUpdateImpl;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DateFormat df = DateFormat.getDateInstance();
		// 시간 설정 문제
		String date = request.getParameter("regdate").replaceAll("UTC+0900", "KST");
		comment = new FCommentVO();
		comment.setComment_id(Integer.parseInt(request.getParameter("id")));
		comment.setNum(Integer.parseInt(request.getParameter("num")));
		comment.setComment_name(request.getParameter("name"));
		comment.setComment(request.getParameter("content"));
		comment.setRegdate(df.parse(date));
		commentUpdateImpl.update(comment);
		
		//모델 생성 ----------------------------
		Map<String, Object> model = new HashMap<String,Object>();
		model.put("comment", comment);
		
		//반화값인 modelandview 인스턴스 생성
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fcomment/update.jsp");
		modelAndView.addAllObjects(model);
		
		return modelAndView;
	
	}

}
