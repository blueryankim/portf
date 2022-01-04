package finder.postcontent.service;

import finder.postcontent.dao.PostContentDao;
import finder.postcontent.model.PostContentVO;

public class PostContentServiceImpl implements PostContentService {

	private PostContentDao pcd;
	@Override
	public int getImageNum(String id) {
		
		return pcd.getImageNum(id);
	}

	@Override
	public void postContent(PostContentVO pcVO) {
		
		pcd.postContent(pcVO);
	}
	
	
	public PostContentDao getPcd() {
		return pcd;
	}

	public void setPcd(PostContentDao pcd) {
		this.pcd = pcd;
	}

	
}
