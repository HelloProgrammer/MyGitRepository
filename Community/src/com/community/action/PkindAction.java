package com.community.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.community.model.Pkind;
import com.community.service.PkindService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("pkindAction")
public class PkindAction extends ActionSupport {

	private PkindService pkindService;
	private Pkind pkind;
	private String result;//用于json数据传送
	private String pkindName;//用于验证名称是否存在
	private String pkindId;//用于将Id转为Name
	private List<Pkind> pkinds;
	private List<Pkind> sList;//用于显示下拉列表

	public String addPkind() {
		try {
			pkind.setPkindName(URLDecoder.decode(pkindName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		pkindService.addPkind(pkind);
		return "add success";
	}
	
	public String showAllPkind() {
		pkinds = pkindService.findAllPkind();
		return "pkindlist";
	}
	
	public String findAllPkind() {
		sList = pkindService.findAllPkind();
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = sList.iterator(); iterator.hasNext();) {
			Pkind pkind = (Pkind) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("pkindId", pkind.getPkindId());
			jsonObject.put("pkindName", pkind.getPkindName());
			jsonArray.add(jsonObject);
		}
		result = jsonArray.toString();
		return "sList";
	}
	
	public String showOnePkind() {
		pkinds = pkindService.findPkindById(pkind);
		return "pkind";
	}
	

	
	public String findOnePkind() {
		pkinds = pkindService.findPkindByName(pkindName);
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = pkinds.iterator(); iterator.hasNext();) {
			Pkind pkind = (Pkind) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("pkindId", pkind.getPkindId());
			jsonArray.add(jsonObject);
		}
		result = jsonArray.toString();
		return "onepkind";
	}
	
	public String deletePkind() {
		pkindService.deletePkind(pkind);
		return "delete";
	}
	
	public String undatePkind() {
		try {
			pkind.setPkindName(URLDecoder.decode(pkindName, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		pkindService.medifyPkind(pkind);
		return "update";
	}
	
	public String findPkindByName() throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		if (pkindService.findPkindByName(pkindName).isEmpty()) {
			map.put("name", "OK");
		}else {
			map.put("name", "NO");
		}
		// 将要返回的map对象进行json处理
        JSONObject jo = JSONObject.fromObject(map);
        // 调用json对象的toString方法转换为字符串然后赋值给result
        result = jo.toString();
		return "JSON";
	}
	public String delSelectpKinds()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String sd[] = request.getParameterValues("checkname");
		
		pkindService.delSelectKinds(sd);
		return "delSelectpKinds";
	}
	
	public Pkind getPkind() {
		return pkind;
	}
	public void setPkind(Pkind pkind) {
		this.pkind = pkind;
	}
	public PkindService getPkindService() {
		return pkindService;
	}
    @Resource(name="pkindService")
	public void setPkindService(PkindService pkindService) {
		this.pkindService = pkindService;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getPkindName() {
		return pkindName;
	}

	public void setPkindName(String pkindName) {
		this.pkindName = pkindName;
	}

	public List<Pkind> getPkinds() {
		return pkinds;
	}

	public void setPkinds(List<Pkind> pkinds) {
		this.pkinds = pkinds;
	}

	public List<Pkind> getsList() {
		return sList;
	}

	public void setsList(List<Pkind> sList) {
		this.sList = sList;
	}

	public String getPkindId() {
		return pkindId;
	}

	public void setPkindId(String pkindId) {
		this.pkindId = pkindId;
	}
}
