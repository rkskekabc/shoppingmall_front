package com.cafe24.shoppingmall_front.config;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;

@Configuration
@PropertySource("classpath:properties/multipart.properties")
public class WebConfig implements WebMvcConfigurer {
	@Autowired
	private Environment env;
	
	//Message Converter
		@Bean
		public MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter() {
			Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder()
					.indentOutput(true)
					.dateFormat(new SimpleDateFormat("yyyy-MM-dd"))
					.modulesToInstall(new ParameterNamesModule());
			
			MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter(builder.build());
			converter.setSupportedMediaTypes(Arrays.asList(new MediaType("application", "json", Charset.forName("UTF-8"))));
			
			return converter;
		}
		
		@Bean
		public StringHttpMessageConverter stringHttpMessageConverter() {
			StringHttpMessageConverter converter = new StringHttpMessageConverter();
			converter.setSupportedMediaTypes(Arrays.asList(new MediaType("text", "html", Charset.forName("UTF-8"))));
			
			return converter;
		}
		
		@Override
		public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
			converters.add(mappingJackson2HttpMessageConverter());
			converters.add(stringHttpMessageConverter());
		}
		
		@Bean
	    public RestTemplate getCustomRestTemplate(){
	        HttpComponentsClientHttpRequestFactory httpRequestFactory = new HttpComponentsClientHttpRequestFactory();
	        httpRequestFactory.setConnectTimeout(2000);
	        httpRequestFactory.setReadTimeout(3000);
	        HttpClient httpClient = HttpClientBuilder.create()
	                .setMaxConnTotal(200)
	                .setMaxConnPerRoute(20)
	                .build();
	        httpRequestFactory.setHttpClient(httpClient);
	        return new RestTemplate(httpRequestFactory);
	    }
		
		@Bean
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
			multipartResolver.setMaxUploadSize(env.getProperty("maxUploadSize", Long.class));
			multipartResolver.setMaxInMemorySize(env.getProperty("maxInMemorySize", Integer.class));
			multipartResolver.setDefaultEncoding(env.getProperty("defaultEncoding"));
			return multipartResolver;
		}
		
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.setOrder(0).addResourceHandler(env.getProperty("resourceMapping")).addResourceLocations("file:" + env.getProperty("uploadLocation"));
		}
}
