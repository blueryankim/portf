//

package subak.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import subak.chart.model.ChartVO;
import subak.chart.model.Paging;
import subak.chart.service.ChartListService;


@Controller
public class ChartListController {

	/**
	 * @uml.property  name="chartListService"
	 * @uml.associationEnd  
	 */
	private ChartListService chartListService ;
	/**
	 * @uml.property  name="chartPaging"
	 * @uml.associationEnd  
	 */
	private Paging chartPaging;
	
	
	@RequestMapping
	public ModelAndView getChartList(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		// 페이지 번호
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10; // 페이지당 보여줄 데이터수 1위에서 10위
		int pagenavi = 2; // 페이지번호 보여줄수 11위에서 20위
		// 검색기능
		String search_type = request.getParameter("search_type");
		//search_type랑 pageNum을 함께 전송한다.
		if( search_type==null || search_type==""){
			search_type="ppopular";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_type", search_type);
		
		// List 처리
		// 전체 글 수 or 검색하고자 하는 글 수
		int count=this.chartListService.getChartCount(map);
		// List에 보여지는 글번호
		//paging 작업 시작
		
		int number = 1 + (currentPage - 1) * pageSize;//페이지 시작 번호
		chartPaging.setPaging(// 페이징 클래스 //currentpage에 따라서 글 시작 번호가 달라짐.
				pageSize, pagenavi,count,currentPage);
		map.put("startRow", chartPaging.getWriting_Start());
		map.put("endRow", chartPaging.getWriting_End());
		//map에 search_type과 startRow endRow를 집어넣음
		List<ChartVO> chartList = // 전체글 or 검색하고자 하는 글
		this.chartListService.getChartList(map); //map을 보냄
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("search_type",search_type);
		model.put("chartList", chartList);
		model.put("count", count);
		model.put("number", number);
		model.put("search_type", search_type);
		model.put("pageNum", pageNum);
		model.put("cp", chartPaging);
		// 해당 뷰에서 사용할 속성
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chart/chartmain.jsp");
		modelAndView.addAllObjects(model);
		return modelAndView;
	}
	
	
	/**
	 * @param chartListService
	 * @uml.property  name="chartListService"
	 */
	public void setChartListService(ChartListService chartListService) {
		this.chartListService = chartListService;
	}


	/**
	 * @param chartPaging
	 * @uml.property  name="chartPaging"
	 */
	public void setChartPaging(Paging chartPaging) {
		this.chartPaging = chartPaging;
	}
	
	
	
}
