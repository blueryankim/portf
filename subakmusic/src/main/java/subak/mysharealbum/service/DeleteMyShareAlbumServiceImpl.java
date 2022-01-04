package subak.mysharealbum.service;

import subak.mysharealbum.dao.DeleteMyShareAlbumDao;

public class DeleteMyShareAlbumServiceImpl implements DeleteMyShareAlbumService {

	/**
	 * @uml.property  name="deletemysharealbumdao"
	 * @uml.associationEnd  
	 */
	private DeleteMyShareAlbumDao deletemysharealbumdao;
	@Override
	public void deleteMyShareAlbum(int listnum) {
		deletemysharealbumdao.deleteMyShareAlbum(listnum);
		
	}
	/**
	 * @return
	 * @uml.property  name="deletemysharealbumdao"
	 */
	public DeleteMyShareAlbumDao getDeletemysharealbumdao() {
		return deletemysharealbumdao;
	}
	/**
	 * @param deletemysharealbumdao
	 * @uml.property  name="deletemysharealbumdao"
	 */
	public void setDeletemysharealbumdao(DeleteMyShareAlbumDao deletemysharealbumdao) {
		this.deletemysharealbumdao = deletemysharealbumdao;
	}

	
	
}
