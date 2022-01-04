package hooray.uploadproject.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hooray.uploadproject.service.SaveImageService;

@Controller
public class SaveImageController {

private SaveImageService saveImageService;
@RequestMapping(value="/write/saveimage.do",method=RequestMethod.POST)
@ResponseBody
public String saveImage(MultipartHttpServletRequest req, HttpSession session) throws Exception{
	
	int projectNum;
	String memimgpath;
	String myimgpath;
	String email;
	String imgNum;
	String sendPath;
	//String originalfilepath;
	//String thumbnailpath;
	
	session=req.getSession();
	email=(String)session.getAttribute("email");
	
	
	MultipartFile imgFile=req.getFile("uploadFile");

	

	System.out.println();
	imgNum=req.getParameter("babo");
	System.out.println(imgNum);
	projectNum=saveImageService.getProjectNum();
	session.setAttribute("projectNum", projectNum);
	
	memimgpath=req.getSession().getServletContext().getRealPath("/memberimages");
	myimgpath=memimgpath+File.separator+email+File.separator+projectNum;
	System.out.println(myimgpath);
	
	File makeDir=new File(myimgpath);
	
	if(!makeDir.exists()){
		makeDir.mkdirs();
	}
	
	File imagefile=new File(myimgpath,imgNum+".jpg");
	imgFile.transferTo(imagefile);
	
	
	
	
	
	/*썸네일 만들기
	originalfilepath=myimgpath+imgNum+".jpg";
	Image img=new ImageIcon(originalfilepath).getImage();
	
	int thumbnail_width = 500;
	int thumbnail_height = img.getHeight(null);
	

	File original_file_name=new File(originalfilepath);
	BufferedImage buffer_original_image =ImageIO.read(original_file_name); //경로로부터 이미지 파일 읽어옮.
	BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
	Graphics2D graphic = buffer_thumbnail_image.createGraphics();
	
	graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
	
	
	thumbnailpath=req.getSession().getServletContext().getRealPath("/thumbnails");
	thumbnailpath=thumbnailpath+File.separator+email+File.separator+projectNum;
	
	makeDir=new File(thumbnailpath);
	if(!makeDir.exists()){
		makeDir.mkdirs();
	}
	
	File thumb_file_name=new File(thumbnailpath+".jpg");
	ImageIO.write(buffer_thumbnail_image, "jpg",thumb_file_name);

	*/
	
	
	System.out.println(imagefile.getName());
	
	sendPath=email+File.separator+projectNum;
	return sendPath;
}


@RequestMapping(value="/write/updateimage.do",method=RequestMethod.POST)
@ResponseBody
public String updateImage(MultipartHttpServletRequest req, HttpSession session) throws Exception{
	
	String projectNum;
	String memimgpath;
	String myimgpath;
	String email;
	String imgNum;
	String sendPath;
	//String originalfilepath;
	//String thumbnailpath;
	
	session=req.getSession();
	email=(String)session.getAttribute("email");
	
	
	MultipartFile imgFile=req.getFile("uploadFile");

	

	System.out.println();
	imgNum=req.getParameter("babo");
	projectNum=(String)req.getParameter("projectNum");
	
	
	memimgpath=req.getSession().getServletContext().getRealPath("/memberimages");
	myimgpath=memimgpath+File.separator+email+File.separator+projectNum;
	System.out.println(myimgpath);
	
	File imagefile=new File(myimgpath,imgNum+".jpg");
	imgFile.transferTo(imagefile);
	
	System.out.println(imagefile.getName());
	
	sendPath=email+File.separator+projectNum;
	return sendPath;
}
	
	

	public SaveImageService getSaveImageService() {
	return saveImageService;
}
	public void setSaveImageService(SaveImageService saveImageService) {
	this.saveImageService = saveImageService;
}

	
}
