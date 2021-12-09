package admin.vo;

public class ProductVO {
	private int idx;
	private int cate_idx;
	private String name;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ProductVO [idx=" + idx + ", cate_idx=" + cate_idx + ", name=" + name + "]";
	}
	
	
}
