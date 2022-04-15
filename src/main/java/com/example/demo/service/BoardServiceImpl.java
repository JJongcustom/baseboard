package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDAO;
import com.example.demo.dto.Board;
import com.example.demo.dto.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public void regBoard(Board board) throws Exception {
		Integer boardNum = boardDAO.selectMaxBoardNum(); // 보드 넘중 가장 큰값
		System.out.println(boardNum);
		if (boardNum == null) {
			boardNum = 1; // 데이터 첫글은 null 이고 1이져
		} else
			boardNum += 1; // 보드 넘버는 1씩 더함. 게시판 번호
		board.setBoard_num(boardNum);
		board.setBoard_readcount(0);
		boardDAO.insertBoard(board); // 각 보드의 칼럼을 인서트
	}

	@Override
	public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {

//		System.out.println("serviceImpl에 들어온 page값"+ page);

		// 전체 게시물 수
		int listCount = boardDAO.selectBoardCount2();
		// 전체 게시물 수
		int lastCount = boardDAO.selectBoardCount();
		// 최대 페이지 목록 개수 = 전체 게시물 수 / 10 (게시물 10개 씩 출력)
		int maxPage = (int) Math.ceil((double) listCount / 10);
		// 아래에 페이지 이동 버튼도 10개로 구성하기
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; // ex)35페이지 보려면 31,32,33,34, 10으로 나눠서 보기위한
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30...)
		int endPage = startPage + 10 - 1;

//		System.out.println("serviceImpl에서 만든 listCount 값 (DB에 있는 게시물 전체 개수)"+ listCount);
//		System.out.println("serviceImpl에서 만든 maxPage (이게 아마.. 최대 페이지 수?)"+ maxPage);
//		System.out.println("serviceImpl에서 만든 startPage (시작페이지)"+ startPage);
//		System.out.println("serviceImpl에서 만든 endPage (끝페이지)"+ endPage);

		if (endPage > maxPage)
			endPage = maxPage;

		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);

		int startrow = lastCount - ((page - 1) * 10);

		return boardDAO.selectBoardList(startrow);
	}

	@Override
	public Board getBoard(int boardNum) throws Exception {
		boardDAO.updateReadCount(boardNum);
		return boardDAO.selectBoard(boardNum);
	}

	@Override
	public void modifyBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}

	@Override
	public void removeBoard(int boardNum) throws Exception {
		boardDAO.deleteBoard(boardNum);
	}
}
