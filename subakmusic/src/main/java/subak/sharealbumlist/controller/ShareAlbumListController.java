package subak.sharealbumlist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.sharealbumlist.model.Paging;
import subak.sharealbumlist.model.ShareAlbumListVO;
import subak.sharealbumlist.service.ShareAlbumListService;

@Controller
public class ShareAlbumListController {

	/**
	 * @uml.property  name="sharealbumpaging"
	 * @uml.associationEnd  
	 */
	private Paging sharealbumpaging;
	/**
	 * @uml.property  name="sharealbumlistservice"
	 * @uml.associationEnd  
	 */
	private ShareAlbumListService sharealbumlistservice;
	@RequestMapping
	public ModelAndView shareAlbumList(HttpServletRequest request){
		
		String pagenum=request.getParameter("pagenum");
		//paging 
		if (pagenum == null || pagenum == "") {
			pagenum = "1";
		}
		
		int currentPage = Integer.parseInt(pagenum);
		int pageSize = 10; 
		int pagenavi = 10; 
		
		int count=sharealbumlistservice.getShareAlbumCount();
		
		Map<String,Object> map=new HashMap<String,Object>();
		sharealbumpaging.setPaging(
				pageSize, pagenavi,count,currentPage);
		map.put("startRow", sharealbumpaging.getWriting_Start());
		map.put("endRow", sharealbumpaging.getWriting_End());
		List<ShareAlbumListVO> poplist=sharealbumlistservice.getPopAlbumList();
		List<ShareAlbumListVO> sharelist=sharealbumlistservice.getShareAlbumList(map);
		
		
		
		int number=count-(currentPage-1)*pageSize;
		
		for(int i=0;i<poplist.size();i++){
			
			String list=poplist.get(i).getList();
			String listarray[]=list.split(",");
			poplist.get(i).setSongcount(listarray.length);
		}
		
		for(int i=0;i<sharelist.size();i++){
			
			String list=sharelist.get(i).getList();
			String listarray[]=list.split(",");
			sharelist.get(i).setSongcount(listarray.length);
		}
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pagenum",currentPage);
		mav.addObject("sp",sharealbumpaging);
		mav.addObject("poplist",poplist);
		mav.addObject("sharelist",sharelist);
		mav.addObject("number",number);
		mav.setViewName("/sharealbum/sharealbummain.jsp");
		
		return mav;
	
	}
		/**
		 * @return
		 * @uml.property  name="sharealbumpaging"
		 */
		public Paging getSharealbumpaging() {
		return sharealbumpaging;
	}
		/**
		 * @param sharealbumpaging
		 * @uml.property  name="sharealbumpaging"
		 */
		public void setSharealbumpaging(Paging sharealbumpaging) {
		this.sharealbumpaging = sharealbumpaging;
	}
		/**
		 * @return
		 * @uml.property  name="sharealbumlistservice"
		 */
		public ShareAlbumListService getSharealbumlistservice() {
		return sharealbumlistservice;
	}
		/**
		 * @param sharealbumlistservice
		 * @uml.property  name="sharealbumlistservice"
		 */
		public void setSharealbumlistservice(ShareAlbumListService sharealbumlistservice) {
		this.sharealbumlistservice = sharealbumlistservice;
	}
	
	
}
