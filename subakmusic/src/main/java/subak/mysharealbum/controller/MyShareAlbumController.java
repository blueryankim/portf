package subak.mysharealbum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.mysharealbum.model.GetAlbumInforVO;
import subak.mysharealbum.model.MyShareAlbumVO;
import subak.mysharealbum.service.MyShareAlbumService;

@Controller
public class MyShareAlbumController {

	/**
	 * @uml.property  name="mysharealbumservice"
	 * @uml.associationEnd  
	 */
	private MyShareAlbumService mysharealbumservice;
	
	@RequestMapping
	public ModelAndView myShareAlbum(HttpServletRequest request){
		
		String pagenum=request.getParameter("pagenum");
		
		String templistnum=request.getParameter("listnum");
		int listnum=Integer.parseInt(templistnum);
		
		MyShareAlbumVO mysharealbumvo=mysharealbumservice.myShareAlbum(listnum);
		String tempalbumnums=mysharealbumvo.getList();
		String albumnums[]=tempalbumnums.split(",");
		mysharealbumvo.setSongcount(albumnums.length);
		List<GetAlbumInforVO> albumlist=new ArrayList<GetAlbumInforVO>();
		
		for(int i=0;i<albumnums.length;i++){
		int albumnum=Integer.parseInt(albumnums[i]);	
		albumlist.add(mysharealbumservice.getAlbumInfor(albumnum));
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("albumlist",albumlist);
		mav.addObject("mysharealbum",mysharealbumvo);
		mav.addObject("pagenum",pagenum);
		mav.setViewName("/sharealbum/mysharealbum.jsp");
		return mav;
	}
	/**
	 * @return
	 * @uml.property  name="mysharealbumservice"
	 */
	public MyShareAlbumService getMysharealbumservice() {
		return mysharealbumservice;
	}
	/**
	 * @param mysharealbumservice
	 * @uml.property  name="mysharealbumservice"
	 */
	public void setMysharealbumservice(MyShareAlbumService mysharealbumservice) {
		this.mysharealbumservice = mysharealbumservice;
	}
	
	
	
}
