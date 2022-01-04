package subak.songpurchase.controller;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import subak.songpurchase.model.SongPurchaseVO;
import subak.songpurchase.service.SongPurchaseService;

@Controller
public class SongPurchaseController {
	/**
	 * @uml.property  name="songpurchaseservice"
	 * @uml.associationEnd  
	 */
	private SongPurchaseService songpurchaseservice;
	/**
	 * @uml.property  name="point"
	 */
	private int point;
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView purchaseSong(SongPurchaseVO songpurchasevo,HttpServletRequest request){
	
	String flag;
	
	HttpSession session=request.getSession(false);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@SuppressWarnings("unused")
	String date = sdf.format(new Date());
	songpurchasevo.setRegdate(new Date());
	
	if(songpurchasevo.getPurchasetype().equals("download")){
	point=songpurchaseservice.SongPurchase(songpurchasevo);	
	flag="1";
	session.setAttribute("point", point);
	ModelAndView mav=new ModelAndView();
	mav.addObject("flag",flag);
	mav.setViewName("/songpurchase/downloadcheck.jsp");
	
	return mav;
	}
	
	else{
	
	point=songpurchaseservice.SongPurchase2(songpurchasevo);
	flag="1";
	session.setAttribute("point", point);
	ModelAndView mav=new ModelAndView();
	mav.addObject("flag",flag);
	mav.setViewName("/songpurchase/downloadcheck.jsp");
	return mav;
		
	}
		
	
	}
	
	

	
	/**
	 * @return
	 * @uml.property  name="songpurchaseservice"
	 */
	public SongPurchaseService getSongpurchaseservice() {
		return songpurchaseservice;
	}

	/**
	 * @param songpurchaseservice
	 * @uml.property  name="songpurchaseservice"
	 */
	public void setSongpurchaseservice(SongPurchaseService songpurchaseservice) {
		this.songpurchaseservice = songpurchaseservice;
	}
	

}