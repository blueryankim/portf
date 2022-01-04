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
		// ������ ��ȣ
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		// ���� ������
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10; // �������� ������ �����ͼ� 1������ 10��
		int pagenavi = 2; // ��������ȣ �����ټ� 11������ 20��
		// �˻����
		String search_type = request.getParameter("search_type");
		//search_type�� pageNum�� �Բ� �����Ѵ�.
		if( search_type==null || search_type==""){
			search_type="ppopular";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_type", search_type);
		
		// List ó��
		// ��ü �� �� or �˻��ϰ��� �ϴ� �� ��
		int count=this.chartListService.getChartCount(map);
		// List�� �������� �۹�ȣ
		//paging �۾� ����
		
		int number = 1 + (currentPage - 1) * pageSize;//������ ���� ��ȣ
		chartPaging.setPaging(// ����¡ Ŭ���� //currentpage�� ���� �� ���� ��ȣ�� �޶���.
				pageSize, pagenavi,count,currentPage);
		map.put("startRow", chartPaging.getWriting_Start());
		map.put("endRow", chartPaging.getWriting_End());
		//map�� search_type�� startRow endRow�� �������
		List<ChartVO> chartList = // ��ü�� or �˻��ϰ��� �ϴ� ��
		this.chartListService.getChartList(map); //map�� ����
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("search_type",search_type);
		model.put("chartList", chartList);
		model.put("count", count);
		model.put("number", number);
		model.put("search_type", search_type);
		model.put("pageNum", pageNum);
		model.put("cp", chartPaging);
		// �ش� �信�� ����� �Ӽ�
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
