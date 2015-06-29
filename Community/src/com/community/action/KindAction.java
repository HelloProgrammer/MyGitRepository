package com.community.action;

import java.net.URLDecoder;
import java.util.ArrayList;
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

import com.community.model.Kind;
import com.community.model.Pkind;
import com.community.service.KindService;
import com.community.service.PkindService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("kindAction")
public class KindAction extends ActionSupport {

	private KindService kindService;
	private PkindService pkindService;
	private Kind kind;
	private List<Kind> kinds;
	private String kindName;
	private String result;
	private String result1;
	
	
	private Pkind pkind;
	
	private String pkindId;
	private String kindId;
	
	public String addKind() {
		try {
			kind.setKindName(URLDecoder.decode(kindName, "UTF-8"));
			kind.setPkind(new Pkind(kind.getPkind().getPkindId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		kindService.addKind(kind);
		return "add success";
	}
	
	public String showOneKind() {
		kinds = kindService.findKindById(kind);
		for (int i = 0; i < kinds.size(); i++) {
			kinds.get(i).getPkind().setPkindId(pkindService.findPkindByName(kinds.get(i).getPkind()).get(0).getPkindName());
		}
		return "kind";
	}
	
	public String deleteKind() {
		kindService.deleteKind(kind);
		return "delete";
	}
	
	public String updateKind() {
		try {
			kind.setKindName(URLDecoder.decode(kindName, "UTF-8"));
			kind.setPkind(new Pkind(kind.getPkind().getPkindId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		kindService.medifyKind(kind);
		return "update";
	}
	
	public String findKindByName() {
		Map<String, String> map = new HashMap<String, String>();
		if (kindService.findKindByName(kindName).isEmpty()) {
			map.put("name", "OK");
		} else {
			map.put("name", "NO");
		}
		// 将要返回的map对象进行json处理
        JSONObject jo = JSONObject.fromObject(map);
        // 调用json对象的toString方法转换为字符串然后赋值给result
        result = jo.toString();
		return "JSON";
	}
	
	public String showAllKind() {
		kinds = kindService.findAllKind();
		for (int i = 0; i < kinds.size(); i++) {
			kinds.get(i).getPkind().setPkindId(pkindService.findPkindByName(kinds.get(i).getPkind()).get(0).getPkindName());
		}
		return "kindlist";
	}
	
	public String showKindsByPkindId() {
		/*kinds = kindService.findKindByPkindId(kind.getPkind());
		for (int i = 0; i < kinds.size(); i++) {
			kinds.get(i).getPkind().setPkindId(pkindService.findPkindByName(kinds.get(i).getPkind()).get(0).getPkindName());
		}
		return "kindslist";*/
		kinds = kindService.findKindByPkindId(kind.getPkind());
		pkind = pkindService.findPkindById(kind.getPkind()).get(0);
		return "kindslist";
	}
	
	
	
	//good
	public String listKinds()
	{
		
		kind= kindService.findKindByName(kindName).get(0);
		
		kinds= kindService.findKindByPkindId(kind.getPkind());
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = kinds.iterator(); iterator.hasNext();) {
			Kind kind = (Kind) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("kindId", kind.getKindId());
			jsonObject.put("kindName",kind.getKindName());
			jsonArray.add(jsonObject);
		}
		result = jsonArray.toString();
		return "list";
	}
	
	public String showOnePkind()
	{
		kind= kindService.findKindByName(kindName).get(0);
		
		Pkind pkind = kind.getPkind();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pkindId", pkind.getPkindId());
		jsonObject.put("pkindName",pkind.getPkindName());
		result1 = jsonObject.toString();
		return "pkind";
	}
	
	
	public String findKindByPkindId()
	{
		kinds = kindService.findKindByPkindId(new Pkind(pkindId));
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = kinds.iterator(); iterator.hasNext();) {
			Kind kind = (Kind) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("kindId", kind.getKindId());
			jsonObject.put("kindName",kind.getKindName());
			jsonArray.add(jsonObject);
		}
		
		result = jsonArray.toString();
		
		
		return "sList";
	}
	public String delSelectKinds()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String sd[] = request.getParameterValues("checkname");
		
		kindService.delSelectKinds(sd);
		return "delSelectKinds";
	}
	
	public KindService getKindService() {
		return kindService;
	}
	@Resource(name="kindService")
	public void setKindService(KindService kindService) {
		this.kindService = kindService;
	}
	public PkindService getPkindService() {
		return pkindService;
	}
    @Resource(name="pkindService")
	public void setPkindService(PkindService pkindService) {
		this.pkindService = pkindService;
	}

	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}

	public List<Kind> getKinds() {
		return kinds;
	}

	public void setKinds(List<Kind> kinds) {
		this.kinds = kinds;
	}

	public String getKindName() {
		return kindName;
	}

	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Pkind getPkind() {
		return pkind;
	}

	public void setPkind(Pkind pkind) {
		this.pkind = pkind;
	}

	public String getResult1() {
		return result1;
	}

	public void setResult1(String result1) {
		this.result1 = result1;
	}

	public String getPkindId() {
		return pkindId;
	}

	public void setPkindId(String pkindId) {
		this.pkindId = pkindId;
	}

	public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}
	
	
}
