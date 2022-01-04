package subak.uploadsong.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import subak.uploadsong.model.UploadSongVO;
import subak.uploadsong.service.GetSongNumService;
import subak.uploadsong.service.InsertSongService;
@Controller
public class UploadSongController {

	/**
	 * @uml.property  name="insertsongservice"
	 * @uml.associationEnd  
	 */
	private InsertSongService insertsongservice;
	/**
	 * @uml.property  name="getsongnumservice"
	 * @uml.associationEnd  
	 */
	private GetSongNumService getsongnumservice;
	/**
	 * @uml.property  name="fos"
	 */
	private FileOutputStream fos;
	//fileOutputStream으로 파일을 저장해줄 것이다.
	@RequestMapping
	public ModelAndView uploadSong(MultipartHttpServletRequest request,UploadSongVO uploadsongVo) throws Exception {
		
		Map<String,MultipartFile> fileList=new HashMap<String,MultipartFile>();
		fileList=request.getFileMap(); //mp3파일받기
		MultipartFile mp3files=null;
		
		
		//가수이름+ 앨범이름으로 앨범이미지 저장경로를 만든다.
		String path="/"+uploadsongVo.getSinger()+"/"+uploadsongVo.getAlbum();//앨범이미지 저장경로
		String[] genre=request.getParameterValues("genre"); //genre는 중복선택이었으므로 getParameterValues를 통해서 여러개의 선택자를 가져온다.
		String makinggenre="";
		
		//genre 내용 추출
		for(int i=0;i<genre.length;i++){
			if(i<genre.length-1)
			makinggenre+=(genre[i]+","); //DB에 저장하기 위한 데이터를 만들며 구분자는 ','로 한다.
			if(i==genre.length-1){
			makinggenre+=(genre[i]);	
			}
		}
		//path만들기 (mp3저장 및,앨범이미지 저장)
		//mp3개수 구하기
		int songcount=Integer.parseInt(uploadsongVo.getMp3count());
		MultipartFile albumfile[]=new MultipartFile[songcount]; //songcount에 따라서 albumfile을 만든다.
		for(int i=0;i<songcount;i++)
		{	
			
			albumfile[i]=request.getFile("albumimage");//albumfile을 받음 
			//현재 albumfile[i]에 파일이 저장되어 있다.
			
			byte fileData[]=albumfile[i].getBytes();
			//getBytes해주기.
			String songname=request.getParameter("songname"+i);
			//songname+i에 따라서 songname을 저장
			uploadsongVo.setTitle(songname);	
			uploadsongVo.setPath(path);
			uploadsongVo.setGenre(makinggenre);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			@SuppressWarnings("unused")
			String date = sdf.format(new Date());
			uploadsongVo.setRegdate(new Date());
			this.insertsongservice.insertSong(uploadsongVo);
			//for문을 돌면서 입력받은 노래 정보를 데이터베이스에 저장
			//노래를 insert하는 부분
			
			Map<String,String> getsongnum=new HashMap<String,String>();
			getsongnum.put("song", uploadsongVo.getTitle());
			getsongnum.put("singer",uploadsongVo.getSinger());
			getsongnum.put("album",uploadsongVo.getAlbum());
			
			String songnum=String.valueOf(this.getsongnumservice.getSongNum(getsongnum));
			//songnum을 가져와서 mp3파일을 경로에 저장한다. num이 mp3파일의 가리는값이 된다.
			System.out.println(uploadsongVo.getTitle());
			//for(int i=0;i<fileList.size();i++){
		
			mp3files=fileList.get("mp3file"+i);
			//MultipartFile mp3files에 fileList에 저장된 mp3file번호(name)에 따라서 얻어옮  
			@SuppressWarnings("deprecation")
			String makepath=request.getRealPath("/mp3files")+path;
			@SuppressWarnings("deprecation")
			String makepath2=request.getRealPath("/albumimage")+path;
			File makingmp3file=new File(makepath,songnum+".mp3");
			File makingalbumimage=new File(makepath2);
			//songnum에 따라 *폴더*를 만든다.
			if(!makingmp3file.exists() ||!makingalbumimage.exists()){
				makingmp3file.mkdirs();
				makingalbumimage.mkdirs();
				
			}
			
			mp3files.transferTo(makingmp3file);
			
			
			try{
				fos=new FileOutputStream(makepath2+"\\"+songnum+".jpg");
				fos.write(fileData);
			
			}catch(Throwable e){e.printStackTrace();}
			finally{
				if(fos!=null){
					try{
						fos.close();
					}catch(Exception e){}
				}
			}
			
			
			
		}
			
			
				
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/main/mainpage.jsp");
		//main으로 이동할 수도 있을 것 같다.
		return mav;
	}

	/**
	 * @return
	 * @uml.property  name="insertsongservice"
	 */
	public InsertSongService getInsertsongservice() {
		return insertsongservice;
	}

	/**
	 * @param insertsongservice
	 * @uml.property  name="insertsongservice"
	 */
	public void setInsertsongservice(InsertSongService insertsongservice) {
		this.insertsongservice = insertsongservice;
	}

	/**
	 * @return
	 * @uml.property  name="getsongnumservice"
	 */
	public GetSongNumService getGetsongnumservice() {
		return getsongnumservice;
	}

	/**
	 * @param getsongnumservice
	 * @uml.property  name="getsongnumservice"
	 */
	public void setGetsongnumservice(GetSongNumService getsongnumservice) {
		this.getsongnumservice = getsongnumservice;
	}

	
}
