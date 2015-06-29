package com.community.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.community.model.Good;


public class Util {

	public static String getNowTime() {
		String nowTime;
		Date date=new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		nowTime = dateFormat.format(date);
		
		return nowTime;
	}

}
