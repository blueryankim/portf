package hooray.myinformation.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ChangeProfileImgController {
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String updateProfileImg(MultipartHttpServletRequest request, HttpSession session) throws IllegalStateException, IOException{
		
		String email;
		String memberprofileimgpath;
		String myimgpath;
		session=request.getSession();
		email=(String)session.getAttribute("email");
		
		MultipartFile imgFile=request.getFile("profile");
		
		memberprofileimgpath=request.getSession().getServletContext().getRealPath("/memberprofileimg");
		
		File imagefile=new File(memberprofileimgpath,email+".jpg");
		System.out.println("dfdf");
		imgFile.transferTo(imagefile);
		
		return email;
	}
	

}
