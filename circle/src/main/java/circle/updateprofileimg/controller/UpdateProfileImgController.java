package circle.updateprofileimg.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import circle.updateprofileimg.service.UpdateProfileImgService;

@Controller
public class UpdateProfileImgController {

	private UpdateProfileImgService upis;
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView updateProfileImg(HttpServletRequest request)throws Exception{
		
		String profileimgpath=request.getParameter("profileimg");
		String id=request.getParameter("id");
		String imagekind=request.getParameter("imagekind");
		//파라미터 값 얻어오기
		String filename=null;
		String latestimagenum=upis.getLatestImageNum(id);
		int chlatestimagenum=0;
		if(latestimagenum==null || latestimagenum==""){
			filename="1";
			latestimagenum="1";
			
		}
		else{
			
			chlatestimagenum=Integer.parseInt(latestimagenum)+1;
			latestimagenum=String.valueOf(chlatestimagenum);
			filename=latestimagenum;//최종적으로 파일 네임 얻음
		}
		//Map
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("latestimagenum", latestimagenum);
		upis.updateProfileImg(map);
		map.put("imagekind", imagekind);
		
		upis.insertImageInfor(map);
		
		String mymemberimagepath="/"+id;//멤버 이미지 경로
		File profileimgfile=new File(profileimgpath);//로컬에 있는 이미지 파일 경로
		FileInputStream fis=null;
		if(profileimgfile.exists()){
			fis=new FileInputStream(profileimgfile); //inputstream
		}//myimagepath로 있는 것을 inputstream. 가져오는 것
		

		@SuppressWarnings("deprecation")
		String makepath=request.getRealPath("/memberimage")+mymemberimagepath;
		//만든 경로
		File drforimgfile=new File(makepath);//폴더 만들기
		if(!drforimgfile.exists()){
			drforimgfile.mkdirs();
			
		}
	
		
		FileOutputStream fos=new FileOutputStream(makepath+"\\"+filename+".jpg");
		int data=0;
		while((data=fis.read())!=-1){
		fos.write(data);
		}
		
		try{
			fis.close();
			fos.close();
		}catch(IOException e){}
		
		
		
		
		
		ModelAndView mav=new ModelAndView();
		//mav.addObject("id",id);
		//mav.addObject("filename",filename);
		mav.setViewName("redirect:/homepage/gethomecontent.do");
		mav.addObject("loginid2",id);
		return mav;
		
		
		
	}

	public void setUpis(UpdateProfileImgService upis) {
		this.upis = upis;
	}
	
	
	
	
}
