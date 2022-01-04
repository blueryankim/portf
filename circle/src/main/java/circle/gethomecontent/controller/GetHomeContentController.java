//popular과 latest의 latesttime의 용도는 다르다 popular과 같은 경우는 정적 페이지 이므로
//내 데이터가 업데이트된 것을 가져오기 위해서 latesttime을 기준으로 사용하지만,
//lates에는 다른 사람들이 글을 올린 것 까지 계속 db에서 가져오는 동적페이지 이므로 latesttime를 
//기준으로 가장 최근 시간 사이에서 데이터를 가져올 때 한번 사용하고 다시 가장 최근 시간으로 업데이트 해야한다.

package circle.gethomecontent.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import circle.gethomecontent.model.CommentCountVO;
import circle.gethomecontent.model.GetCommentVO;
import circle.gethomecontent.model.LoginerInformationVO;
import circle.gethomecontent.model.Paging;
import circle.gethomecontent.model.TimelineContentVO;
import circle.gethomecontent.service.GetHomeContentService;

@Controller
public class GetHomeContentController  {

	private GetHomeContentService ghcs;
	private Paging timelinelistpaging; //Paging
	
	//session 매우 중요한 부분
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView getHomeContent(HttpSession session,HttpServletRequest request) throws Exception{
		//System.out.println("hello1");
		
		String pagenum = request.getParameter("pagenum");
		if (pagenum == null || pagenum == "") {
			pagenum = "1";
		}
		
		int currentpage = Integer.parseInt(pagenum);
		
		int pagesize = 50;
		int pagenavi = 10; 
		
		//세션형성
		session=request.getSession();
		
		session.setAttribute("id", request.getParameter("loginid2"));
		
		//가장 먼저 타임라인 개수를 가져옮. 그이유는 타임라인 개수를 통해서 리스트를 만들어 내기 위해서.
		int count=ghcs.getTimelineCount((String)session.getAttribute("id"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		timelinelistpaging.setPaging(pagesize,pagenavi,count,currentpage);
		
		map.put("starttimeline", timelinelistpaging.getWriting_Start()); //starttimeline
		map.put("endtimeline", timelinelistpaging.getWriting_End()); //endtimeline
		map.put("id", (String)session.getAttribute("id"));
		
		
		String timearr=ghcs.getTimeArr((String)session.getAttribute("id"));//타임라인 종류 얻어옮
	
		
		ModelAndView mav=new ModelAndView();
		//사용자 타임라인 정렬이 인기순인경우
		
		
		if(timearr=="popular" || timearr.equals("popular")){
		Date getpopulartime=ghcs.getPopularTime((String)session.getAttribute("id"));
		map.put("kindoftime", getpopulartime);
		List<TimelineContentVO> poptimelist=ghcs.getPopTimelineList(map); //타임라인 컨텐츠 VO map을 집어 넣음.
		//System.out.println(poptimelist.size());
		List<GetCommentVO> popcommentlist=ghcs.getPopCommentList(map); //댓글 VO
		//코멘트의 최신 시간을 얻어옮. 최신시간을 기준으로 데이터를 가져 올 것임.
		Date getLatestcommenttime=ghcs.getLatestCommentTime((String)session.getAttribute("id"));
		
		Map<String, Object> model = new HashMap<String, Object>(); //model을 불러옮.
		model.put("popcommentlist", popcommentlist);
		model.put("poptimelist", poptimelist);
		if(poptimelist.size()<timelinelistpaging.getWriting_End()){
			
		Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		map.put("startTimeline", timelinelistpaging.getWriting_Start()+poptimelist.size());
		map.put("kindoftime", getlatesttime);
		List<TimelineContentVO> lattimelist=ghcs.getLatTimelineList(map);//남은 것들 더 가져옮.
		List<GetCommentVO> latcommentlist=ghcs.getLatCommentList(map);
		//List<CommentCountVO> latcommentcountlist=ghcs.getLatCommentCountList(map);
		/*
		for(int i=0; i<latcommentcountlist.size();i++){
			
			Map<String,Object> setcommentcountmap=new HashMap<String,Object>();
			System.out.println("-----");
			System.out.println(latcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("gulnum", latcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("commentcount", latcommentcountlist.get(i).getCommentcount());
			System.out.println(latcommentcountlist.get(i).getCommentcount());
			ghcs.setCommentCount(setcommentcountmap);
			
			}*/
		model.put("latcommentlist", latcommentlist);
		model.put("lattimelist", lattimelist);
		
		session.setAttribute("latesttime",getlatesttime);
		session.setAttribute("latestcommenttime", getLatestcommenttime);
		
		}
		
		
		model.put("count", count);
		model.put("pageNum", pagenum);
		model.put("tp", timelinelistpaging);
		LoginerInformationVO getloginerinfor=ghcs.getLoginerInformation((String)session.getAttribute("id"));//로그인한 사람의 정보 가져오기.
		model.put("loginerinfor",getloginerinfor);
		session.setAttribute("writer", getloginerinfor.getName());
		session.setAttribute("timearr", "popular");
		session.setAttribute("populartime", getpopulartime);
		mav.addAllObjects(model);
		mav.setViewName("/homepage/populartimeline.jsp");
		}
		//사용자 타임라인 정렬이 최신순인경우
		else{
		
		Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		map.put("kindoftime", getlatesttime);
		List<TimelineContentVO> lattimelist=ghcs.getLatTimelineList(map);
		List<GetCommentVO> latcommentlist=ghcs.getLatCommentList(map);
		List<CommentCountVO> latcommentcountlist=ghcs.getLatCommentCountList(map);
		
		for(int i=0; i<latcommentcountlist.size();i++){
			Map<String,Object> setcommentcountmap=new HashMap<String,Object>();
			
			setcommentcountmap.put("gulnum", latcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("commentcount", (int)latcommentcountlist.get(i).getCommentcount());
			ghcs.setCommentCount(setcommentcountmap);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		LoginerInformationVO getloginerinfor=ghcs.getLoginerInformation((String)session.getAttribute("id"));
		model.put("latcommentlist", latcommentlist);
		model.put("loginerinfor",getloginerinfor);
		model.put("lattimelist", lattimelist);	
		model.put("count", count);
		model.put("pageNum", pagenum);
		model.put("tp", timelinelistpaging);
		//model.put("curpagenum", curpageNum);	
		session.setAttribute("latesttime", getlatesttime);
		session.setAttribute("writer", getloginerinfor.getName());
		session.setAttribute("timearr", "latest");
		mav.addAllObjects(model);
		mav.setViewName("/homepage/latesttimeline.jsp");
		}
	
		
		
		
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getHomecontent2(HttpSession session,HttpServletRequest request) throws Exception{
		
		
		
		String pagenum = request.getParameter("pagenum");
		if (pagenum == null || pagenum == "") {
			pagenum = "1";
		}
		
		int currentpage = Integer.parseInt(pagenum);
		
		int pagesize = 50;
		int pagenavi = 10; 
		
		
		int count=ghcs.getTimelineCount((String)session.getAttribute("id"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		timelinelistpaging.setPaging(pagesize,pagenavi,count,currentpage);
		
		map.put("starttimeline", timelinelistpaging.getWriting_Start());
		map.put("endtimeline", timelinelistpaging.getWriting_End());
		map.put("id", (String)session.getAttribute("id"));
		
		
		ModelAndView mav=new ModelAndView();
		//사용자 타임라인 정렬이 인기순인경우
		
		
		if((String)session.getAttribute("timearr")=="popular" || ((String)session.getAttribute("timearr")).equals("popular")){
		//System.out.println("hello2");
		Date getpopulartime=ghcs.getPopularTime((String)session.getAttribute("id"));
		//Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		//계속 poptimeline과 latimelienlist 가져오는 것에서 문제 여기까지는 실행이 됐음.
		map.put("kindoftime", getpopulartime);
		//여기에서 에러가 나진 않았음 그리고 같은 친구중에 전체보기 나만보기만 한 친구의 데이터를 가져와야 맞다.
		List<TimelineContentVO> poptimelist=ghcs.getPopTimelineList(map);
		//System.out.println(poptimelist.size()+"");
		List<GetCommentVO> popcommentlist=ghcs.getPopCommentList(map);
		List<CommentCountVO> popcommentcountlist=ghcs.getPopCommentCountList(map);
		//session.setAttribute("poptimelist", poptimelist);
		//session.setAttribute("latesttime", getlatesttime); //popular에서의 latesttime 20개가 넘는경우에
		for(int i=0; i<popcommentcountlist.size();i++){
			//System.out.println("hello3");
			
			Map<String,Object> setcommentcountmap=new HashMap<String,Object>();
			
			setcommentcountmap.put("gulnum", popcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("commentcount", (int)popcommentcountlist.get(i).getCommentcount());
			ghcs.setCommentCount(setcommentcountmap);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("popcommentlist", popcommentlist);
		model.put("poptimelist", poptimelist);
		if(poptimelist.size()<timelinelistpaging.getWriting_End()){
			//System.out.println("hello4");
			
		//getlatesttime을 얻어오더라도 renewdate가 null값인 것을 가져와야 한다.
		Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		map.put("startTimeline", timelinelistpaging.getWriting_Start()+poptimelist.size());
		//System.out.println(timelinelistpaging.getWriting_Start()+poptimelist.size());
		map.put("kindoftime", getlatesttime);
		List<TimelineContentVO> lattimelist=ghcs.getLatTimelineList(map);
		List<GetCommentVO> latcommentlist=ghcs.getLatCommentList(map);
		List<CommentCountVO> latcommentcountlist=ghcs.getLatCommentCountList(map);
		//session.setAttribute("lattimelist", lattimelist);
		
		for(int i=0; i<latcommentcountlist.size();i++){
			//System.out.println("hello5");
			
			Map<String,Object> setcommentcountmap=new HashMap<String,Object>();
			System.out.println(latcommentcountlist.get(i).getGulnum());
			System.out.println(latcommentcountlist.get(i).getCommentcount());
			setcommentcountmap.put("gulnum", latcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("commentcount", (int)latcommentcountlist.get(i).getCommentcount());
			
			ghcs.setCommentCount(setcommentcountmap);
			
			//System.out.println("hello6");
			}
		model.put("latcommentlist", latcommentlist);
		model.put("lattimelist", lattimelist);
		
		session.setAttribute("latesttime",getlatesttime);
	
		
		}
		
		
		model.put("count", count);
		model.put("pageNum", pagenum);
		model.put("tp", timelinelistpaging);
		LoginerInformationVO getloginerinfor=ghcs.getLoginerInformation((String)session.getAttribute("id"));
		model.put("loginerinfor",getloginerinfor);
		session.setAttribute("writer", getloginerinfor.getName());
		session.setAttribute("timearr", "popular");
		session.setAttribute("populartime", getpopulartime);
		mav.addAllObjects(model);
		mav.setViewName("/homepage/populartimeline.jsp");
		}
		//사용자 타임라인 정렬이 최신순인경우
		else{
		
		Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		map.put("kindoftime", getlatesttime);
		List<TimelineContentVO> lattimelist=ghcs.getLatTimelineList(map);
		List<GetCommentVO> latcommentlist=ghcs.getLatCommentList(map);
		List<CommentCountVO> latcommentcountlist=ghcs.getLatCommentCountList(map);
		//session.setAttribute("lattimelist", lattimelist);
		
		for(int i=0; i<latcommentcountlist.size();i++){
			Map<String,Object> setcommentcountmap=new HashMap<String,Object>();
			
			setcommentcountmap.put("gulnum", latcommentcountlist.get(i).getGulnum());
			setcommentcountmap.put("commentcount", (int)latcommentcountlist.get(i).getCommentcount());
			ghcs.setCommentCount(setcommentcountmap);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		LoginerInformationVO getloginerinfor=ghcs.getLoginerInformation((String)session.getAttribute("id"));
		model.put("latcommentlist", latcommentlist);
		model.put("loginerinfor",getloginerinfor);
		model.put("lattimelist", lattimelist);	
		model.put("count", count);
		model.put("pageNum", pagenum);
		model.put("tp", timelinelistpaging);
		//model.put("curpagenum", curpageNum);	
		session.setAttribute("latesttime", getlatesttime);
		session.setAttribute("writer", getloginerinfor.getName());
		session.setAttribute("timearr", "latest");
		
		mav.addAllObjects(model);
		mav.setViewName("/homepage/latesttimeline.jsp");
		}
	
		
		
		//System.out.println("hello7");
		
		return mav;
		
		
		
		
		
		
	}
	
	

	public void setGhcs(GetHomeContentService ghcs) {
		this.ghcs = ghcs;
	}

	public void setTimelinelistpaging(Paging timelinelistpaging) {
		this.timelinelistpaging = timelinelistpaging;
	}

	

	
	
	
	
}
