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
		MultipartFile imagefilefromview=request.getFile("imagefile");//�̹��� ���� ������.
		
		
		pcVO.setId(id);
		pcVO.setWriter((String)session.getAttribute("name"));
		pcs.postContent(pcVO);//����Ʈ�� ���� DB�� �����ϱ�
		imagenum=pcs.getImageNum(id);//����Ʈ�� ���� ������ �� �̹��� ��ȣ �������ֱ� ���ؼ� ������.
		
			System.out.println(pcVO.getContenttitle());
			System.out.println(pcVO.getOpenscope());
			System.out.println(pcVO.getContent());
			System.out.println(pcVO.getSubtitle());
			
			
			//�Ϲ� �̹��� ���� ��ǲ �ƿ�ǲ �����
			String serverimagestorpath=request.getRealPath("/images");
			System.out.println(serverimagestorpath);
			File imagefile=new File(serverimagestorpath,imagenum+".jpg");
			imagefilefromview.transferTo(imagefile);
			
			
			//�����κ��� �Ϲ� �̹��� ���� ������ �� ����� �����
			int thumbnail_width = 500;
			int thumbnail_height = 500;
			
			
			File origin_file_name=new File(serverimagestorpath+imagenum+".jpg"); //�����̹��� ���� ���� image �����κ���
				
			BufferedImage buffer_original_image = ImageIO.read(origin_file_name); //��ηκ��� �̹��� ���� �о��.
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();
			
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
			@SuppressWarnings("deprecation")
			String severthumbnailstoragepath=request.getRealPath("/thumbnails");
			
			severthumbnailstoragepath=severthumbnailstoragepath+"\\"+imagenum+".jpg";
			File thumb_file_name=new File(severthumbnailstoragepath);
			ImageIO.write(buffer_thumbnail_image, "jpg",thumb_file_name);
		
		/*
			//����� ���λ�����
			
			//�����̹��������� ���+���ϸ�
			File origin_file_name = new File("D:"+File.separator+"original_image.jpg");
			//������ ����������� ���+��������ϸ�
			File thumb_file_name = new File("D:"+File.separator+"thumbnail_image.jpg");

			BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
			ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
			System.out.println("����� �����Ϸ�");*/
		//�̹��� ���� ��� �����Ű� ���ÿ� ������ ����.
		
		
		
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
