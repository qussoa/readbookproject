package com.biz.rbooks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.ReadBookDTO;
import com.biz.rbooks.repository.BookReadDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReadService {

	private final BookReadDao readDao;

	@Autowired
	public ReadService(BookReadDao readDao) {
		super();
		this.readDao = readDao;
	}
	
	public List<ReadBookDTO> selectAll() {
		return readDao.selectAll();
	}

	public ReadBookDTO findByRBCode(String rb_bcode) {
		ReadBookDTO rbookDTO = readDao.findByRBCode(rb_bcode);
		return rbookDTO;
	}

	public int insert(ReadBookDTO readBookDTO) {
		
		log.debug("READ :" + readBookDTO);
		
		
		int ret = readDao.insert(readBookDTO); 
		return ret; 		
	}

	public ReadBookDTO findBySeq(long rb_seq) {
			ReadBookDTO readBookDTO = readDao.findBySeq(rb_seq);
		return readBookDTO;
	}

	public int update(ReadBookDTO readBookDTO) {

		int ret = readDao.update(readBookDTO);
		return ret;
	}
	
	public int delete(long rb_seq) {
		int ret = readDao.delete(rb_seq);
		return ret;
	}
	
}
