package finder.postcontent.model;

import org.springframework.web.multipart.MultipartFile;

public class PostContentVO {

	private String id;
	private String writer;
	private int categori;
	private int openscope;
	private String contenttitle;
	private String subtitle;
	private String content;
	
	
	public void setId(String id){
		this.id=id;
	}
	
	public String getId(){
		return this.id;
	}
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setCategori(int categori){
		this.categori=categori;
	}
	
	public int getCategori(){
		return this.categori;
	}

	public int getOpenscope() {
		return openscope;
	}

	public void setOpenscope(int openscope) {
		this.openscope = openscope;
	}

	public String getContenttitle() {
		return contenttitle;
	}

	public void setContenttitle(String contenttitle) {
		this.contenttitle = contenttitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	
	
	

}
