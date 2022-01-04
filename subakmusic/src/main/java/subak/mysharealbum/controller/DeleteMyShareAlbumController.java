package subak.mysharealbum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.mysharealbum.service.DeleteMyShareAlbumService;

@Controller
public class DeleteMyShareAlbumController {

	/**
	 * @uml.property  name="deletemysharealbumservice"
	 * @uml.associationEnd  
	 */
	private DeleteMyShareAlbumService deletemysharealbumservice;
	@RequestMapping
	public ModelAndView deleteMyShareAlbum(String listnum){
		
		int reallistnum=Integer.parseInt(listnum);
		deletemysharealbumservice.deleteMyShareAlbum(reallistnum);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/main/deletemysharealbum.jsp");
		return mav;
	}
	/**
	 * @return
	 * @uml.property  name="deletemysharealbumservice"
	 */
	public DeleteMyShareAlbumService getDeletemysharealbumservice() {
		return deletemysharealbumservice;
	}
	/**
	 * @param deletemysharealbumservice
	 * @uml.property  name="deletemysharealbumservice"
	 */
	public void setDeletemysharealbumservice(
			DeleteMyShareAlbumService deletemysharealbumservice) {
		this.deletemysharealbumservice = deletemysharealbumservice;
	}

	

	
}
