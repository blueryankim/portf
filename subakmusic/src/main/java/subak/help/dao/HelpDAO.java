package subak.help.dao;

public interface HelpDAO {
	String getEmail(String name);
	String getId(String email);
	String getPass(String id);
}
