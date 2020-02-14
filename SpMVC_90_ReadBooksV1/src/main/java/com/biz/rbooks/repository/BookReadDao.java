package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;

import com.biz.rbooks.domain.ReadBookDTO;

public interface BookReadDao {

	@Select("SELECT * FROM tbl_read_book")
	public List<ReadBookDTO> selectAll();
	
	@Select("SELECT * FROM tbl_read_book WHERE rb_seq = #{rb_seq}")
	public List<ReadBookDTO> findBySeq();

	@InsertProvider(type = BookSQL.class,method = "rbinsert_sql")
	public int insert(ReadBookDTO readBookDTO);

	@Select("SELECT * FROM tbl_read_book WHERE rb_bcode = #{rb_bcode}")
	public List<ReadBookDTO> findByRBCode(String rb_bcode);
}
