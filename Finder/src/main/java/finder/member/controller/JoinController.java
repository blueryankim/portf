package finder.member.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import finder.member.model.JoinVO;
import finder.member.service.JoinService;

@Controller
public class JoinController {
	
	private JoinVO joinvo;
	private JoinService joinservice;
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView joinMember(JoinVO joinVO,MultipartHttpServletRequest request) throws Exception{
		
		MultipartFile profileimagefile=request.getFile("profileimg");//이미지 파일 얻어오기.
		//System.out.println("hello");
		//프로필 이미지 파일 인풋 / 아웃풋
		String id=joinVO.getMemberid();
		System.out.println(id);
		System.out.println(joinVO.getEmail());
		System.out.println(joinVO.getPass());
		//String profileimgpath=joinVO.getProfileimg();
		//System.out.println(profileimgpath);
		//File profileimgfile=new File(profileimgpath);
		//FileInputStream fis=null;
		
		//if(profileimgfile.exists()){
		//	fis=new FileInputStream(profileimgfile);
		//}//사용자가 업로드한 프로필 이미지 로컬 경로에 file input
		
		@SuppressWarnings("deprecation")
		String makepath=request.getRealPath("/profileimage");
		File imagefile=new File(makepath,id+".jpg");
		profileimagefile.transferTo(imagefile);
		
		/*String serverimagestorpath=request.getRealPath("/images");
			System.out.println(serverimagestorpath);
			File imagefile=new File(serverimagestorpath,imagenum+".jpg");
			imagefilefromview.transferTo(imagefile);*/
		/*
		FileOutputStream fos=new FileOutputStream(makepath+"\\"+id+".jpg");
		int data=0;
		while((data=fis.read())!=-1){
			fos.write(data);
		}
		
		try{
			fis.close();
			fos.close();
		}catch(IOException e){}*/
		
		joinservice.addMember(joinVO);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/login/loginpage.jsp");
		
		return mav;
	}
	
	
	
	public JoinService getJoinservice() {
		return joinservice;
	}

	public void setJoinservice(JoinService joinservice) {
		this.joinservice = joinservice;
	}
	
	public JoinVO getJoinvo() {
		return joinvo;
	}


	public void setJoinvo(JoinVO joinvo) {
		this.joinvo = joinvo;
	}


}
