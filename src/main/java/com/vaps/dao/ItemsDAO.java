package com.vaps.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.lob.LobHandler;

import com.vaps.bean.Items;

public class ItemsDAO extends SqlSessionDaoSupport implements ItemsInterface {
	private static final Statement ConnUtil = null;
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	@Autowired
	private LobHandler lobHandler;
	
	@Override
	public List<Items> getItemsList() {
		// 상품목록을 출력, 개선필요(내용보기x, 그림x)
		return getSqlSession().selectList("ItemsInterface.getItemsList");
	}
	@Override
	public int setItems(Items item) {
		// 상품정보를 저장
		return getSqlSession().insert("ItemsInterface.setItems", item);
	}
	@Override
	public int getPageCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Items getContents(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int delItems(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Items getItemsModi(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int setItemsModi(Items item) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public InputStream getPicture(Integer itemId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
