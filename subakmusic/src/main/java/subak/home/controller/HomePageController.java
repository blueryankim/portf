package subak.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.chart.model.ChartVO;
import subak.chart.service.ChartListService;
import subak.home.model.ShareAlbumListVO;
import subak.home.service.ShareAlbumListService;
import subak.home.service.ViewService;

@Controller
public class HomePageController {
	public ViewService viewService;
	private ShareAlbumListService sharealbumservice;
	public ChartListService chartListService;
	
	public void setViewService(ViewService viewService) {
		this.viewService = viewService;
	}
	
	public void setChartListService(ChartListService chartListService) {
		this.chartListService = chartListService;
	}
	
	public ShareAlbumListService getSharealbumservice() {
		return sharealbumservice;
	}


	public void setSharealbumservice(ShareAlbumListService sharealbumservice) {
		this.sharealbumservice = sharealbumservice;
	}


	public ViewService getViewService() {
		return viewService;
	}

	@RequestMapping
	public ModelAndView setView(HttpServletRequest request){
		System.out.println("홈페이지 뷰 컨트롤러 가동");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> model = new HashMap<String,Object>();
		
		String search_type = request.getParameter("search_type");
		System.out.println("현재 선택된 타입 : "+search_type);
		
		if( search_type==null || search_type==""){
			search_type="ppopular";
		}
		
		model.put("search_type", " ");
		int count = chartListService.getChartCount(model);
		
		model.put("startRow", 1);
		model.put("endRow", 5);
		List<ChartVO> chartList = chartListService.getChartList(model);
		model.put("recent1stRow", chartList);
		model.put("musicCount", count);
		
		model.put("startRow", 6);
		model.put("endRow",10);
		chartList = chartListService.getChartList(model);
		model.put("recent2ndRow", chartList);
		
		Map<String,Object> sharealbummap=new HashMap<String,Object>();
		sharealbummap.put("startRow", 1);
		sharealbummap.put("endRow",7);
		List<ShareAlbumListVO> sharealbumlist=sharealbumservice.getShareAlbumList(sharealbummap);
		/*System.out.println(sharealbumlist.get(0).getSubject());
		System.out.println(sharealbumlist.get(1).getSubject());
		System.out.println(sharealbumlist.get(2).getSubject());
		System.out.println(sharealbumlist.get(3).getSubject());
		System.out.println(sharealbumlist.get(4).getSubject());
		System.out.println(sharealbumlist.get(5).getSubject());
		System.out.println(sharealbumlist.get(6).getSubject());*/
		
		model.put("search_type", search_type);
		model.put("startRow", 1);
		model.put("endRow", 10);
		
		chartList = viewService.getChartVOs(model);
		model.put("chartList", chartList);
		model.put("sharealbumlist",sharealbumlist);
		
		mav.setViewName("/home/home_temp.jsp");
		mav.addAllObjects(model);
		
		return mav;
	}

}