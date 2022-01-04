package subak.help.service;

public interface FindPassService {
	String getEmail(String name);
	String getId(String email);
	String getPass(String id);
}
