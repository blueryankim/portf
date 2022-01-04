package subak.albuminforcomment.service;

import java.util.List;

import subak.albuminforcomment.dao.AlbumInforCommentDao;
import subak.albuminforcomment.model.AlbumInforCommentVO;

public class AlbumInforCommentServiceImpl implements AlbumInforCommentService {
	/**
	 * @uml.property  name="albuminforcommentdao"
	 * @uml.associationEnd  
	 */
	private AlbumInforCommentDao albuminforcommentdao;
	@Override
	public List<AlbumInforCommentVO> getAlbumInforComments(Object albumnum) {
		
		return albuminforcommentdao.getAlbumInforComments(albumnum);
	}
	
	
	
	@Override
	public void insertAlbumInforComment(AlbumInforCommentVO commentVO) {
		albuminforcommentdao.insertAlbumInforComment(commentVO);
		
	}

	@Override
	public List<AlbumInforCommentVO> getAlbumInforComment(Object obj) {
		return albuminforcommentdao.getAlbumInforComment(obj);
	}
	
	public int getCommentCount(int albumnum) {
		
		return albuminforcommentdao.getCommentCount(albumnum);
	}
	
	
	/**
	 * @param albuminforcommentdao
	 * @uml.property  name="albuminforcommentdao"
	 */
	public void setAlbuminforcommentdao(AlbumInforCommentDao albuminforcommentdao) {
		this.albuminforcommentdao = albuminforcommentdao;
	}



	@Override
	public void deleteAlbumInforComment(Object obj) {
		
		albuminforcommentdao.deleteAlbumInforComment(obj);
		
	}

	
	
	
	
	
	
}
