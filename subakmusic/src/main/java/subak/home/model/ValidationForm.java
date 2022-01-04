package subak.home.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class ValidationForm {

	/**
	 * @uml.property  name="id"
	 */
	@NotEmpty
	@Size(min = 1, max = 20)
	private String id;
	
	/**
	 * @uml.property  name="password"
	 */
	@NotEmpty(message="Password X")
	@Size(min=1,max=10,message="Password must between 1 to 10 Char")
	private String password;

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}
}
