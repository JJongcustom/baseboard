package com.example.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.Board;
import com.example.demo.dto.PageInfo;
import com.example.demo.service.BoardService;



@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	//메인폼, 로그인폼
	@GetMapping({"/main",""}) // main 적어도 갈 수 있고, 안적어도 갈 수 있다.
	public ModelAndView mainform() {
	ModelAndView mv = new ModelAndView("redirect:/login");
	return mv;
	}

	@GetMapping("/writeform") // url뒤에 /writeform 을 적으면 이 페이지로 이동
	public String writeform() {
		return "/writeform";
	}

	@PostMapping("boardwrite")
	public ModelAndView boardWrite(@ModelAttribute Board board) {
		ModelAndView mv = new ModelAndView();
		try {
			if (!board.getFile().isEmpty()) {
				String path = servletContext.getRealPath("/boardupload/");
				MultipartFile file = board.getFile();
				String filename = UUID.randomUUID().toString() + "."
						+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
				File destFile = new File(path + filename);
				board.setBoard_filename(board.getFile().getOriginalFilename());
				board.getFile().transferTo(destFile);
			} else {
				board.setBoard_filename("");
			}
			boardService.regBoard(board);
			mv.setViewName("redirect:/boardlist");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", "새글 등록 실패");
			mv.setViewName("/err");
		}
		return mv;
	}

	@RequestMapping(value = "/boardlist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			String name = (String) session.getAttribute("name");
			if (name != null) {
				List<Board> articleList = boardService.getBoardList(page, pageInfo);
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("articleList", articleList);
				mv.setViewName("/listform");
			} else {
				throw new Exception("글 보기 권한 없음");
			}
		} catch (Exception e) {
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}

	@GetMapping(value = "/boarddetail")
	public ModelAndView boardDetail(@RequestParam(value = "board_num") int boardNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, String user) {
		ModelAndView mv = new ModelAndView();
		try {
			Board board = boardService.getBoard(boardNum);
			mv.addObject("article", board);
			mv.addObject("user", user);
			mv.addObject("page", page);
			mv.setViewName("/viewform");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}
	
	
	@GetMapping(value = "modifyform")  // 글수정
	public ModelAndView modifyform(@RequestParam(value="board_num") int boardNum) {
		ModelAndView mv = new ModelAndView();
		try {
			Board board = boardService.getBoard(boardNum);
			if (board.getBoard_name() .equals (session.getAttribute("name"))) {
				mv.addObject("article", board);
				mv.setViewName("/modifyform");
			} else {
				throw new Exception("글 수정 권한 없음");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", "글 수정 에러");
			mv.setViewName("/err");
			
		}
		return mv;
	}
	
	@PostMapping(value="boardmodify")
	public ModelAndView boardmodify(@ModelAttribute Board board) {
		ModelAndView mv = new ModelAndView();
		try {
			boardService.modifyBoard(board);
			mv.addObject("board_num", board.getBoard_num());
			mv.setViewName("redirect:/boarddetail");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}
	
	@GetMapping(value = "deleteform")
	public ModelAndView deleteform(@RequestParam(value="board_num") int boardNum,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		try {
			Board board = boardService.getBoard(boardNum);
			if (board.getBoard_name() .equals(session.getAttribute("name"))) {
				boardService.removeBoard(boardNum);
				mv.addObject("page", page);
				mv.setViewName("redirect:/boardlist");
			} else {
				throw new Exception("글 삭제 권한 없음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}
}
