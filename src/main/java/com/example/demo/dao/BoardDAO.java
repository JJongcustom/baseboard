package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.dto.Board;

@Mapper
@Repository
public interface BoardDAO {
	Integer selectMaxBoardNum() throws Exception;
	void insertBoard(Board board) throws Exception;
	int selectBoardCount() throws Exception;
	List<Board> selectBoardList(int startrow) throws Exception;
	Board selectBoard(int boardNum) throws Exception;
	void updateReadCount(int boardNum) throws Exception;
	void updateBoard(Board board) throws Exception;
	void deleteBoard(int boardNum) throws Exception;
	int selectBoardCount2() throws Exception;;
}