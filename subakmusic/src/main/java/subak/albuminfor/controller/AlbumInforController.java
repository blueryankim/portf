package subak.albuminfor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import subak.albuminfor.model.AlbumInforVO;
import subak.albuminfor.model.GetSingerAndAlbumVO;
import subak.albuminfor.service.AlbumInforService;

@Controller
public class AlbumInforController {
	
	/**
	 * @uml.property  name="albuminforservice"
	 * @uml.associationEnd  
	 */
	private AlbumInforService albuminforservice;
	@RequestMapping
	public ModelAndView getAlbumInfor(@RequestParam(value="songnum")String songnum1){
		
		int songnum=Integer.parseInt(songnum1);
		GetSingerAndAlbumVO gsaa=albuminforservice.getSingerAndAlbum(songnum);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("singer", gsaa.getSinger());
		map.put("album", gsaa.getAlbum());
		List<AlbumInforVO> getalbuminforList=albuminforservice.getAlbumInfor(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("albuminforlist",getalbuminforList);
		mav.addObject("albuminfor",(AlbumInforVO)getalbuminforList.get(0));
		mav.setViewName("/albuminformation/songinformation.jsp");
		
		return mav;
	}
	/**
	 * @return
	 * @uml.property  name="albuminforservice"
	 */
	public AlbumInforService getAlbuminforservice() {
		return albuminforservice;
	}
	/**
	 * @param albuminforservice
	 * @uml.property  name="albuminforservice"
	 */
	public void setAlbuminforservice(AlbumInforService albuminforservice) {
		this.albuminforservice = albuminforservice;
	}

	
}
