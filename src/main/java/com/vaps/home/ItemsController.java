package com.vaps.home;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.vaps.action.ItemsListAction;
import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;


/**
 * 세션은 HomeController.session 으로 쓰세요
 */
@Controller
@SessionAttributes("members")
public class ItemsController{
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;

//--------------------------------------------------------------
// 판매물품 관리 itemslist

	// db 업로드를 이용해 상품 이미지를 저장하고 불러올 수 있어야 한다.
	@RequestMapping(value = "/itemslist")
	public String itemslist(HttpServletRequest request, Model model) throws Exception {
		// 상품 목록
		String result = "home";

		try {
			ItemsListAction item = new ItemsListAction(itemsDAO);
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
				model.addAttribute("ilist", item.getItemsList());
				result = "items/itemslist";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/itemsUploadForm")
	public String itemsUploadForm(){
		// 상품 등록 폼 이동
		return "items/itemsUpload";
	}
	@RequestMapping(value = "/itemsUpload")
	public void itemsUpload(HttpServletRequest req, Model model, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8"); 
			ItemsListAction item = new ItemsListAction(itemsDAO);
			Items items = new Items();
			
			// fileUpload setting
			String uploadPath = req.getRealPath("/upload");
			int fileSize = 10*1024*1024; // 10Mbyte
			
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
				
				// fileUpload logic
				MultipartRequest multi=new MultipartRequest(req,
															uploadPath,
															fileSize,
															"utf-8",
															new DefaultFileRenamePolicy());
				Enumeration files=multi.getFileNames();
				String file=(String)files.nextElement();
				String fileName=multi.getFilesystemName(file);
				String fileOriginalName=multi.getOriginalFileName(file);
				
				//System.out.println(fileName); //서버에 저장되는 이름
				//System.out.println(fileOriginalName); // 업로드될 파일 이름

				// 상품정보 items객체에 저장
				items.setIs_name(multi.getParameter("i_name"));
				items.setI_name(multi.getParameter("i_name")); //상품이름
				items.setI_category(multi.getParameter("i_category")); //카테고리
				items.setI_price(Integer.parseInt(multi.getParameter("i_price"))); //가격
				items.setIs_count(Integer.parseInt(multi.getParameter("is_count")));// 재고수량
				items.setI_description(multi.getParameter("i_description"));// 설명(제품설명)
				items.setI_pic(fileName);// 이미지

				PrintWriter out = res.getWriter();
				if (item.setItems(items) == 1) { //insert
					item.setItemsTored(items); //재고 등록
					out.println("<script>");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				} else { //failed
					out.println("<script>");
					out.println("alert('상품등록 실패')");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/itemsContentsForm")
	public String itemsContentsForm(HttpServletRequest request, Model model) {
		// 상품 상세 보기
		HomeController.session = request.getSession();
		ItemsListAction item = new ItemsListAction(itemsDAO);
		try {
			request.setCharacterEncoding("UTF-8");
			if (HomeController.session != null && HomeController.session.getAttribute("id") != "") {
				String i_name = request.getParameter("str");
				model.addAttribute("ilist", item.getContents(i_name)); // 원글 보기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "items/itemsContent";
	}
	
}
