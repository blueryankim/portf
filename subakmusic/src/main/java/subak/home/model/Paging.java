package subak.home.model;

public class Paging {
	/**
	 * @uml.property  name="w_size"
	 */
	private Integer w_size;//페이지당 보여줄 글 수
	/**
	 * @uml.property  name="p_size"
	 */
	private Integer p_size;//페이지번호 표시수
	/**
	 * @uml.property  name="writing_Count"
	 */
	private Integer writing_Count;//전체 글수
	/**
	 * @uml.property  name="cur_Page"
	 */
	private Integer cur_Page;//현재 페이지 
	public Paging(){
		super();
	}
	/*Paging(한 화면에 보여질 글수 , 페이지 분할 수, 총 글의 갯수, 현재 보고 있는 페이지 번호 */
	public void setPaging(Integer w_size, Integer p_size, Integer writing_Count,//생성자
			Integer cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.writing_Count = writing_Count;
		this.cur_Page = cur_Page;
	}
	public Integer getPage_Count(){
		return (writing_Count/w_size)+(writing_Count%w_size > 0 ? 1:0);
		//ex)전체 글수 : 23개 
		//	   페이지당 보여줄 글수 :  10개 -> (23/10=2) + (23%10 은 나머지존재=1) 결국 총 페이지는 3개가 된다. 
	}
	public Integer getPage_Start(){
		return ((cur_Page-1)/p_size)*p_size+1;
		//ex)현재 페이지	: 3페이지 , p_size : 2 ==>페이지 시작수는 ((3-1)/2)*2+1  즉, 3페이지가 시작
		//ex)현재 페이지 : 2페이지 , p_size : 2 ==>페이지 시작수는 ((2-1)/2)*2+1  즉, 1페이지가 시작    
	}
	public Integer getPage_End(){
		return Math.min(getPage_Start()+p_size-1, getPage_Count());
		//ex)시작 페이지수 :  1페이지 , p_size:2 , 총 페이지 개수는 : 3 ==>페이지 마지막 수는 Math.min(1+2-1,3) 즉 , 마지막은 2페이지가 된다 
	}
	public boolean isPre(){
		return getPage_Start()!=1;//시작 페이지가 1이 아니면 [이전] 페이지가 존재한다. 
	}
	public boolean isNext(){
		return getPage_End()<getPage_Count();//마지막 페이지 < 총페이지수 아직 모든 페이지를 돌아본것이 아니므로 [다음] 이 존재한다. 
	}
	public Integer getWriting_End(){
		return cur_Page*w_size;//글번호의 마지막은 = 현재 페이지 *나타낼 글의 사이즈를 곱한값 ex)2페이지면 20번이 
										  //화면에 보여줄 마지막 글 번호가 된다. 
	}
	public Integer getWriting_Start(){
		return getWriting_End() - w_size +1;
		//글의 시작 번호 : 마지막 번호 - 화면에 나타낼 글의 개수 +1 ex)20-10+1 이면 11번이 그 페이지의 처음글의 번호 
	}
	/**
	 * @return
	 * @uml.property  name="w_size"
	 */
	public Integer getW_size() {
		return w_size;
	}
	/**
	 * @param w_size
	 * @uml.property  name="w_size"
	 */
	public void setW_size(Integer w_size) {
		this.w_size = w_size;
	}
	/**
	 * @return
	 * @uml.property  name="p_size"
	 */
	public Integer getP_size() {
		return p_size;
	}
	/**
	 * @param p_size
	 * @uml.property  name="p_size"
	 */
	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}
	/**
	 * @return
	 * @uml.property  name="writing_Count"
	 */
	public Integer getWriting_Count() {
		return writing_Count;
	}
	/**
	 * @param writing_Count
	 * @uml.property  name="writing_Count"
	 */
	public void setWriting_Count(Integer writing_Count) {
		this.writing_Count = writing_Count;
	}
	/**
	 * @return
	 * @uml.property  name="cur_Page"
	 */
	public Integer getCur_Page() {
		return cur_Page;
	}
	/**
	 * @param cur_Page
	 * @uml.property  name="cur_Page"
	 */
	public void setCur_Page(Integer cur_Page) {
		this.cur_Page = cur_Page;
	}
	
}
 