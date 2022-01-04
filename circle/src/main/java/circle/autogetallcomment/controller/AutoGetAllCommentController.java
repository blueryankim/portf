package circle.autogetallcomment.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import circle.autogetallcomment.model.AutoGetAllCommentVO;
import circle.autogetallcomment.service.AutoGetAllCommentService;

@Controller
public class AutoGetAllCommentController {

	private AutoGetAllCommentService agacs;
	
	@RequestMapping
	public ModelAndView autoGetAllCommnet(HttpServletRequest request,HttpSession session)throws Exception{
		
		
		String id=(String)session.getAttribute("id");
		
		Date startcommenttime=(Date)session.getAttribute("latestcommenttime");
		
		Date endcommenttime=agacs.getEndCommentTime(id);
		
		Map<String,Object> timemap=new HashMap<String,Object>();
		timemap.put("startcommenttime", startcommenttime);
		timemap.put("endcommenttime", endcommenttime);
		timemap.put("id", id);
		
		List<AutoGetAllCommentVO> allcommentlist=agacs.getCommentList(timemap);
		
		session.setAttribute("latestcommenttime", endcommenttime);
		
		/*List<GetCommentCountVO> commentcountlist=agacs.getCommentCount(id);
		Map<String,Object> map=new HashMap<String,Object>();
		List<AutoGetAllCommentVO> allcommentlist=new ArrayList<AutoGetAllCommentVO>();
		int listsize=0;
		for(int i=0;i<commentcountlist.size();i++){
		map.put("id", id);
		map.put("num", commentcountlist.get(i).getNum());
		map.put("commentcount", commentcountlist.get(i).getCommentcount());
		
		List<AutoGetAllCommentVO> commentlist=agacs.getCommentList(map);
		if(commentlist.size()>0){
			
		for(int j=0;j<commentlist.size();j++){
		agacs.upCommentCount(commentlist.get(j).getGulnum());	
		allcommentlist.add(listsize,commentlist.get(j));
		
		listsize++;
		}
		}
		}
		
			*/
	
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("allcommentlist",allcommentlist);
		mav.setViewName("/getallcommentlist/getallcommentlist.jsp");
		return mav;
		
	}

	public void setAgacs(AutoGetAllCommentService agacs) {
		this.agacs = agacs;
	}
	
	
}
