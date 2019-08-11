package com.cafe24.shoppingmall_front.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductWithFileDto {
	private Long no;
	private String type;
	private String name;
	private int price;
	private String explanation;
	private MultipartFile thumbnail;
	private String thumbnailUrl;
	private String detail;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "ProductWithFileDto [no=" + no + ", type=" + type + ", name=" + name + ", price=" + price
				+ ", explanation=" + explanation + ", thumbnail=" + thumbnail + ", thumbnailUrl=" + thumbnailUrl
				+ ", detail=" + detail + "]";
	}
	
}
