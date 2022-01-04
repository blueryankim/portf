package finder.postcontent.service;

import finder.postcontent.model.PostContentVO;

public interface PostContentService {
	
	public int getImageNum(String id);
	public void postContent(PostContentVO pcVO);
	

}
