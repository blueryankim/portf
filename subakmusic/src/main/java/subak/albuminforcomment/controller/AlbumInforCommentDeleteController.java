package subak.albuminforcomment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.albuminforcomment.model.AlbumInforCommentVO;
import subak.albuminforcomment.model.Paging;
import subak.albuminforcomment.service.AlbumInforCommentService;

@Controller
public class AlbumInforCommentDeleteController {

	/**
	 * @uml.property  name="albuminforcommentservice"
	 * @uml.associationEnd  
	 */
	private AlbumInforCommentService albuminforcommentservice;
	/**
	 * @uml.property  name="commentpaging"
	 * @uml.associationEnd  
	 */
	private Paging commentpaging;
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView deleteAlbumInforComment(HttpServletRequest request,HttpServletResponse response){
		
		String tempalbumnum=request.getParameter("albumnum");
		String tempcommentid=request.getParameter("commentid");
		
		int albumnum=Integer.parseInt(tempalbumnum);
		int commentid=Integer.parseInt(tempcommentid);
		
		Map<String,Object> deletemap=new HashMap<String,Object>();
		deletemap.put("albumnum", albumnum);
		deletemap.put("commentid",commentid);
		albuminforcommentservice.deleteAlbumInforComment(deletemap);
		
		int currentPage = 1;
		int pageSize = 5; // 페이지당 보여줄 데이터수 5개
		int pagenavi = 5; 
		
		int count=albuminforcommentservice.getCommentCount(albumnum);
		//int number = 1 + (currentPage - 1) * pageSize;//페이지 시작번호
		
		Map<String,Object> map=new HashMap<String,Object>();
		commentpaging.setPaging(// 페이징 클래스 //currentpage에 따라서 글 시작 번호가 달라짐.
				pageSize, pagenavi,count,currentPage);
		map.put("startRow", commentpaging.getWriting_Start());
		map.put("endRow", commentpaging.getWriting_End());
		map.put("albumnum", albumnum);
	
		
		List<AlbumInforCommentVO> albuminforcommentlist=albuminforcommentservice.getAlbumInforComments(map);

		ModelAndView mav =new ModelAndView();
		mav.addObject("commentList", albuminforcommentlist);
		mav.addObject("pageNum", currentPage);
		mav.addObject("cp", commentpaging);
		mav.setViewName("/albuminformationcomment/commentlist.jsp");
		return mav;

		
		}

	/**
	 * @return
	 * @uml.property  name="albuminforcommentservice"
	 */
	public AlbumInforCommentService getAlbuminforcommentservice() {
		return albuminforcommentservice;
	}

	/**
	 * @param albuminforcommentservice
	 * @uml.property  name="albuminforcommentservice"
	 */
	public void setAlbuminforcommentservice(
			AlbumInforCommentService albuminforcommentservice) {
		this.albuminforcommentservice = albuminforcommentservice;
	}

	public Paging getCommentPaging() {
		return commentpaging;
	}

	public void setCommentPaging(Paging commentPaging) {
		this.commentpaging = commentPaging;
	}
	
	
}
