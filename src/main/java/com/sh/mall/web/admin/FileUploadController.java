package com.sh.mall.web.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sun.misc.BASE64Encoder;

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
//	@RequestMapping(value="/admin/preview",method=RequestMethod.POST,produces={"application/json"})
//	public @ResponseBody HashMap<String,Object> view(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute view");
//		
//		MultipartFile multipartFile = request.getFile("file");
//		Long size = multipartFile.getSize();
//		String contentType = multipartFile.getContentType();
//		InputStream inputStream = multipartFile.getInputStream();
//		byte[] bytes = IOUtils.toByteArray(inputStream);
//		
//		BASE64Encoder encoder = new BASE64Encoder();
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("fileoriginalsize", size);
//		map.put("contenttype", contentType);
//		map.put("base64", new String(encoder.encode(bytes)));
//		
//		return map;
//	}
//	
//	@RequestMapping(value="/admin/upload",method=RequestMethod.POST)
//	public @ResponseBody String upload(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute upload");
//		
//		String category = (String)request.getSession().getAttribute("category");
//		
//		MultipartFile multipartFile = request.getFile("file");
//		if(multipartFile==null){
//			logger.warn("Upload Image Fail!");
//			
//			return "FAIL";
//		}
//		//获取后缀名
////		String type = multipartFile.getOriginalFilename().substring(
////				multipartFile.getOriginalFilename().indexOf("."));
//		//获取文件名
//		String fileName = multipartFile.getOriginalFilename();
//		
//		String path = request.getSession().getServletContext().
//				getRealPath("/resources/images/"+category+"/small");
//		File destFile = new File(path,fileName);
//		logger.info("path:"+path);
//		logger.info("fileName:"+fileName);
//		if(!destFile.exists()){
//			destFile.mkdirs();
//		}
//		try{
//			multipartFile.transferTo(destFile);
//		}catch(IOException e){
//			logger.warn("上传文件出错！",e);
//			
//			return "FAIL";
//		}
//		
//		return fileName.split("\\.")[0];
//	}
//	
//	@RequestMapping(value="/admin/previewbig",method=RequestMethod.POST,produces={"application/json"})
//	public @ResponseBody HashMap<String,Object> viewBig(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute viewBig");
//		
//		MultipartFile multipartFile = request.getFile("file_big");
//		Long size = multipartFile.getSize();
//		String contentType = multipartFile.getContentType();
//		InputStream inputStream = multipartFile.getInputStream();
//		byte[] bytes = IOUtils.toByteArray(inputStream);
//		
//		BASE64Encoder encoder = new BASE64Encoder();
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("fileoriginalsize", size);
//		map.put("contenttype", contentType);
//		map.put("base64", new String(encoder.encode(bytes)));
//		
//		return map;
//	}
//	
//	@RequestMapping(value="/admin/uploadbig",method=RequestMethod.POST)
//	public @ResponseBody String uploadBig(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute uploadBig");
//		
//		String category = (String)request.getSession().getAttribute("category");
//		
//		MultipartFile multipartFile = request.getFile("file_big");
//		if(multipartFile==null){
//			logger.warn("Upload Image Fail!");
//			
//			return "FAIL";
//		}
//		//获取后缀名
////		String type = multipartFile.getOriginalFilename().substring(
////				multipartFile.getOriginalFilename().indexOf("."));
//		//获取文件名
//		String fileName = multipartFile.getOriginalFilename();
//		
//		String path = request.getSession().getServletContext().
//				getRealPath("/resources/images/"+category+"/big");
//		File destFile = new File(path,fileName);
//		logger.info("path:"+path);
//		logger.info("fileName:"+fileName);
//		if(!destFile.exists()){
//			destFile.mkdirs();
//		}
//		try{
//			multipartFile.transferTo(destFile);
//		}catch(IOException e){
//			logger.warn("上传文件出错！",e);
//			
//			return "FAIL";
//		}
//		
//		return fileName.split("\\.")[0];
//	}
//	
//	@RequestMapping(value="/admin/previewsmall",method=RequestMethod.POST,produces={"application/json"})
//	public @ResponseBody HashMap<String,Object> viewSmall(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute viewSmall");
//		
//		MultipartFile multipartFile = request.getFile("file_small");
//		Long size = multipartFile.getSize();
//		String contentType = multipartFile.getContentType();
//		InputStream inputStream = multipartFile.getInputStream();
//		byte[] bytes = IOUtils.toByteArray(inputStream);
//		
//		BASE64Encoder encoder = new BASE64Encoder();
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("fileoriginalsize", size);
//		map.put("contenttype", contentType);
//		map.put("base64", new String(encoder.encode(bytes)));
//		
//		return map;
//	}
//	
//	@RequestMapping(value="/admin/uploadsmall",method=RequestMethod.POST)
//	public @ResponseBody String uploadSmall(MultipartHttpServletRequest request)
//		throws Exception{
//		logger.info("Execute uploadSmall");
//		
////		String category = (String)request.getSession().getAttribute("category");
//		
//		MultipartFile multipartFile = request.getFile("file_small");
//		if(multipartFile==null){
//			logger.warn("Upload Image Fail!");
//			
//			return "FAIL";
//		}
//		//获取后缀名
////		String type = multipartFile.getOriginalFilename().substring(
////				multipartFile.getOriginalFilename().indexOf("."));
//		//获取文件名
//		String fileName = multipartFile.getOriginalFilename();
//		
//		String path = request.getSession().getServletContext().
//				getRealPath("/resources/images");
//		File destFile = new File(path,fileName);
//		logger.info("path:"+path);
//		logger.info("fileName:"+fileName);
//		if(!destFile.exists()){
//			destFile.mkdirs();
//		}
//		try{
//			multipartFile.transferTo(destFile);
//		}catch(IOException e){
//			logger.warn("上传文件出错！",e);
//			
//			return "FAIL";
//		}
//		
//		return fileName.split("\\.")[0];
//	}
	
	@RequestMapping(value="/admin/setcategory{category}",method=RequestMethod.POST)
	public @ResponseBody String setCategory(@PathVariable String category,
			HttpServletRequest request){
		logger.info("Execute setCategory");
		
		request.getSession().setAttribute("category", category);
		
		return "SUCCESS";
	}
	//多文件上传测试
	@RequestMapping(value="/admin/previewall/{order}",method=RequestMethod.POST,produces={"application/json"})
	public @ResponseBody HashMap<String,Object> viewAllByOrder(MultipartHttpServletRequest request,
			@PathVariable Integer order) throws Exception{
		logger.info("Execute viewAllByOrder");
		
		List<MultipartFile> multipartFiles = request.getFiles("file");
		MultipartFile multipartFile = multipartFiles.get(order);
		
		Long size = multipartFile.getSize();
		String contentType = multipartFile.getContentType();
		InputStream inputStream = multipartFile.getInputStream();
		byte[] bytes = IOUtils.toByteArray(inputStream);
		
		BASE64Encoder encoder = new BASE64Encoder();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("fileoriginalsize", size);
		map.put("contenttype", contentType);
		map.put("base64", new String(encoder.encode(bytes)));
		
		return map;
	}
	
	@RequestMapping(value="/admin/uploadall",method=RequestMethod.POST)
	public @ResponseBody List<String> uploadall(MultipartHttpServletRequest request)
		throws Exception{
		logger.info("Execute uploadAll");
		
		String category = (String)request.getSession().getAttribute("category");
		
		List<MultipartFile> multipartFiles = request.getFiles("file");
		if(multipartFiles==null){
			logger.warn("Upload Image Fail!");
			
			return null;
		}
		int i = 0;
		String path = null;
		List<String> filenames = new ArrayList<String>();
		for(MultipartFile multipartFile : multipartFiles){
			if(i==0){
				path = request.getSession().getServletContext().
						getRealPath("/resources/images/"+category+"/small");
			}else if(i==1){
				path = request.getSession().getServletContext().
				getRealPath("/resources/images/"+category+"/big");
			}else{
				path = request.getSession().getServletContext().getRealPath("/resources/images");
			}
			if(i!=2){
				filenames.add(uploadByCon(multipartFile, path,category,false));
			}else{
				filenames.add(uploadByCon(multipartFile, path,category,true));
			}
			i++;
		}
		
		return filenames;
	}
	
	public String uploadByCon(MultipartFile multipartFile,String path,String category,boolean suff) 
			throws Exception{
		logger.info("Execute uploadSmall");
			
		if(multipartFile==null){
			logger.warn("Upload Image Fail!");
				
			return "FAIL";
		}
		String fileName = multipartFile.getOriginalFilename();
			
		File destFile = new File(path,fileName);
		
		logger.info("path:"+path);
		logger.info("fileName:"+fileName);
		
		if(!destFile.exists()){
			destFile.mkdirs();
		}
		try{
			multipartFile.transferTo(destFile);
		}catch(IOException e){
			logger.warn("上传文件出错！",e);
				
			return "FAIL";
		}
		if(suff){
			return fileName;
		}
		return fileName.split("\\.")[0];
	}
}
