package com.community.service;

import java.util.List;

import com.community.model.Kind;
import com.community.model.Pkind;

public interface KindService {

	public void addKind(Kind kind);
	public List<Kind> findKindByName(Kind kind);
	public List<Kind> findKindByName(String kindName);
	public List<Kind> findKindById(Kind kind);
	public List<Kind> findAllKind();
	public List<Kind> findKindByPkindId(Pkind pkind);
	public void deleteKind(Kind kind);
	public void medifyKind(Kind kind);
	public boolean delSelectKinds(String[] sds);
}
