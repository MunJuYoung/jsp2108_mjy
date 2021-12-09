package admin.vo;

public class CategoryVO {
	private int idx;
	private String main_name;
	private String middle_name;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	@Override
	public String toString() {
		return "CategoryVO [idx=" + idx + ", main_name=" + main_name + ", middle_name=" + middle_name + "]";
	}
	
	
	
	
}
