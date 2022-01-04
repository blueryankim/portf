package hooray.uploadproject.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hooray.applyproject.service.ApplyProjectService;
import hooray.uploadproject.model.UploadProjectVO;
import hooray.uploadproject.service.SaveImageService;
import hooray.uploadproject.service.UploadProjectService;

@Controller
public class UploadProjectController {

	private UploadProjectService uploadProjectService;
	private SaveImageService saveImageservice;
	private ApplyProjectService applyProjectService;
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/write/uploadproject.do",method=RequestMethod.POST)
	@ResponseBody
	public String uploadProject(HttpSession session,MultipartHttpServletRequest request, UploadProjectVO upVO) throws Exception {
		
		//프로젝트를 업로드하는 동시에 프로젝트 참여자가 된다.
		String path;
		String memberImgPath;
		String email;
		Integer projectNum;
		int confirmApply;
		int confirmProject;
		
		session=request.getSession();
	
		email=(String)session.getAttribute("email");
	
		
		if((Integer)session.getAttribute("projectNum")==null){
			projectNum=saveImageservice.getProjectNum();
			session.setAttribute("projectNum", projectNum);
		}
		
		else{
			projectNum=(Integer)session.getAttribute("projectNum");
		}
		
		
		System.out.println(request.getParameter("maintitle"));
		
		upVO.setEmail(email);
		upVO.setName((String)session.getAttribute("name"));
		upVO.setProjectNum(projectNum);
		
		
		confirmProject=uploadProjectService.insertProject(upVO);
		
		//
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("email", email);
		map.put("pnum", projectNum);
		map.put("owner", "owner");
		
		confirmApply=applyProjectService.applyProject(map);
		
		
		MultipartFile imgFile=request.getFile("introimg");
		path=request.getSession().getServletContext().getRealPath("/memberimages");
		
		
		memberImgPath=path+File.separator+email+File.separator+projectNum;
		
		File makeDir=new File(memberImgPath);
		
		if(!makeDir.exists()){
			makeDir.mkdirs();
		}
		
		File imagefile=new File(memberImgPath,"1"+".jpg");
		imgFile.transferTo(imagefile);
		
		if(confirmProject==0){
			return "0";
		}
		
		else{
			String projectStr;
			projectStr=String.valueOf(projectNum);
			return projectStr;
			
		}
		
		
		
		
	}
	
	
	@RequestMapping(value="/write/updateproject.do",method=RequestMethod.POST)
	@ResponseBody
	public String updateProject(HttpSession session, MultipartHttpServletRequest request, UploadProjectVO upVO) throws Exception {
		
		String path;
		String memberImgPath;
		String email;
		Integer projectNum;
		int confirmProject;

		
		session=request.getSession();
	
		email=(String)session.getAttribute("email");
		
		System.out.println(request.getParameter("maintitle"));
	
		
		confirmProject=uploadProjectService.updateProject(upVO);
		projectNum=upVO.getProjectNum();
		
		//대문이미지를 변경한 경우
		if(upVO.getImgchangeflag()==1){
		MultipartFile imgFile=request.getFile("introimg");
		path=request.getSession().getServletContext().getRealPath("/memberimages");
		
		
		memberImgPath=path+File.separator+email+File.separator+projectNum;
		
	
		File imagefile=new File(memberImgPath,"1"+".jpg");
		imgFile.transferTo(imagefile);
		
		}
		
		if(confirmProject==0){
			return "0";
		}
		
		else{
			String projectStr;
			projectStr=String.valueOf(projectNum);
			return projectStr;
			
		}
		
		
		
		
	}

	public UploadProjectService getUploadProjectService() {
		return uploadProjectService;
	}

	public void setUploadProjectService(UploadProjectService uploadProjectService) {
		this.uploadProjectService = uploadProjectService;
	}

	public SaveImageService getSaveImageservice() {
		return saveImageservice;
	}

	public void setSaveImageservice(SaveImageService saveImageservice) {
		this.saveImageservice = saveImageservice;
	}


	public ApplyProjectService getApplyprojectservice() {
		return applyProjectService;
	}


	public void setApplyprojectservice(ApplyProjectService applyprojectservice) {
		this.applyProjectService = applyprojectservice;
	}
	
	
	
	
}
