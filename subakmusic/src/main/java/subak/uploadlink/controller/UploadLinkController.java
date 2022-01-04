package subak.uploadlink.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import subak.uploadlink.model.UploadLinkVO;
import subak.uploadlink.service.UploadLinkService;

@Controller
public class UploadLinkController {
	
	/**
	 * @uml.property  name="uploadlinkservice"
	 * @uml.associationEnd  
	 */
	private UploadLinkService uploadlinkservice;
	
	@RequestMapping
	public ModelAndView uploadLink(MultipartHttpServletRequest request,UploadLinkVO uploadlinkvo) throws Exception {
		
		MultipartFile linkimg=request.getFile("mediaimg");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		@SuppressWarnings("unused")
		String date = sdf.format(new Date());
		uploadlinkvo.setRegdate(new Date());
		
		uploadlinkservice.insertUploadLink(uploadlinkvo);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("songname", uploadlinkvo.getSongname());
		int linknum=uploadlinkservice.getLinkNum(map);
		
		
		@SuppressWarnings("deprecation")
		String path=request.getRealPath("/linkmediaimage");
		File makinglinkmediaimg=new File(path,linknum+".jpg");
		linkimg.transferTo(makinglinkmediaimg);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/main/mainpage.jsp");
		return mav;
	}

	/**
	 * @return
	 * @uml.property  name="uploadlinkservice"
	 */
	public UploadLinkService getUploadlinkservice() {
		return uploadlinkservice;
	}

	/**
	 * @param uploadlinkservice
	 * @uml.property  name="uploadlinkservice"
	 */
	public void setUploadlinkservice(UploadLinkService uploadlinkservice) {
		this.uploadlinkservice = uploadlinkservice;
	}

	

}
