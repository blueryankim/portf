package finder.postcontent.dao;

import finder.postcontent.model.PostContentVO;

public interface PostContentDao {

	public void postContent(PostContentVO pcVO);
	public int getImageNum(String id);

}
