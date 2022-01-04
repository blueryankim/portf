//그냥 듣기만 누르는 경우와 체크해서 들어오는 경우를 구분해야 한다.
//구분 방식은 get방식인 경우와 post방식인 경우를 구분을 두어 만들것이다.

package subak.musicplayer.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import subak.musicplayer.model.MusicPlayerVO;
import subak.musicplayer.service.MusicPlayerService;


@Controller
public class MusicPlayerController {

	/**
	 * @uml.property  name="musicplayerservice"
	 * @uml.associationEnd  
	 */
	private MusicPlayerService musicplayerservice;
	
	@RequestMapping
	public ModelAndView getMusicforPlayer(HttpServletRequest request,
			HttpServletResponse response,@RequestParam(value="songnums")String songnums){
		
		List<MusicPlayerVO> playList=new ArrayList<MusicPlayerVO>();
		//System.out.println(songnums);
		String[] tempsongnum=songnums.split(",");
		int [] songnum=new int[tempsongnum.length];
		for(int i=0;i<songnum.length;i++){
			songnum[i]=Integer.parseInt(tempsongnum[i]);
		
			playList.add(musicplayerservice.getPlayerList(songnum[i]));
		}
		
		
		//데이터베이스를 통해서 play를 위한 데이터를 받을 것이다.
		//Enumeration<String> songparamenum=request.getParameterNames();
	
		//현재 체크박스에서 선택되어진 폼의 이름을 모르므로 Enumeration을 통해서 폼의 네임을 얻는다.
		//List<String> songparamname=new ArrayList<String>();
		//폼에서 얻은 네임을 넣기 위한 List를 만듦.
		//while(songparamenum.hasMoreElements()){ //아무값도 없음 ㅡ.ㅡ;;
		//String songparamname2=songparamenum.nextElement();
		//songparamname.add(songparamname2);
		//Enumeration을 통해서 폼 이름을 가져온뒤 리스트에 담고 있다.
		//}
		
		//int[] realsongnum=new int[songparamname.size()];
		//for(int i=0;i<realsongnum.length;i++){
		//realsongnum[i]=Integer.parseInt(request.getParameter(songparamname.get(i)));
		//realsongnum에 실제 체크박스에서 선택 되어진 값이 존재.
		
		
		//}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("musicPlayerList", playList);
		mav.addObject("songcount",playList.size());
		mav.addObject("songinfor",(MusicPlayerVO)playList.get(0));
		mav.setViewName("/musicplayer/musicplayer.jsp");
		
		return mav;
		}

		/**
		 * @return
		 * @uml.property  name="musicplayerservice"
		 */
		public MusicPlayerService getMusicplayerservice() {
		return musicplayerservice;
		}

		/**
		 * @param musicplayerservice
		 * @uml.property  name="musicplayerservice"
		 */
		public void setMusicplayerservice(MusicPlayerService musicplayerservice) {
		this.musicplayerservice = musicplayerservice;
		}
	
		
}
