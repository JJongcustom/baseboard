package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.Board;
import com.example.demo.dto.PageInfo;

public interface BoardService {
	
	  void regBoard(Board board) throws Exception;
	  List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
	  Board getBoard(int boardNum) throws Exception;
	  void modifyBoard(Board board) throws Exception;
	  void removeBoard(int boardNum) throws Exception;
	 
}