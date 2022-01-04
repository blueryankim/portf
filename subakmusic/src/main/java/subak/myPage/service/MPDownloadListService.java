package subak.myPage.service;

import java.util.List;
import subak.myPage.model.DownloadListVO;

public interface MPDownloadListService {
	Integer getDownloadCount(Object obj);
	List<DownloadListVO> getDownloadList(Object obj);
}