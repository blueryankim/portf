package subak.albuminforcomment.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import subak.albuminforcomment.model.AlbumInforCommentVO;
import subak.albuminforcomment.model.Paging;
import subak.albuminforcomment.service.AlbumInforCommentService;

@Controller
public class AlbumInforCommentController {

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
	@RequestMapping(method=RequestMethod.GET)//GET방식일 경우 - 앨범에 대한 코멘트 리스트를 불러올때
	public ModelAndView getComment(@RequestParam(value="albumnum")String albumnum1,@RequestParam(value="pageNum")String pagenum1){
		int albumnum=Integer.parseInt(albumnum1);//albumnum추출하여 사용
		//System.out.println(albumnum);
		String pageNum=pagenum1;
		//paging 
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
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
		mav.addObject("pageNum", pageNum);
		mav.addObject("cp", commentpaging);
		mav.setViewName("/albuminformationcomment/commentlist.jsp");
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)//POST방식일 경우 - 코멘트 등록할때.
	public ModelAndView insertComment(HttpServletRequest request,HttpServletResponse response){
		
		
		AlbumInforCommentVO commentVO=new AlbumInforCommentVO();
		int albumnum=Integer.parseInt(request.getParameter("albumnum"));
		commentVO.setAlbumnum(albumnum);
		commentVO.setComment(request.getParameter("content"));
		commentVO.setId(request.getParameter("id"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		@SuppressWarnings("unused")
		String date = sdf.format(new Date());
		commentVO.setRegdate(new Date());
		
		albuminforcommentservice.insertAlbumInforComment(commentVO);
		
		/*var params = "albumnum=" + encodeURIComponent(albumnum) + "&id="
				+ encodeURIComponent(id) + "&content="+encodeURIComponent(content); 
				new ajax.xhr.request("", params , writeCommentResult, 'POST');
		*/
		/*
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("album_num",commentVO.getAlbumnum());
		List<AlbumInforCommentVO> aiclist=albuminforcommentservice.getAlbumInforComment(map);
		//가장 최근에 등록된 정보를 가져온다. 
		ModelAndView mav=new ModelAndView();
		mav.addObject("albuminforcomment",aiclist);
		System.out.println(aiclist.get(0).getComment());
		System.out.println(aiclist.get(0).getId());
	
		mav.setViewName("/albuminformationcomment/writtencomment.jsp");
		*/
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

	/**
	 * @return
	 * @uml.property  name="commentpaging"
	 */
	public Paging getCommentpaging() {
		return commentpaging;
	}

	/**
	 * @param commentpaging
	 * @uml.property  name="commentpaging"
	 */
	public void setCommentpaging(Paging commentpaging) {
		this.commentpaging = commentpaging;
	}
	
	
	
}
