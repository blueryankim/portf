//�׳� ��⸸ ������ ���� üũ�ؼ� ������ ��츦 �����ؾ� �Ѵ�.
//���� ����� get����� ���� post����� ��츦 ������ �ξ� ������̴�.

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
		
		
		//�����ͺ��̽��� ���ؼ� play�� ���� �����͸� ���� ���̴�.
		//Enumeration<String> songparamenum=request.getParameterNames();
	
		//���� üũ�ڽ����� ���õǾ��� ���� �̸��� �𸣹Ƿ� Enumeration�� ���ؼ� ���� ������ ��´�.
		//List<String> songparamname=new ArrayList<String>();
		//������ ���� ������ �ֱ� ���� List�� ����.
		//while(songparamenum.hasMoreElements()){ //�ƹ����� ���� ��.��;;
		//String songparamname2=songparamenum.nextElement();
		//songparamname.add(songparamname2);
		//Enumeration�� ���ؼ� �� �̸��� �����µ� ����Ʈ�� ��� �ִ�.
		//}
		
		//int[] realsongnum=new int[songparamname.size()];
		//for(int i=0;i<realsongnum.length;i++){
		//realsongnum[i]=Integer.parseInt(request.getParameter(songparamname.get(i)));
		//realsongnum�� ���� üũ�ڽ����� ���� �Ǿ��� ���� ����.
		
		
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
