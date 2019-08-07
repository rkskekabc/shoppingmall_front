package com.cafe24.shoppingmall_front.dto;

import java.util.List;

import com.cafe24.shoppingmall_front.vo.CategoryVo;

public class OptionDetailInfoDtoForm {
	private List<OptionDetailInfoDto> optionDetailInfoDtos;

	public OptionDetailInfoDtoForm(List<OptionDetailInfoDto> optionDetailInfoDtos) {
		this.optionDetailInfoDtos = optionDetailInfoDtos;
	}

	public List<OptionDetailInfoDto> getOptionDetailInfoDtos() {
		return optionDetailInfoDtos;
	}

	public void setOptionDetailInfoDtos(List<OptionDetailInfoDto> optionDetailInfoDtos) {
		this.optionDetailInfoDtos = optionDetailInfoDtos;
	}
}
