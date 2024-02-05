package com.spring.frontline.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.frontline.dto.BoardDTO;
import com.spring.frontline.dto.CommentDTO;
import com.spring.frontline.dto.SearchDTO;
import com.spring.frontline.dto.UserDTO;
import com.spring.frontline.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/gomain")
	public String goMain(Model model) {
		List popup = mainService.popup1();
		System.out.println(popup);
		model.addAttribute("popup", popup);
		
		return "main";
	}
	
	@RequestMapping("/goJoin_1")
	public String goJoin_1() {
		return "join_1";
	}
	
	@RequestMapping("/goJoin_2")
	public String goJoin_2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("joinMap");
		
		return "join_2";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "login";
	}
	
	@RequestMapping("/goInfo")
	public String goInfo() {
		return "info";
	}
	
	@RequestMapping("/goAdmin")
	public String goAdmin() {
		return "admin";
	}
	
	@RequestMapping("/goFindId")
	public String goFindId() {
		return "find_id";
	}
	
	@RequestMapping("/goFindPw")
	public String goFindPw() {
		return "find_pw";
	}
	
	@RequestMapping("/goAdminUser")
	public String goAdminUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("searchColumn");
		session.removeAttribute("searchText");
		return "redirect:/getUser";
	}
	
	@RequestMapping("/goAdminUser2")
	public String goAdminUser2() {
		return "redirect:/getUser";
	}
	
	@RequestMapping("/goAdminComment")
	public String goAdminComment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("searchColumn");
		session.removeAttribute("searchText");
		return "redirect:/getComment";
	}
	
	@RequestMapping("/goAdminComment2")
	public String goAdminComment2() {
		return "redirect:/getComment";
	}
	
	@RequestMapping("/goAdminBoard")
	public String goAdminBoard() {
		return "admin_addBoard";
	}
	
	@RequestMapping("/goAdminBoardList")
	public String goAdminBoardList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("searchColumn");
		session.removeAttribute("searchText");
		return "redirect:/getAdminBoard";
	}
	
	@RequestMapping("/goAdminBoardList2")
	public String goAdminBoardList2() {
		return "redirect:/getAdminBoard";
	}
	
	@RequestMapping("/doJoin")
	public String doJoin(HttpServletRequest request, Model model, @ModelAttribute UserDTO userDTO) {
		HttpSession session = request.getSession();
		
		Map map = (HashMap)session.getAttribute("joinMap");
		
		boolean id = (Boolean)map.get("checkId");
		boolean email = (Boolean)map.get("checkEmail");
		boolean phone = (Boolean)map.get("checkPhone");
		
		if(id == true && email == true && phone == true) {
			mainService.insertUser(userDTO);
			model.addAttribute("msg", "회원가입 되었습니다.");
			model.addAttribute("url", "/test/gomain");
			
			return "alert";
		} else {
			model.addAttribute("msg", "입력된 값이 회원가입 형식에 맞지 않습니다.");
			model.addAttribute("url", "/goJoin_2");
			
			return "alert";
		}
	}
	
	@RequestMapping("/getUser")
	public String getUser(HttpServletRequest request, Model model, UserDTO userDTO) {
		HttpSession session = request.getSession();
		
		//userSeq 필드값이 -1이면 리스트페이지에서 접속한 것으로 판단해서 전체목록, 아니면 유저정보 수정으로 판단해서 유저 한명의 정보만
		if(userDTO.getUserSeq() == -1) {
			
			int pageNum = 1;
			int countPerPage = 5;
			
			String tmp_pageNum = request.getParameter("pageNum");
			
			if(tmp_pageNum != null) {
				try { 
					pageNum = Integer.parseInt(tmp_pageNum);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			// select 5개씩 10개씩 보기 세션에 올려둔 값 판단 (setPerPage)
			String tmp_countPerPage = (String)session.getAttribute("countPerPage");
			
			if(tmp_countPerPage != null) {
				try { 
					countPerPage = Integer.parseInt(tmp_countPerPage);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			Map selectMap = new HashMap();
			
			String searchText = "";
			String tmp_searchText = request.getParameter("searchText");
			
			if(tmp_searchText != null) {
				try { 
					searchText = tmp_searchText;
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			
			if(!("".equals(searchText))) {
				
				selectMap.put("searchColumn", request.getParameter("searchColumn"));
				selectMap.put("searchText", searchText);
				
				session.setAttribute("searchColumn", request.getParameter("searchColumn"));
				session.setAttribute("searchText", searchText);
			} else {
				selectMap.put("searchColumn", session.getAttribute("searchColumn"));
				selectMap.put("searchText", session.getAttribute("searchText"));
			}
			
			selectMap.put("pageNum", pageNum);
			selectMap.put("countPerPage", countPerPage);
			
			Map map = mainService.getUserPage(selectMap);
			
			model.addAttribute("map", map);
			model.addAttribute("pageNum", pageNum);
			
			return "admin_user";
			
		} else {
			userDTO = mainService.getUser(userDTO);
			
			session.setAttribute("updateUserDTO", userDTO);
			
			return "admin_updateUser";
		}
		
	}
	
	@RequestMapping("/doLogin")
	public String doLogin(HttpServletRequest request, Model model, @RequestParam("userId") String userId, @RequestParam("userPw") String userPw) {
		HttpSession session = request.getSession();
		
		Map<String, String> map= new HashMap<String, String>();
		
		map.put("id", userId);
		map.put("pw", userPw);
		
		try {
			UserDTO dto = mainService.doLogin(map);
			
			session.setAttribute("userDTO", dto);
			
			model.addAttribute("msg", dto.getUserName()+"님 환영합니다.");
			model.addAttribute("url", "/test/gomain");
			
			return "alert";
		} catch (NullPointerException e) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "goLogin");
			
			return "alert";
		}
		
	}
	
	@RequestMapping("/doLogout")
	public String doLogout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		model.addAttribute("msg", "로그아웃 하였습니다.");
		model.addAttribute("url", "/test/gomain");
		
		return "alert";
	}
	
	
	// 관리자 페이지에서 개인정보 수정
	@RequestMapping("/updateAdminUser")
	public String updateAdminUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		UserDTO updateUserDTO = (UserDTO)session.getAttribute("updateUserDTO");
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    
		    if(name.equals("userName")) {
		    	updateUserDTO.setUserName(request.getParameter(name));
		    } else if(name.equals("userPw")) {
		    	updateUserDTO.setUserPw(request.getParameter(name));
		    } else if(name.equals("userEmail")) {
		    	updateUserDTO.setUserEmail(request.getParameter(name));
		    } else if(name.equals("userPhone")) {
		    	updateUserDTO.setUserPhone(request.getParameter(name));
		    } else if(name.equals("userId")) {
		    	updateUserDTO.setUserId(request.getParameter(name));
		    } else if(name.equals("gradeSeq")) {
		    	updateUserDTO.setGradeSeq(Integer.parseInt(request.getParameter(name)));
		    } else if(name.equals("genderSeq")) {
		    	updateUserDTO.setGenderSeq(Integer.parseInt(request.getParameter(name)));
		    } else if(name.equals("userBirth")) {
		    	updateUserDTO.setUserBirth(request.getParameter(name));
		    }
		}

		System.out.println(updateUserDTO);
		
		mainService.updateUser(updateUserDTO);
		
		return "redirect:/goAdminUser";
	}
	
	// 내 정보 에서 개인정보수정
	@RequestMapping("/updateUser")
	public String updateUser(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserDTO updateDTO = (UserDTO)session.getAttribute("userDTO");
		
		Enumeration params = request.getParameterNames();
		
		// 파라미터의 키값을 모두 가져와서 각 필드값의 이름과 비교 후 해당하는 그 필드만 수정
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    
		    if(name.equals("userName")) {
		    	updateDTO.setUserName(request.getParameter(name));
		    } else if(name.equals("userPw")) {
		    	updateDTO.setUserPw(request.getParameter(name));
		    } else if(name.equals("userEmail")) {
		    	updateDTO.setUserEmail(request.getParameter(name));
		    } else if(name.equals("userPhone")) {
		    	updateDTO.setUserPhone(request.getParameter(name));
		    }
		}
		
		try {
			mainService.updateUser(updateDTO);
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("msg", "다른 회원이 이미 사용중입니다.");
			model.addAttribute("url", "goInfo");
			
			return "alert";
		} finally {
			Map map = new HashMap();
			
			map.put("id", updateDTO.getUserId());
			map.put("pw", updateDTO.getUserPw());
			
			UserDTO dto = mainService.doLogin(map);
			
			session.setAttribute("userDTO", dto);
		}
		
		return "redirect:/goInfo";
	}
	
	@RequestMapping("/deleteUser")
	public String deleteUser(HttpServletRequest request, Model model) {
		
		Enumeration params = request.getParameterNames();
		
		List list = new ArrayList();
		
		while (params.hasMoreElements()){
			int target = Integer.parseInt((String)params.nextElement());
		    
			list.add(target);
		}
		
		mainService.deleteUser(list);
		
		return "redirect:/getUser";
	}
	
	@RequestMapping("/makeDummy")
	@ResponseBody
	public String makeDummy() {
		mainService.insertDummy(50);
		return "완료";
	}
	
	// 관리자 페이지 유저목록 페이지당 개수
	@RequestMapping("/userSetPerPage")
	public String userSetPerPage(HttpServletRequest request, String countPerPage) {
		HttpSession session = request.getSession();
		
		session.setAttribute("countPerPage", countPerPage);
		
		return "redirect:/goAdminUser2";
	}
	
	@RequestMapping("/commentSetPerPage")
	public String commentSetPerPage(HttpServletRequest request, String countPerPage) {
		HttpSession session = request.getSession();
		
		session.setAttribute("countPerPage", countPerPage);
		
		return "redirect:/goAdminComment2";
	}
	
	@RequestMapping("/setBoardPerPage")
	public String setBoardPerPage(HttpServletRequest request, String countPerPage) {
		HttpSession session = request.getSession();
		
		session.setAttribute("countPerPage", countPerPage);
		
		return "redirect:/goAdminBoardList2";
	}
	
	@RequestMapping("/setBaordType")
	public String setBaordType(HttpServletRequest request, String typeSeq) {
		HttpSession session = request.getSession();
		
		session.setAttribute("typeSeq", typeSeq);
		
		session.removeAttribute("searchColumn");
		session.removeAttribute("searchText");
		return "redirect:/goAdminBoardList";
	}
	
	@RequestMapping("/setBoardRegion")
	public String setBoardRegion(HttpServletRequest request, String regionSeq) {
		HttpSession session = request.getSession();
		
		session.setAttribute("regionSeq", regionSeq);
		session.removeAttribute("searchColumn");
		session.removeAttribute("searchText");
		
		return "redirect:/goAdminBoardList";
	}
	
	@RequestMapping("/findId")
	public String findId(@ModelAttribute UserDTO dto, Model model) {
		//dto 받아서 아이디 결과 페이지에 반환
		//jsp에서 출력
		//System.out.println(dto.toString());
		//null일때는 아이디 찾기 페이지로 돌아옴
		UserDTO data = mainService.findId(dto);
		System.out.println(data);
		if(data == null) {
			model.addAttribute("msg", "유효한 값을 입력해주세요");
			model.addAttribute("url", "goFindId");

			return "alert";
		}else {
			model.addAttribute("dto", data);
			
			return "find_id_2";
		}

	}
	
	@RequestMapping("/findPw")
	public String findPw(HttpServletRequest request, Model model , UserDTO userDTO) {
		
		System.out.println("findPw : "+userDTO);
		UserDTO findUserDTO = mainService.findPw(userDTO);
		
		System.out.println(findUserDTO);
		
		
		if(userDTO.getUserBirth().equals(findUserDTO.getUserBirth())) {
			model.addAttribute("findUserDTO", findUserDTO);
			
			return "find_pw_result";
		} else {
			model.addAttribute("msg", "정보가 일치하지 않습니다.");
			model.addAttribute("url", "goFindPw");
			
			return "alert";
		}
	}
	
	
	@RequestMapping("/checkJoin")
	public String checkJoin(HttpServletRequest request, Model model, UserDTO joinDTO) {
		
		HttpSession session = request.getSession();
		
		String target = request.getParameter("checkTarget");
		
		Map map = (HashMap)session.getAttribute("joinMap");
		
		if(map == null) {
			map = new HashMap();
		}
		
		map.put("target", target);
		map.put("joinDTO", joinDTO);
		
		if("checkId".equals(map.get("target"))) {
			boolean checkId = mainService.checkJoin(map);
			map.put("checkId", checkId);
		} else if("checkEmail".equals(map.get("target"))) {
			boolean checkEmail = mainService.checkJoin(map);
			map.put("checkEmail", checkEmail);
		} else {
			boolean checkPhone = mainService.checkJoin(map);
			map.put("checkPhone", checkPhone);
		}
		
		session.setAttribute("joinMap", map);
		
		return "join_2";
	}
	
	// 지역페이지 메인 리스트
	@RequestMapping("/getBoardList")
	public String getBoardList(HttpServletRequest request, Model model, @RequestParam("regionSeq") String regionSeq) {
		HttpSession session = request.getSession();
		
		Map resultMap = mainService.getBoardList(regionSeq);
		
		List regionNames = mainService.getRegionNames();
		
		int selectRegionSeq = Integer.parseInt(regionSeq);
		
		String regionName = (String) regionNames.get(Integer.parseInt(regionSeq));
		
		// 맵안에 "typeSeq"+i 형식으로 집어넣음
		model.addAttribute("boardListMap", resultMap);
		model.addAttribute("regionSeq", regionSeq);
		model.addAttribute("regionName", regionName);
		
		if(session.getAttribute("userDTO") == null) {
			model.addAttribute("msg", "지역 페이지로 이동하려면 로그인을 해주세요");
			model.addAttribute("url", "goLogin");
			
			return "alert";
		} else {
			return "local_main";
		}
	}
	
	// 지역페이지 더보기 리스트
	@RequestMapping("/localMore")
	public String localMore(HttpServletRequest request, Model model, BoardDTO boardDTO) {
		
		HttpSession session = request.getSession();
		
		int regionSeq = boardDTO.getRegionSeq();
		int typeSeq = boardDTO.getTypeSeq();
		
		int pageNum = 1;
		int countPerPage = 20;
		
		String tmp_pageNum = request.getParameter("pageNum");
		
		if(tmp_pageNum != null) {
			try { 
				pageNum = Integer.parseInt(tmp_pageNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		Map selectMap = new HashMap();
		
		selectMap.put("pageNum", pageNum);
		selectMap.put("countPerPage", countPerPage);
		selectMap.put("regionSeq", regionSeq);
		selectMap.put("typeSeq", typeSeq);
		
		Map map = mainService.getBoardPage(selectMap);
		
		model.addAttribute("map", map);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("regionSeq", regionSeq);
		model.addAttribute("typeSeq", typeSeq);
		
		return "local_more";
	}
	
	// 지역 상세페이지
	@RequestMapping("/getBoardDetail")
	public String getBoardDetail(HttpServletRequest request, Model model, BoardDTO boardDTO) {
		
		BoardDTO dto = mainService.getBoard(boardDTO);
		List list = new ArrayList();
		
		try {
			list = mainService.getCommentList(boardDTO);
		} catch (IndexOutOfBoundsException e) {
			model.addAttribute("boardDTO", dto);
			return "local_detail";
		}
		
		model.addAttribute("boardDTO", dto);
		model.addAttribute("commentList", list);
		
		return "local_detail";
	}
	
	@RequestMapping("/addComment")
	public String addComment(HttpServletRequest request, Model model, CommentDTO commentDTO) {
		
		try {
			mainService.addComment(commentDTO);
			model.addAttribute("boardSeq", commentDTO.getBoardSeq());
			
			return "redirect:/getBoardDetail#commentSection";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("msg", "댓글을 달려면 로그인이 필요합니다.");
			model.addAttribute("url", "getBoardDetail?boardSeq="+commentDTO.getBoardSeq());
			
			return "alert";
		}
		
	}
	
	@RequestMapping("/getComment")
	public String getComment(HttpServletRequest request, Model model, CommentDTO commentDTO) {
		HttpSession session = request.getSession();
		
		// commentSeq 필드값이 -1이면 리스트페이지에서 접속한 것으로 판단해서 전체목록, 아니면 유저정보 수정으로 판단해서 유저 한명의 정보만
		if(commentDTO.getCommentSeq() == -1) {
			
			int pageNum = 1;
			int countPerPage = 5;
			
			String tmp_pageNum = request.getParameter("pageNum");
			
			if(tmp_pageNum != null) {
				try { 
					pageNum = Integer.parseInt(tmp_pageNum);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			// select 5개씩 10개씩 보기 세션에 올려둔 값 판단 (setPerPage)
			String tmp_countPerPage = (String)session.getAttribute("countPerPage");
			
			if(tmp_countPerPage != null) {
				try { 
					countPerPage = Integer.parseInt(tmp_countPerPage);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			Map selectMap = new HashMap();
			
			String searchText = "";
			String tmp_searchText = request.getParameter("searchText");
			
			if(tmp_searchText != null) {
				try { 
					searchText = tmp_searchText;
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			
			if(!("".equals(searchText))) {
				
				selectMap.put("searchColumn", request.getParameter("searchColumn"));
				selectMap.put("searchText", searchText);
				
				session.setAttribute("searchColumn", request.getParameter("searchColumn"));
				session.setAttribute("searchText", searchText);
			} else {
				selectMap.put("searchColumn", session.getAttribute("searchColumn"));
				selectMap.put("searchText", session.getAttribute("searchText"));
			}
			
			selectMap.put("pageNum", pageNum);
			selectMap.put("countPerPage", countPerPage);
			
			Map map = mainService.getCommentPage(selectMap);
			
			model.addAttribute("map", map);
			model.addAttribute("pageNum", pageNum);
			
			
			return "admin_comment";
			
		} 
		else {
			commentDTO = mainService.getComment(commentDTO);
			
			session.setAttribute("updateCommentDTO", commentDTO);
			
			return "admin_updateComment";
		}
		
	}
	
	@RequestMapping("/updateAdminComment")
	public String updateAdminComment(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		CommentDTO updateCommentDTO = (CommentDTO)session.getAttribute("updateCommentDTO");
		
		updateCommentDTO.setCommentText(request.getParameter("commentText"));
		
		mainService.updateComment(updateCommentDTO);
		
		return "redirect:/goAdminComment";
	}
	
	@RequestMapping("/deleteComment")
	public String deleteComment(HttpServletRequest request, Model model) {
		
		Enumeration params = request.getParameterNames();
		
		List list = new ArrayList();
		
		while (params.hasMoreElements()){
			int target = Integer.parseInt((String)params.nextElement());
		    
			list.add(target);
		}
		
		mainService.deleteComment(list);
		
		return "redirect:/goAdminComment";
	}
	
	// 게시물 등록
	@RequestMapping("/addBoard")
		public String addBoard(HttpServletRequest request, Model model, BoardDTO boardDTO) {
		
		System.out.println("addBoard Hi");
		mainService.insertBoard(boardDTO);
		
		return "goAdminBoard";
	}
	
	
	// 관리자 페이지 게시물 리스트출력
	@RequestMapping("/getAdminBoard")
	public String getAdminBoard(HttpServletRequest request, Model model, BoardDTO boardDTO) {
		HttpSession session = request.getSession();
		
		// commentSeq 필드값이 -1이면 리스트페이지에서 접속한 것으로 판단해서 전체목록, 아니면 유저정보 수정으로 판단해서 유저 한명의 정보만
		if(boardDTO.getBoardSeq() == -1) {
			
			int pageNum = 1;
			int countPerPage = 5;
			int typeSeq = 0;
			int regionSeq = 0;
			
			String tmp_pageNum = request.getParameter("pageNum");
			
			if(tmp_pageNum != null) {
				try { 
					pageNum = Integer.parseInt(tmp_pageNum);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			// select 5개씩 10개씩 보기 세션에 올려둔 값 판단 (setPerPage)
			String tmp_countPerPage = (String)session.getAttribute("countPerPage");
			
			if(tmp_countPerPage != null) {
				try { 
					countPerPage = Integer.parseInt(tmp_countPerPage);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}

			// select type값 판단한 후 맵에 담아줌
			String tmp_typeSeq = (String)session.getAttribute("typeSeq");
			
			if(tmp_typeSeq != null) {
				try { 
					typeSeq = Integer.parseInt(tmp_typeSeq);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			// select region값 판단한 후 맵에 담아줌
			String tmp_regionSeq = (String)session.getAttribute("regionSeq");
			
			if(tmp_regionSeq != null) {
				try { 
					regionSeq = Integer.parseInt(tmp_regionSeq);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			Map selectMap = new HashMap();
			
			String searchText = "";
			String tmp_searchText = request.getParameter("searchText");
			
			if(tmp_searchText != null) {
				try { 
					searchText = tmp_searchText;
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			
			if(!("".equals(searchText))) {
				
				selectMap.put("searchColumn", request.getParameter("searchColumn"));
				selectMap.put("searchText", searchText);
				
				session.setAttribute("searchColumn", request.getParameter("searchColumn"));
				session.setAttribute("searchText", searchText);
			} else {
				selectMap.put("searchColumn", session.getAttribute("searchColumn"));
				selectMap.put("searchText", session.getAttribute("searchText"));
			}
			
			
			
			selectMap.put("pageNum", pageNum);
			selectMap.put("countPerPage", countPerPage);
			selectMap.put("typeSeq", typeSeq);
			selectMap.put("regionSeq", regionSeq);
			
			Map map = mainService.getAdminBoardPage(selectMap);
			
			model.addAttribute("map", map);
			model.addAttribute("pageNum", pageNum);
			
			
			return "admin_board";
			
		} 
		else {
			boardDTO = mainService.getAdminBoard(boardDTO);
			
			session.setAttribute("updateBoardDTO", boardDTO);
			
			return "admin_updateBoard";
		}
		
	}
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(HttpServletRequest request, Model model) {
		
		Enumeration params = request.getParameterNames();
		
		List list = new ArrayList();
		
		while (params.hasMoreElements()){
			int target = Integer.parseInt((String)params.nextElement());
		    
			list.add(target);
		}
		
		mainService.deleteBoard(list);
		
		return "redirect:/getAdminBoard";
	}
	
	@RequestMapping("/updateAdminBoard")
	public String updateAdminBoard(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		BoardDTO updateBoardDTO = (BoardDTO)session.getAttribute("updateBoardDTO");
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    
		    if(name.equals("regionSeq")) {
		    	updateBoardDTO.setRegionSeq(Integer.parseInt(request.getParameter("regionSeq")));
		    } else if(name.equals("typeSeq")) {
		    	updateBoardDTO.setTypeSeq(Integer.parseInt(request.getParameter("typeSeq")));
		    } else if(name.equals("boardTitle")) {
		    	updateBoardDTO.setBoardTitle(request.getParameter("boardTitle"));
		    } else if(name.equals("boardAddress")) {
		    	updateBoardDTO.setBoardAddress(request.getParameter("boardAddress"));
		    } else if(name.equals("boardOpen")) {
		    	updateBoardDTO.setBoardOpen(request.getParameter("boardOpen"));
		    } else if(name.equals("boardDetail")) {
		    	updateBoardDTO.setBoardDetail(request.getParameter("boardDetail"));
		    } else if(name.equals("boardBreak")) {
		    	updateBoardDTO.setBoardBreak(request.getParameter("boardBreak"));
		    } else if(name.equals("boardImage")) {
		    	updateBoardDTO.setBoardImage(request.getParameter("boardImage"));
		    }
		}
		mainService.updateBoard(updateBoardDTO);
		
		return "redirect:/goAdminBoardList";
	}
	
	//맛집 등록 접속
	@RequestMapping("/goAddEat")
	public String goAddEat() {
		return "admin_eat_new";
	}
	
	//insert 맛집 등록
		@RequestMapping(value= "/eatResult", method=RequestMethod.POST)
		public String eatResult(
				@RequestParam ("regionSeq") int regionSeq,
				@ModelAttribute BoardDTO dto
				) {	
					mainService.insertBoard(dto);
					// 결과를 jsp로 보낸다
					////등록에서 입력한 값을 목록으로 보냄
					return "forward:/eatResultGo";
		}
		
		//맛집 리스트
		@RequestMapping("/eatResultGo")
		public String eatResultGo(Model model) {
			//db에서 
			//목록을 가지고 오고 
			//어디엔가 담아서 
			//jsp로 보낸다
			//jsp에서 꺼내서 표시한다
			//List list = mainService.getBoardInfoList();
			List list = mainService.getBoardInfoList();
			//이건 모든걸 가져오는거라 안씀
			model.addAttribute("list", list);
			return "admin_eat_management";
		}
		
		//delete 맛집 삭제
		@RequestMapping(value="/adminEatDelete")
		public String admin_eat_delete(
				//@RequestParam ("ck") int[] ck
				HttpServletRequest request
				) {
//			for(int i = 0; i<ck.length; i++) {
//				System.out.println(ck[i]);
//			}
			String[] ck = request.getParameterValues("ck");
//			for(int i = 0; i<ck.length; i++) {
//				System.out.println(ck[i]);		
//			}
			
			List list = new ArrayList();
			
			for(int i = 0; i<ck.length; i++) {
				list.add(ck[i]);
			}
			
			mainService.deleteBoardDTO(list);
			return "forward:/eatResultGo";
		}
		
		//select 맛집 상세페이지
		@RequestMapping(value="/adminEatDetail")
		public String admin_eat_detail(@ModelAttribute BoardDTO dto,
				Model model) {
			//System.out.println(dto.getBoardSeq());
			BoardDTO data = mainService.detailBoardDTO(dto);
			model.addAttribute("dto", data);
			return "admin_eat_update";
		}
		
		//update 맛집 상세 페이지 수정
		@RequestMapping(value="/adminEatUpdate" , method=RequestMethod.POST)
		public String admin_eat_update(@ModelAttribute BoardDTO dto
				) {
			//System.out.println("dto" + dto. toString());
			mainService.updateBoardDTO(dto);
			return "forward:/adminEatDetail";
		}
		
		// 관리자-여행지등록 페이지
		@RequestMapping("/admin_travel_new")
		public String admin_travel_new() {
			return "travel/admin_travel_new";
		}
		
		// 관리자-여행지등록 페이지(제출 후)
		@RequestMapping(value="/travelNew", method=RequestMethod.POST)
		public String travelNew(Model model ,@ModelAttribute BoardDTO dto) {
			System.out.println("dto : " + dto);
//			dto.setUserSeq(24);
			dto.setTypeSeq(0);
		
			mainService.travelNew(dto);
			
			List travelList = mainService.travelList();
			
			model.addAttribute("travelList", travelList);
			
			return "/travel/admin_travel_management";
		}
		
		// 관리자-여행지관리 페이지(목록)
		@RequestMapping("/travelList")
		public String travelList(Model model) {
			System.out.println("/travelList");
			List travelList = mainService.travelList();
			model.addAttribute("travelList", travelList);
			
			return "/travel/admin_travel_management";
		}
		
		// 관리자-여행지관리 페이지(수정전 리스트조회)
		@RequestMapping("/travelUpdate")
		public String travelUpdate(BoardDTO dto, Model model) {
			System.out.println("/travelUpdate");
			
			BoardDTO beforeUpdate = mainService.travelUpdate(dto);
			model.addAttribute("beforeUpdate", beforeUpdate);
			return "/travel/admin_travel_update";
		}
		
		// 관리자-여행지관리 페이지(수정)
		@RequestMapping("/travelBoardUpdate")
		public String travelBoardUpdate(BoardDTO dto, Model model) {
			System.out.println("/travelBoardUpdate");
			System.out.println("dto : " + dto);
			mainService.setBoard(dto);
			
			BoardDTO beforeUpdate = mainService.travelUpdate(dto);
			model.addAttribute("beforeUpdate", beforeUpdate);
			
			return "/travel/admin_travel_update";
		}
		
		// 관리자-여행지관리 페이지(삭제)
		@RequestMapping("/travelDelete")
		public String travelDelete(HttpServletRequest request, Model model) {
			String[] boardDelete = request.getParameterValues("boardDelete");
			for(int i=0; i<boardDelete.length; i++) {
				System.out.println("boardDelete[" + i + "] : " + boardDelete[i]);
			}
			mainService.travelDelete(boardDelete);
			List travelList = mainService.travelList();
			model.addAttribute("travelList", travelList);
			return "/travel/admin_travel_management";
		}
		
		// 관리자-여행지관리 페이지(검색)
		@RequestMapping("/boardPick")
		public String boardPick(BoardDTO dto, Model model) {
			System.out.println("/boardPick 실행");
			System.out.println("boardPick() --> dto 실행 : " + dto);
			List boardPick = null;
			if(dto.getBoardSearch() != null && dto.getTypeSeq() == 0) {
				if(dto.getBoardPick() == 0) {
					boardPick = mainService.boardPick1(dto);
					System.out.println("검색셀렉트 출력 : " + boardPick);
				}else if(dto.getBoardPick() == 1) {
					boardPick = mainService.boardPick2(dto);
					System.out.println("검색셀렉트 출력 : " + boardPick);
				}else if(dto.getBoardPick() == 2) {
					boardPick = mainService.boardPick3(dto);
					System.out.println("검색셀렉트 출력 : " + boardPick);
				}else if(dto.getBoardPick() == 3) {
					boardPick = mainService.boardPick4(dto);
					System.out.println("검색셀렉트 출력 : " + boardPick);
				}else {
					boardPick = mainService.travelList();
				}
			}
			
			model.addAttribute("travelList", boardPick);
			
			return "/travel/admin_travel_management";
		
		}
		
		@RequestMapping("/goAdmin_room_new")
		public String goAdmin_room_new() throws Exception{
			return "room/admin_room_new";
		}
		
		@RequestMapping("/goAdmin_room_management")
		public String pagingAdmin_room(HttpServletRequest request, Model model, BoardDTO boardDTO) {
			
//			List<BoardDTO> list = mainService.list(); 
//			model.addAttribute("just", list);
			System.out.println("BoardDTO boardDTO 입니다 : " + boardDTO);
			int pageNum = 1;
			int countPerPage = 10;
			
			String tmp_pageNum = request.getParameter("pageNum");
			if(tmp_pageNum != null) {
				try {
					pageNum = Integer.parseInt(tmp_pageNum);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			String tmp_countPerPage = request.getParameter("countPerPage");
			
			if(tmp_countPerPage != null) {
				try {
					countPerPage = Integer.parseInt(tmp_countPerPage);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
					
			Map map = mainService.pageBoard(pageNum, countPerPage);
			map.put("pageNum", pageNum);
			map.put("countPerPage", countPerPage);
			
			model.addAttribute("data", map);
			
//			return map;
			return "room/admin_room_management";
		}
		
		@RequestMapping("/updatePage")
		public String updateAdmin_page(BoardDTO boardDTO, Model model) {
			
			BoardDTO updatePage = mainService.updatePage(boardDTO);
			System.out.println("updatePage : " + updatePage);
			
			model.addAttribute("updatePage", updatePage);
			
			return "room/admin_room_update";
		}
		
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		@ResponseBody // 리턴값을 그대로 돌려주는 역할 / jsp로 안보냄
		public int deleteAdmin_room(HttpServletRequest request) {
			// 스트링을 받을 순 있지만 리턴할때는 인트로 그걸 세서 보내야됨
			String[] delete = request.getParameterValues("valueArr"); // 체크된 값들을 넣음
			int size = delete.length;
			int delreturn = 0;
			
			for(int i =0; i<size; i++) {
				delreturn += mainService.deleteBoard(delete[i]);

			}		
//				System.out.println("delreturn : " + delreturn);	
			return delreturn;
		}
		
		
		// 팝업 쿠키생성 만들어놓음
		@RequestMapping("/popupCookie")
		public String popupCookie(HttpServletResponse response, @RequestParam("target") String target) {
			Cookie cookie = new Cookie(target, "setChecked");
			cookie.setMaxAge(10); 
			response.addCookie(cookie);
			
			return "redirect:/";
		}
		
		@RequestMapping("/adminPopup")
		public String adminPopup(Model model) {
			List popup = mainService.popup1();
			model.addAttribute("popup", popup);
			return "/popup/admin_popup";
		}
		
		// 관리자 - 팝업관리 페이지(수정전 리스트조회)
		@RequestMapping("/popupReadyUpdate")
		public String popupReadyUpdate(@RequestParam Map map, Model model) {
			System.out.println("/popupReadyUpdate Controller 실행");
			System.out.println("map : " + map);
			Map popupUpdateList = mainService.popupReadyUpdate(map);
			model.addAttribute("updateList", popupUpdateList);
			return "/popup/admin_popup_update";
		}
		
		// 관리자 - 팝업관리 페이지(수정)
		@RequestMapping("/popupUpdate")
		public String popupUpdate(@RequestParam Map map, Model model) {
			System.out.println("popupUpdate(map) Controller 실행 : " + map);
			
			mainService.popupUpdate(map);
			
			return "redirect:/adminPopup";
		}
}
