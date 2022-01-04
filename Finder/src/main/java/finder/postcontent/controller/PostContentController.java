package finder.postcontent.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import finder.postcontent.model.PostContentVO;
import finder.postcontent.service.PostContentService;

@Controller
public class PostContentController {
	
	private PostContentService pcs;
	private PostContentVO pcvo;
	
	@RequestMapping(method=RequestMethod.POST)
	ModelAndView postContent(HttpSession session,MultipartHttpServletRequest request, PostContentVO pcVO)throws Exception{
		
		int imagenum;
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		MultipartFile imagefilefromview=request.getFile("imagefile");//이미지 파일 얻어오기.
		
		
		pcVO.setId(id);
		pcVO.setWriter((String)session.getAttribute("name"));
		pcs.postContent(pcVO);//포스트한 내용 DB에 저장하기
		imagenum=pcs.getImageNum(id);//포스트에 내용 저장한 것 이미지 번호 지정해주기 위해서 가져옮.
		
			System.out.println(pcVO.getContenttitle());
			System.out.println(pcVO.getOpenscope());
			System.out.println(pcVO.getContent());
			System.out.println(pcVO.getSubtitle());
			
			
			//일반 이미지 파일 인풋 아웃풋 만들기
			String serverimagestorpath=request.getRealPath("/images");
			System.out.println(serverimagestorpath);
			File imagefile=new File(serverimagestorpath,imagenum+".jpg");
			imagefilefromview.transferTo(imagefile);
			
			
			//서버로부터 일반 이미지 파일 가져온 뒤 썸네일 만들기
			int thumbnail_width = 500;
			int thumbnail_height = 500;
			
			
			File origin_file_name=new File(serverimagestorpath+imagenum+".jpg"); //원본이미지 파일 서버 image 폴더로부터
				
			BufferedImage buffer_original_image = ImageIO.read(origin_file_name); //경로로부터 이미지 파일 읽어옮.
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();
			
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
			@SuppressWarnings("deprecation")
			String severthumbnailstoragepath=request.getRealPath("/thumbnails");
			
			severthumbnailstoragepath=severthumbnailstoragepath+"\\"+imagenum+".jpg";
			File thumb_file_name=new File(severthumbnailstoragepath);
			ImageIO.write(buffer_thumbnail_image, "jpg",thumb_file_name);
		
		/*
			//썸네일 세로사이즈
			
			//원본이미지파일의 경로+파일명
			File origin_file_name = new File("D:"+File.separator+"original_image.jpg");
			//생성할 썸네일파일의 경로+썸네일파일명
			File thumb_file_name = new File("D:"+File.separator+"thumbnail_image.jpg");

			BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
			ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
			System.out.println("썸네일 생성완료");*/
		//이미지 파일 경로 가져옮과 동시에 서버에 저장.
		
		
		
		//FileInputStream fis=null;
		
		
		/*if(origin_file_name.exists()){
			fis=new FileInputStream(origin_file_name);
			
		}*/
		
			
		//FileOutputStream fos=new FileOutputStream(makepath+"\\"+imagenum+".jpg");
		/*int data=0;
		while((data=fis.read())!=-1){
			fos.write(data);
		}*/
		/*
		try{
			fis.close();
			fos.close();
		}catch(IOException e){}
		
		*/
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/home/homepage.do");
		return mav;
	}

		public PostContentService getPcs() {
		return pcs;
		}

		public void setPcs(PostContentService pcs) {
		this.pcs = pcs;
	}

		public PostContentVO getPcvo() {
			return pcvo;
		}

		public void setPcvo(PostContentVO pcvo) {
			this.pcvo = pcvo;
		}
	
	
		

}
