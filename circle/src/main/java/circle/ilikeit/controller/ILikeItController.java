package circle.ilikeit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.ilikeit.model.ILikeItNameAndIdVO;
import circle.ilikeit.model.ILikeItVO;
import circle.ilikeit.service.ILikeItService;

@Controller
public class ILikeItController {

	private ILikeItService ils;
	private ILikeItVO ilivo;
	private ILikeItNameAndIdVO inaivo;
	
	@RequestMapping
	public ModelAndView iLikeit(HttpServletRequest request,HttpSession session) throws Exception{
		
		
		String id=(String)session.getAttribute("id");
		String timelinenum1=request.getParameter("timelinenum");
		int timelinenum=Integer.parseInt(timelinenum1);
		List<ILikeItVO> getlikinglist=ils.getLikingList(timelinenum);
		List<ILikeItNameAndIdVO> nameandidlist=new ArrayList<ILikeItNameAndIdVO>(); 
		
		if(getlikinglist.get(0).getLikingpeople()==null){
			ilivo.setIlike(1);
			ilivo.setLikingpeople(id);
			ilivo.setTimelinenum(timelinenum);
			
			ils.setLikingInfor(ilivo);
			getlikinglist.set(0, ilivo);
			
			inaivo.setId(id);
			inaivo.setName((String)session.getAttribute("writer"));
			
			nameandidlist.add(inaivo);
	
				
		}
		
		else{
			
			ilivo.setIlike(getlikinglist.get(0).getIlike()+1);
			ilivo.setLikingpeople(getlikinglist.get(0).getLikingpeople()+","+id);
			ilivo.setTimelinenum(timelinenum);
			ils.setLikingInfor(ilivo);
			getlikinglist.set(0, ilivo);
			
			String[] peopleid=ilivo.getLikingpeople().split(",");
			System.out.println(peopleid[5]);
			System.out.println(peopleid[4]);
			for(int i=peopleid.length-1;0<=i;i--){
			
			String peoplename=ils.getName(peopleid[i]);	
			System.out.println(i);	
			inaivo.setId(peopleid[i]);
			inaivo.setName(peoplename);
			nameandidlist.add(inaivo);
			
			
			}
			
			
		}
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("nameandidlist",nameandidlist);
		mav.addObject("timelinenum",timelinenum);
		mav.setViewName("/ilikeit/ilikeit.jsp");
		
		return mav;
		
		
	}
	public void setIls(ILikeItService ils) {
		this.ils = ils;
	}
	public void setIlivo(ILikeItVO ilivo) {
		this.ilivo = ilivo;
	}
	public void setInaivo(ILikeItNameAndIdVO inaivo) {
		this.inaivo = inaivo;
	}
	
	
	
	
}
