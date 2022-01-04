package subak.uploadsharealbum.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.uploadsharealbum.model.UploadShareAlbumVO;
import subak.uploadsharealbum.service.UploadShareAlbumService;

@Controller
public class UploadShareAlbumController {
	/**
	 * @uml.property  name="uploadsharealbumservice"
	 * @uml.associationEnd  
	 */
	private UploadShareAlbumService uploadsharealbumservice;
	@RequestMapping 
	public ModelAndView uploadShareAlbum(UploadShareAlbumVO uploadsharealbumvo,HttpServletRequest request) throws Exception{
		
	String myimagepath=request.getParameter("imagepath");
	//업로드한 imagepath를 가져옮
	System.out.println(myimagepath);
	String mysongchoice=request.getParameter("songvalues");
	uploadsharealbumvo.setMysongchoice(mysongchoice);
	
	//genre 내용 추출
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@SuppressWarnings("unused")
	String date = sdf.format(new Date());
	uploadsharealbumvo.setRegdate(new Date());
	
	
	String imagepath="/"+uploadsharealbumvo.getId();
	uploadsharealbumvo.setImgpath(imagepath);
	System.out.println(uploadsharealbumvo.getImgpath());
	System.out.println(uploadsharealbumvo.getId());
	System.out.println(uploadsharealbumvo.getInturoduction());
	System.out.println(uploadsharealbumvo.getMysongchoice());
	uploadsharealbumservice.uploadShareAlbum(uploadsharealbumvo);
	int sharealbumnum=uploadsharealbumservice.getShareAlbumNum(uploadsharealbumvo.getId());
	
	File imgfile=new File(myimagepath);
	FileInputStream fis=null;
	if(imgfile.exists()){
		fis=new FileInputStream(imgfile); //inputstream
	}//myimagepath로 있는 것을 inputstream. 가져오는 것
	

	@SuppressWarnings("deprecation")
	String makepath=request.getRealPath("/uploadshareimage")+imagepath;
	//만든 경로
	File drforimgfile=new File(makepath);
	if(!drforimgfile.exists()){
		drforimgfile.mkdirs();
		
	}
	
	FileOutputStream fos=new FileOutputStream(makepath+"\\"+sharealbumnum+".jpg");
	int data=0;
	while((data=fis.read())!=-1){
	fos.write(data);
	}
	
	try{
		fis.close();
		fos.close();
	}catch(IOException e){}
	
	ModelAndView mav=new ModelAndView();
	mav.setViewName("/main/movesharealbumlist.jsp");
	return mav;
}
	/**
	 * @return
	 * @uml.property  name="uploadsharealbumservice"
	 */
	public UploadShareAlbumService getUploadsharealbumservice() {
		return uploadsharealbumservice;
	}
	/**
	 * @param uploadsharealbumservice
	 * @uml.property  name="uploadsharealbumservice"
	 */
	public void setUploadsharealbumservice(
			UploadShareAlbumService uploadsharealbumservice) {
		this.uploadsharealbumservice = uploadsharealbumservice;
	}
	
	
}
