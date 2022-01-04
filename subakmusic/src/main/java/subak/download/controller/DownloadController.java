package subak.download.controller;

import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import subak.download.model.DownloadVO;
import subak.download.service.DownloadService;

@Controller
public class DownloadController implements ApplicationContextAware {

	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	private WebApplicationContext context=null;
	/**
	 * @uml.property  name="downloadservice"
	 * @uml.associationEnd  
	 */
	private DownloadService downloadservice;
	@RequestMapping("/file")
	public ModelAndView download(String songnum) throws Exception{
		
		int songnum1=Integer.parseInt(songnum);
		DownloadVO downloadvo=downloadservice.getSongInfor(songnum1);
		
		File downloadFile=getFile(songnum,downloadvo.getPath());
		
		ModelAndView mav=new ModelAndView("download","downloadFile",downloadFile);
		mav.addObject("songname",downloadvo.getSongname());
		mav.addObject("singer",downloadvo.getSinger());
		return mav;
		
		//realpath를 통해서 얻은 값을 ModelAndView에 넣는다.
		}
	
	private File getFile(String songnum,String path){
		
		String filepath=context.getServletContext().getRealPath("/mp3files/"+path+"/"+songnum+".mp3");
		
		//여기에서 설명 txt가 있는 getrealpath를 얻어온다.
		
		return new File(filepath);
	}
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.context=(WebApplicationContext)applicationContext;
		
	}

	/**
	 * @return
	 * @uml.property  name="context"
	 */
	public WebApplicationContext getContext() {
		return context;
	}

	/**
	 * @param context
	 * @uml.property  name="context"
	 */
	public void setContext(WebApplicationContext context) {
		this.context = context;
	}

	/**
	 * @return
	 * @uml.property  name="downloadservice"
	 */
	public DownloadService getDownloadservice() {
		return downloadservice;
	}

	/**
	 * @param downloadservice
	 * @uml.property  name="downloadservice"
	 */
	public void setDownloadservice(DownloadService downloadservice) {
		this.downloadservice = downloadservice;
	}

	
	
}
