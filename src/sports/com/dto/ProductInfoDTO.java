package sports.com.dto;

public class ProductInfoDTO {

	private String prod_no;
	private String prod_name;
	private String prod_price;
	private String prod_contents;
	private String reg_user_no;
	private String reg_dt;
	private String chg_user_no;
	private String chg_dt;
	private String file_no;
	private String file_grp;
	private int read_more;
	private String option;
	private String opt_grp;
	
	
	public String getOpt_grp() {
		return opt_grp;
	}

	public void setOpt_grp(String opt_grp) {
		this.opt_grp = opt_grp;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getFile_no() {
		return file_no;
	}
	
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	
	public String getFile_grp() {
		return file_grp;
	}
	
	public void setFile_grp(String file_grp) {
		this.file_grp = file_grp;
	}

	public int getRead_more() {
		return read_more;
	}
	
	public void setRead_more(int read_more) {
		this.read_more = read_more;
	}
	
	public String getProd_no() {
		return prod_no;
	}
	
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	
	public String getProd_name() {
		return prod_name;
	}
	
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	public String getProd_price() {
		return prod_price;
	}
	
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_contents() {
		return prod_contents;
	}
	
	public void setProd_contents(String prod_contents) {
		this.prod_contents = prod_contents;
	}
	
	public String getReg_user_no() {
		return reg_user_no;
	}
	
	public void setReg_user_no(String reg_user_no) {
		this.reg_user_no = reg_user_no;
	}
	
	public String getReg_dt() {
		return reg_dt;
	}
	
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	
	public String getChg_user_no() {
		return chg_user_no;
	}
	
	public void setChg_user_no(String chg_user_no) {
		this.chg_user_no = chg_user_no;
	}
	
	public String getChg_dt() {
		return chg_dt;
	}
	
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}

}