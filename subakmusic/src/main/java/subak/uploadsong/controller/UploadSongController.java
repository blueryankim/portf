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
	//fileOutputStream���� ������ �������� ���̴�.
	@RequestMapping
	public ModelAndView uploadSong(MultipartHttpServletRequest request,UploadSongVO uploadsongVo) throws Exception {
		
		Map<String,MultipartFile> fileList=new HashMap<String,MultipartFile>();
		fileList=request.getFileMap(); //mp3���Ϲޱ�
		MultipartFile mp3files=null;
		
		
		//�����̸�+ �ٹ��̸����� �ٹ��̹��� �����θ� �����.
		String path="/"+uploadsongVo.getSinger()+"/"+uploadsongVo.getAlbum();//�ٹ��̹��� ������
		String[] genre=request.getParameterValues("genre"); //genre�� �ߺ������̾����Ƿ� getParameterValues�� ���ؼ� �������� �����ڸ� �����´�.
		String makinggenre="";
		
		//genre ���� ����
		for(int i=0;i<genre.length;i++){
			if(i<genre.length-1)
			makinggenre+=(genre[i]+","); //DB�� �����ϱ� ���� �����͸� ����� �����ڴ� ','�� �Ѵ�.
			if(i==genre.length-1){
			makinggenre+=(genre[i]);	
			}
		}
		//path����� (mp3���� ��,�ٹ��̹��� ����)
		//mp3���� ���ϱ�
		int songcount=Integer.parseInt(uploadsongVo.getMp3count());
		MultipartFile albumfile[]=new MultipartFile[songcount]; //songcount�� ���� albumfile�� �����.
		for(int i=0;i<songcount;i++)
		{	
			
			albumfile[i]=request.getFile("albumimage");//albumfile�� ���� 
			//���� albumfile[i]�� ������ ����Ǿ� �ִ�.
			
			byte fileData[]=albumfile[i].getBytes();
			//getBytes���ֱ�.
			String songname=request.getParameter("songname"+i);
			//songname+i�� ���� songname�� ����
			uploadsongVo.setTitle(songname);	
			uploadsongVo.setPath(path);
			uploadsongVo.setGenre(makinggenre);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			@SuppressWarnings("unused")
			String date = sdf.format(new Date());
			uploadsongVo.setRegdate(new Date());
			this.insertsongservice.insertSong(uploadsongVo);
			//for���� ���鼭 �Է¹��� �뷡 ������ �����ͺ��̽��� ����
			//�뷡�� insert�ϴ� �κ�
			
			Map<String,String> getsongnum=new HashMap<String,String>();
			getsongnum.put("song", uploadsongVo.getTitle());
			getsongnum.put("singer",uploadsongVo.getSinger());
			getsongnum.put("album",uploadsongVo.getAlbum());
			
			String songnum=String.valueOf(this.getsongnumservice.getSongNum(getsongnum));
			//songnum�� �����ͼ� mp3������ ��ο� �����Ѵ�. num�� mp3������ �����°��� �ȴ�.
			System.out.println(uploadsongVo.getTitle());
			//for(int i=0;i<fileList.size();i++){
		
			mp3files=fileList.get("mp3file"+i);
			//MultipartFile mp3files�� fileList�� ����� mp3file��ȣ(name)�� ���� ����  
			@SuppressWarnings("deprecation")
			String makepath=request.getRealPath("/mp3files")+path;
			@SuppressWarnings("deprecation")
			String makepath2=request.getRealPath("/albumimage")+path;
			File makingmp3file=new File(makepath,songnum+".mp3");
			File makingalbumimage=new File(makepath2);
			//songnum�� ���� *����*�� �����.
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
		//main���� �̵��� ���� ���� �� ����.
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
