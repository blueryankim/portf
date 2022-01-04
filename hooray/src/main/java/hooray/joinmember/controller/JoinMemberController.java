package hooray.joinmember.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hooray.joinmember.model.JoinMemberVO;
import hooray.joinmember.service.JoinMemberService;

@Controller
public class JoinMemberController {

	//private JoinMemberVO joinMemberVO;
	private JoinMemberService joinMemberService;
	
	@RequestMapping (method=RequestMethod.POST)
	@ResponseBody
	public String joinMember(MultipartHttpServletRequest request, JoinMemberVO joinMemberVO) throws IllegalStateException, IOException{
		
		int joinFlag;
		String joinFlagStr;
		String email;
		int index;
		String path;
		String memberImgPath;
		
		email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");

		System.out.println(email);
		System.out.println(password);
		System.out.println(name);
	
		
		
		joinFlag=joinMemberService.insertMemberAndConfirm(joinMemberVO);
		
		
		MultipartFile imgFile=request.getFile("introimg");
		path=request.getSession().getServletContext().getRealPath("/memberprofileimg");
		
		
	
		
		File imagefile=new File(path,email+".jpg");
		imgFile.transferTo(imagefile);
		
		index=email.indexOf('@');
		email=email.substring(0, index).trim();
		
		if(joinFlag==1){
			
			joinMemberService.makeMemberTable(email);
		}
		
		joinFlagStr=String.valueOf(joinFlag);
		
		return joinFlagStr;
		
		
	}

	public JoinMemberService getJoinMemberService() {
		return joinMemberService;
	}

	public void setJoinMemberService(JoinMemberService joinMemberService) {
		this.joinMemberService = joinMemberService;
	}

	
	
	
	
}
