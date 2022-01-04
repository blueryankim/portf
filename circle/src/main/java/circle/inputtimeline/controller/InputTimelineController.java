package circle.inputtimeline.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.inputtimeline.model.InputTimelineVO;
import circle.inputtimeline.model.TimelineContentVO;
import circle.inputtimeline.service.InputTimelineService;

@Controller
public class InputTimelineController {

	private InputTimelineService its;
	@RequestMapping
	public ModelAndView inputTimeline(InputTimelineVO inputtimelinevo,HttpSession session,HttpServletRequest request)throws Exception{
		
		String imagepath=inputtimelinevo.getImagepath();
		String id=(String)session.getAttribute("id");
		inputtimelinevo.setId(id);
		String writer=(String)session.getAttribute("writer");
		inputtimelinevo.setWriter(writer);
		String filename=null;
				
		
		if(inputtimelinevo.getImagepath()!=null && inputtimelinevo.getImagepath()!=""){
		//�̹��� ������ �������丮�� �����ϱ� ���� ����
		String latestimagenum=its.getLatestImageNum(id);
		if(latestimagenum=="" || latestimagenum==null || latestimagenum.equals("")){
			
			latestimagenum="1";
			filename="1";
		}
		
		else{
			latestimagenum=String.valueOf((Integer.parseInt(latestimagenum)+1));
			filename=latestimagenum;
		}
		
		
		String mymemberimagepath="/"+id;
		File imagefile=new File(imagepath);
		FileInputStream fis=null;
		if(imagefile.exists()){
			fis=new FileInputStream(imagefile); //inputstream
		}//myimagepath�� �ִ� ���� inputstream. �������� ��
		

		@SuppressWarnings("deprecation")
		String makepath=request.getRealPath("/memberimage")+mymemberimagepath;
		//���� ���
		File drforimgfile=new File(makepath);
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
		
		
		
		//�̹��� ������ ���� ���丮�� �����ѵڿ� ���� �̸��� db�� �����Ѵ�.
		
		String imagekind="timeline";
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("imagekind", imagekind);
		map.put("id",id);
		map.put("latestimagenum",latestimagenum);
		
		its.insertImageInfor(map);
		
		
		inputtimelinevo.setImagepath(latestimagenum);//�ٲ� �̹��� �̸�
		}//������� Ÿ�Ӷ��� ������ ������� �������� �˰���
		
		
		its.insertTimeline(inputtimelinevo);
		//Ÿ�Ӷ��� �� �ֱ� but �̹��� �н��� �ٲ㼭 �Է��ؾ��Ѵ�.
		
		String timearr=(String)session.getAttribute("timearr");
		System.out.println(timearr);
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map2=new HashMap<String,Object>();
		if(timearr=="popular" || timearr.equals("popular")){
			
		map2.put("kindoftimeline", "popular");
		map2.put("id", id);
		//Date populartime=(Date)session.getAttribute("populartime");	
		
		List<TimelineContentVO> updatedtimelinelist=its.getUpdateTimeline(map2);	
		session.setAttribute("latesttime", updatedtimelinelist.get(0).getRegdate());
		mav.addObject("updatedtimelinelist",updatedtimelinelist);
		
		}
				
		else{
		
		Date latesttime=(Date)session.getAttribute("latesttime");	
		map2.put("kindoftimeline", "latest");
		map2.put("latesttime",latesttime);
		List<TimelineContentVO> updatedtimelinelist=its.getUpdateTimeline(map2);	
		int updatetimelinelistsize=updatedtimelinelist.size();
		session.setAttribute("latesttime", updatedtimelinelist.get(updatetimelinelistsize-1).getRegdate());		
		mav.addObject("updatedtimelinelist",updatedtimelinelist);
		
		}
		
		mav.setViewName("/updatedtimelist/updatedtimelist.jsp");
		
		return mav;
		
		}
	
		

	
	public void setIts(InputTimelineService its) {
		this.its = its;
	}
	
	
}
