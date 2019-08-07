package com.cafe24.shoppingmall_front.dto;

import java.util.List;

import com.cafe24.shoppingmall_front.vo.OptionParentVo;

public class OptionParentForm {
	private List<OptionParentVo> optionParents;

	public OptionParentForm(List<OptionParentVo> optionParents) {
		this.optionParents = optionParents;
	}

	public List<OptionParentVo> getOptionParents() {
		return optionParents;
	}

	public void setOptionParents(List<OptionParentVo> optionParents) {
		this.optionParents = optionParents;
	}
	
}
