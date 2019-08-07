package com.cafe24.shoppingmall_front.dto;

import java.util.List;

import com.cafe24.shoppingmall_front.vo.OptionChildVo;

public class OptionChildForm {
	private List<OptionChildVo> optionChilds;

	public OptionChildForm(List<OptionChildVo> optionChilds) {
		this.optionChilds = optionChilds;
	}

	public List<OptionChildVo> getOptionChilds() {
		return optionChilds;
	}

	public void setOptionChilds(List<OptionChildVo> optionChilds) {
		this.optionChilds = optionChilds;
	}
	
}
