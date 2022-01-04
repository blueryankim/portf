package subak.fcomment.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import subak.fcomment.model.FCommentVO;
import subak.fcomment.service.FCommentWriteImpl;


public class FCommentWriteController implements Controller {

		/**
		 * @uml.property  name="commentWriteImpl"
		 * @uml.associationEnd  
		 */
		private FCommentWriteImpl commentWriteImpl;
		/**
		 * @uml.property  name="comment"
		 * @uml.associationEnd  
		 */
		private FCommentVO comment;
		
	/**
	 * @param commentWriteImpl
	 * @uml.property  name="commentWriteImpl"
	 */
	public void setCommentWriteImpl(FCommentWriteImpl commentWriteImpl) {
			this.commentWriteImpl = commentWriteImpl;
		}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		comment = new FCommentVO();
		comment.setComment_id(commentWriteImpl.nexVal());
		comment.setNum(Integer.parseInt(request.getParameter("num")));
		comment.setComment_name(request.getParameter("name"));
		comment.setComment(request.getParameter("content"));
		comment.setRegdate(new Date());
		commentWriteImpl.write(comment);
		
		//모델 생성 ----------------------------
		Map<String, Object> model = new HashMap<String,Object>();
		model.put("comment", comment);
		
		//반화값인 modelandview 인스턴스 생성
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fcomment/write.jsp");
		modelAndView.addAllObjects(model);
		
		return modelAndView;
	
	}

}
