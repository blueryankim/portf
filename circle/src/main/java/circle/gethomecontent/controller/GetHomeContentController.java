//popular�� latest�� latesttime�� �뵵�� �ٸ��� popular�� ���� ���� ���� ������ �̹Ƿ�
//�� �����Ͱ� ������Ʈ�� ���� �������� ���ؼ� latesttime�� �������� ���������,
//lates���� �ٸ� ������� ���� �ø� �� ���� ��� db���� �������� ���������� �̹Ƿ� latesttime�� 
//�������� ���� �ֱ� �ð� ���̿��� �����͸� ������ �� �ѹ� ����ϰ� �ٽ� ���� �ֱ� �ð����� ������Ʈ �ؾ��Ѵ�.

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
	
	//session �ſ� �߿��� �κ�
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
		
		//��������
		session=request.getSession();
		
		session.setAttribute("id", request.getParameter("loginid2"));
		
		//���� ���� Ÿ�Ӷ��� ������ ������. �������� Ÿ�Ӷ��� ������ ���ؼ� ����Ʈ�� ����� ���� ���ؼ�.
		int count=ghcs.getTimelineCount((String)session.getAttribute("id"));
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		timelinelistpaging.setPaging(pagesize,pagenavi,count,currentpage);
		
		map.put("starttimeline", timelinelistpaging.getWriting_Start()); //starttimeline
		map.put("endtimeline", timelinelistpaging.getWriting_End()); //endtimeline
		map.put("id", (String)session.getAttribute("id"));
		
		
		String timearr=ghcs.getTimeArr((String)session.getAttribute("id"));//Ÿ�Ӷ��� ���� ����
	
		
		ModelAndView mav=new ModelAndView();
		//����� Ÿ�Ӷ��� ������ �α���ΰ��
		
		
		if(timearr=="popular" || timearr.equals("popular")){
		Date getpopulartime=ghcs.getPopularTime((String)session.getAttribute("id"));
		map.put("kindoftime", getpopulartime);
		List<TimelineContentVO> poptimelist=ghcs.getPopTimelineList(map); //Ÿ�Ӷ��� ������ VO map�� ���� ����.
		//System.out.println(poptimelist.size());
		List<GetCommentVO> popcommentlist=ghcs.getPopCommentList(map); //��� VO
		//�ڸ�Ʈ�� �ֽ� �ð��� ����. �ֽŽð��� �������� �����͸� ���� �� ����.
		Date getLatestcommenttime=ghcs.getLatestCommentTime((String)session.getAttribute("id"));
		
		Map<String, Object> model = new HashMap<String, Object>(); //model�� �ҷ���.
		model.put("popcommentlist", popcommentlist);
		model.put("poptimelist", poptimelist);
		if(poptimelist.size()<timelinelistpaging.getWriting_End()){
			
		Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		map.put("startTimeline", timelinelistpaging.getWriting_Start()+poptimelist.size());
		map.put("kindoftime", getlatesttime);
		List<TimelineContentVO> lattimelist=ghcs.getLatTimelineList(map);//���� �͵� �� ������.
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
		LoginerInformationVO getloginerinfor=ghcs.getLoginerInformation((String)session.getAttribute("id"));//�α����� ����� ���� ��������.
		model.put("loginerinfor",getloginerinfor);
		session.setAttribute("writer", getloginerinfor.getName());
		session.setAttribute("timearr", "popular");
		session.setAttribute("populartime", getpopulartime);
		mav.addAllObjects(model);
		mav.setViewName("/homepage/populartimeline.jsp");
		}
		//����� Ÿ�Ӷ��� ������ �ֽż��ΰ��
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
		//����� Ÿ�Ӷ��� ������ �α���ΰ��
		
		
		if((String)session.getAttribute("timearr")=="popular" || ((String)session.getAttribute("timearr")).equals("popular")){
		//System.out.println("hello2");
		Date getpopulartime=ghcs.getPopularTime((String)session.getAttribute("id"));
		//Date getlatesttime=ghcs.getLatestTime((String)session.getAttribute("id"));
		//��� poptimeline�� latimelienlist �������� �Ϳ��� ���� ��������� ������ ����.
		map.put("kindoftime", getpopulartime);
		//���⿡�� ������ ���� �ʾ��� �׸��� ���� ģ���߿� ��ü���� �������⸸ �� ģ���� �����͸� �����;� �´�.
		List<TimelineContentVO> poptimelist=ghcs.getPopTimelineList(map);
		//System.out.println(poptimelist.size()+"");
		List<GetCommentVO> popcommentlist=ghcs.getPopCommentList(map);
		List<CommentCountVO> popcommentcountlist=ghcs.getPopCommentCountList(map);
		//session.setAttribute("poptimelist", poptimelist);
		//session.setAttribute("latesttime", getlatesttime); //popular������ latesttime 20���� �Ѵ°�쿡
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
			
		//getlatesttime�� �������� renewdate�� null���� ���� �����;� �Ѵ�.
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
		//����� Ÿ�Ӷ��� ������ �ֽż��ΰ��
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
