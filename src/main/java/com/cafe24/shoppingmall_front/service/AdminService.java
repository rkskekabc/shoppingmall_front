package com.cafe24.shoppingmall_front.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.shoppingmall_front.dto.CategoryForm;
import com.cafe24.shoppingmall_front.dto.JSONResult;
import com.cafe24.shoppingmall_front.dto.OptionChildForm;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDto;
import com.cafe24.shoppingmall_front.dto.OptionDetailInfoDtoForm;
import com.cafe24.shoppingmall_front.dto.OptionParentForm;
import com.cafe24.shoppingmall_front.dto.OrderHistoryDto;
import com.cafe24.shoppingmall_front.dto.ProductWithFileDto;
import com.cafe24.shoppingmall_front.vo.CategoryVo;
import com.cafe24.shoppingmall_front.vo.MemberVo;
import com.cafe24.shoppingmall_front.vo.OptionChildVo;
import com.cafe24.shoppingmall_front.vo.OptionDetailVo;
import com.cafe24.shoppingmall_front.vo.OptionParentVo;
import com.cafe24.shoppingmall_front.vo.ProductVo;

@Service
public class AdminService {
	private final String BASE_URL = "http://localhost:8080/api";
	private static final String SAVE_PATH = "/shoppingmall-uploads";
	private static final String URL = "/assets/thumbnail";
	
	@Autowired
	private RestTemplate restTemplate;
	
	public List<ProductVo> getProductList() {
		JSONResultProductList result = restTemplate.getForObject(BASE_URL + "/product", JSONResultProductList.class);
		List<ProductVo> list = result.getData();
		
		return list;
	}

	public ProductVo getProduct(Long no) {
		JSONResultProduct result = restTemplate.getForObject(BASE_URL + "/product/" + no, JSONResultProduct.class);
		ProductVo vo = result.getData();
		
		return vo;
	}
	
	public String insertProduct(ProductWithFileDto dto) {
		MultipartFile file = dto.getThumbnail();
		dto.setThumbnailUrl(updateThumbnail(file));
		ProductVo vo = ProductVo.of(dto);
		
		ResponseEntity<JSONResultLong> result = restTemplate.postForEntity(BASE_URL + "/product", vo, JSONResultLong.class);
		JSONResultLong returnVal = result.getBody();
		
		if(result.getStatusCode().is2xxSuccessful()) {
			return returnVal.getResult();
		} else {
			return "fail";
		}
	}
	
	public CategoryForm getCategorySet() {
		List<CategoryVo> categoryList = new ArrayList<CategoryVo>();
		for(int i=0; i<5; i++) {
			CategoryVo categoryVo = new CategoryVo();
			categoryList.add(categoryVo);
		}
		
		return new CategoryForm(categoryList);
	}

	@Transactional
	public String insertCategory(List<CategoryVo> categories) {
		try {
			for(CategoryVo vo : categories) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/category", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}
	
	public List<CategoryVo> getCategory() {
		JSONResultCategoryList result = restTemplate.getForObject(BASE_URL + "/category", JSONResultCategoryList.class);
		List<CategoryVo> list = result.getData();
		
		return list;
	}
	
	public List<CategoryVo> getChildCategory() {
		JSONResultCategoryList result = restTemplate.getForObject(BASE_URL + "/category/child", JSONResultCategoryList.class);
		List<CategoryVo> list = result.getData();
		
		return list;
	}
	
	public List<CategoryVo> getChildCategoryByParent(Long parentNo) {
		JSONResultCategoryList result = restTemplate.getForObject(BASE_URL + "/category/child/" + parentNo, JSONResultCategoryList.class);
		List<CategoryVo> list = result.getData();
		
		return list;
	}

	public CategoryVo getCategoryByNo(Long no) {
		JSONResultCategory result = restTemplate.getForObject(BASE_URL + "/category/" + no, JSONResultCategory.class);
		CategoryVo vo = result.getData();
		
		return vo;
	}

	@Transactional
	public String insertOptionParent(List<OptionParentVo> optionParents) {
		try {
			for(OptionParentVo vo : optionParents) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/option/parent", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public OptionParentForm getOptionParentSet() {
		List<OptionParentVo> optionParentList = new ArrayList<OptionParentVo>();
		for(int i=0; i<5; i++) {
			OptionParentVo optionParentVo = new OptionParentVo();
			optionParentList.add(optionParentVo);
		}
		
		return new OptionParentForm(optionParentList);
	}

	public List<OptionParentVo> getOptionParent() {
		JSONResultOptionParentList result = restTemplate.getForObject(BASE_URL + "/option/parent", JSONResultOptionParentList.class);
		List<OptionParentVo> list = result.getData();
		
		return list;
	}

	public OptionChildForm getOptionChildSet() {
		List<OptionChildVo> optionChildList = new ArrayList<OptionChildVo>();
		for(int i=0; i<5; i++) {
			OptionChildVo optionChildVo = new OptionChildVo();
			optionChildList.add(optionChildVo);
		}
		
		return new OptionChildForm(optionChildList);
	}

	public OptionParentVo getOptionParentByNo(Long parentNo) {
		JSONResultOptionParent result = restTemplate.getForObject(BASE_URL + "/option/parent/" + parentNo, JSONResultOptionParent.class);
		OptionParentVo vo = result.getData();
		
		return vo;
	}

	public List<OptionChildVo> getOptionChild() {
		JSONResultOptionChildList result = restTemplate.getForObject(BASE_URL + "/option/child", JSONResultOptionChildList.class);
		List<OptionChildVo> list = result.getData();
		
		return list;
	}

	public List<OptionChildVo> getOptionChild(Long parentNo) {
		JSONResultOptionChildList result = restTemplate.getForObject(BASE_URL + "/option/child/parent/" + parentNo, JSONResultOptionChildList.class);
		List<OptionChildVo> list = result.getData();
		
		return list;
	}

	public String insertOptionChild(List<OptionChildVo> optionChilds) {
		try {
			for(OptionChildVo vo : optionChilds) {
				if(!"".equals(vo.getName())) 
					restTemplate.postForEntity(BASE_URL + "/option/child", vo, JSONResult.class);
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public OptionDetailInfoDtoForm getOptionDetailInfoDtoSet() {
		List<OptionDetailInfoDto> optionDetailInfoDtoList = new ArrayList<OptionDetailInfoDto>();
		for(int i=0; i<5; i++) {
			OptionDetailInfoDto optionDetailInfoDto = new OptionDetailInfoDto();
			optionDetailInfoDtoList.add(optionDetailInfoDto);
		}
		
		return new OptionDetailInfoDtoForm(optionDetailInfoDtoList);
	}

	public List<OptionDetailInfoDto> getOptionDetailInfoDto(Long productNo) {
		JSONResultOptionDetailInfoDtoList result = restTemplate.getForObject(BASE_URL + "/optiondetail/product/" + productNo, JSONResultOptionDetailInfoDtoList.class);
		List<OptionDetailInfoDto> list = result.getData();
		
		return list;
	}

	public String insertOptionDetail(List<OptionDetailInfoDto> optionDetailInfoDtos) {
		try {
			for(OptionDetailInfoDto dto : optionDetailInfoDtos) {
				if(dto.getStock() != null) {
					OptionDetailVo vo = OptionDetailVo.of(dto);
					restTemplate.postForEntity(BASE_URL + "/optiondetail", vo, JSONResult.class);
				}
			}
			return "success";
		} catch(Exception e) {
			return "fail";
		}
	}

	public List<MemberVo> getMemberList() {
		JSONResultMemberList result = restTemplate.getForObject(BASE_URL + "/member", JSONResultMemberList.class);
		List<MemberVo> list = result.getData();
		
		return list;
	}

	public List<OrderHistoryDto> getOrderList() {
		JSONResultOrderHistoryDtoList result = restTemplate.getForObject(BASE_URL + "/order", JSONResultOrderHistoryDtoList.class);
		List<OrderHistoryDto> list = result.getData();
		
		return list;
	}

	
	
	
	

	
	public String updateThumbnail(MultipartFile multipartFile) {
		String url = "";

		try {
		
			if(multipartFile.isEmpty()) {
				return url;
			}
			
			String originalFilename = 
					multipartFile.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf('.')+1);
			String saveFileName = generateSaveFileName(extName);
			long fileSize = multipartFile.getSize();
			
			System.out.println("##########" + originalFilename);
			System.out.println("##########" + extName);
			System.out.println("##########" + saveFileName);
			System.out.println("##########" + fileSize);
			
			byte[] fileData = multipartFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
			os.write(fileData);
			os.close();
			
			url = URL + "/" + saveFileName;
			
		} catch (IOException e) {
			throw new RuntimeException("Fileupload error:" + e);
		}
		
		return url;
	}
	
	private String generateSaveFileName(String extName) {
		String filename = "";
		Calendar calendar = Calendar.getInstance();
		
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		filename += ("." + extName);
		
		return filename;
	}
	
	private static class JSONResultLong extends JSONResult<Long> {
	}
	
	private static class JSONResultProduct extends JSONResult<ProductVo> {
	}
	
	private static class JSONResultProductList extends JSONResult<List<ProductVo>> {
	}
	
	private static class JSONResultCategoryList extends JSONResult<List<CategoryVo>> {
	}
	
	private static class JSONResultCategory extends JSONResult<CategoryVo> {
	}
	
	private static class JSONResultOptionParentList extends JSONResult<List<OptionParentVo>> {
	}
	
	private static class JSONResultOptionParent extends JSONResult<OptionParentVo> {
	}
	
	private static class JSONResultOptionChildList extends JSONResult<List<OptionChildVo>> {
	}
	
	private static class JSONResultOptionDetailInfoDtoList extends JSONResult<List<OptionDetailInfoDto>> {
	}
	
	private static class JSONResultMemberList extends JSONResult<List<MemberVo>> {
	}
	
	private static class JSONResultOrderHistoryDtoList extends JSONResult<List<OrderHistoryDto>> {
	}
}
