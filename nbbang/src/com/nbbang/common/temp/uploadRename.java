package com.nbbang.common.temp;

import java.text.SimpleDateFormat;
import java.util.Date;

public class uploadRename {
	
	public String randomString(String originalFileName) {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int randomNum = (int)(Math.random()*100000);
		
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		return "nbbang_" + sdf.format(new Date(currentTime)) + randomNum + fileExtension;
	}
}
