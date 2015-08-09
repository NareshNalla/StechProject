package com.sminds.userservice.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sminds.loginservice.login.utils.LoginLogger;
import com.sminds.userservice.service.UserSevice;
import com.sminds.userservice.vo.FileUploadForm;
import com.sminds.userservice.vo.User;
import com.sminds.userservice.vo.ImagePojo;

@Controller
public class UserController {


	@Autowired
	private UserSevice us;
	private Logger log = LoginLogger.getLogger();

	@RequestMapping(value="/users.spring", method=RequestMethod.GET)
	public ModelAndView userHome(HttpServletRequest req,WebRequest wr)throws Exception{
		log.debug("UserController.userHome");

		String pageNos=(String)req.getParameter("pageNo");
		List<ImagePojo> l=us.userGroup();
		int size=l.size();
		int i=(int)Math.ceil(size/5.0);
		wr.setAttribute("pageNos", pageNos,wr.SCOPE_SESSION);
		wr.setAttribute("l", l, wr.SCOPE_SESSION);
		wr.setAttribute("i", i, wr.SCOPE_SESSION);
		System.out.println(i);

		int pageNo=Integer.parseInt(pageNos);
		if(pageNo>1){
			if(pageNo>i){
				pageNo=i;
			}}

		System.out.println(size);
		int start=pageNo-1;

		int first=(start*5);
		int last=first+5;

		if(last>size){
			last=size;
		}
		if(pageNo==1){

			System.out.println(size);
			List<ImagePojo> ll=l.subList(0, last);
			System.out.println("retrning users.jsp");
			return new ModelAndView("users","grouplist",ll);
		}
		List<ImagePojo> ll=l.subList(first, last);
		System.out.println("retrning users.jsp");
		return new ModelAndView("users","grouplist",ll);

	}
	/*
	 * @ Pagination for getting very first page
	 */

	@RequestMapping(value="/users.spring",params="operation=first", method=RequestMethod.GET)
	public ModelAndView userHomeFirst(HttpSession hs){
		log.debug("UserController.userHome");
		/*List<UserGroup> l=us.userGroup();*/
		List<ImagePojo> l =(List<ImagePojo>) hs.getAttribute("l");
		int size=l.size();
		System.out.println(size);
		List<ImagePojo> ll=l.subList(0, (size+5)-size);
		System.out.println("retrning users.jsp");
		return new ModelAndView("users","grouplist",ll);

	}
	/*
	 * @ Pagination for getting Last page
	 */
	@RequestMapping(value="/users.spring",params="operation=last", method=RequestMethod.GET)
	public ModelAndView userHomeLast(HttpSession hs){
		log.debug("UserController.userHome");
		/*List<UserGroup> l=us.userGroup();*/
		List<ImagePojo> l =(List<ImagePojo>) hs.getAttribute("l");
		int size=l.size();
		System.out.println(size);
		List<ImagePojo> ll=l.subList(size-5, size);
		System.out.println("retrning users.jsp");
		return new ModelAndView("users","grouplist",ll);
	}
	/*
	 * @ editing groupName
	 */
	@RequestMapping(value="/groupnameedit.spring",method=RequestMethod.GET)
	public ModelAndView userGroupnameEdit(String gname,String oldname){
		log.debug("UserController.userGroupnameEdit");
		boolean flag=us.userGroupnameEdit(gname,oldname);

		if(flag){
			return new ModelAndView("editgroupname_s");
		}
		return new ModelAndView("update_f");

	}
	/**
	 * 
	 *for adding a usergroup name
	 *
	 */
	@RequestMapping(value="/addgroupname.spring",method=RequestMethod.GET)
	public ModelAndView userGroupnameAdd(ImagePojo u){
		log.debug("UserController.userGroupnameAdd");
		boolean flag=us.userGroupnameAdd(u);

		if(flag){
			return new ModelAndView("redirect:/users.spring?pageNo=1");
		}
		return new ModelAndView("add_f");

	}
	/*
	 * @ deleting group
	 */
	@RequestMapping(value="/groupnamedelete.spring",method=RequestMethod.GET)
	public ModelAndView userGroupnameDeletet(String gname,HttpSession hs){
		log.debug("UserController.userGroupnameDeletet");
		String i=(String)hs.getAttribute("pageNos");
		boolean flag=us.userGroupnameDelete(gname);
		if(flag){
			/*return new ModelAndView("users");*/
			return new ModelAndView("redirect:/users.spring?pageNo="+i);
		}
		return new ModelAndView("delete_f");
	}

	@RequestMapping(value="/groupnamesearch.spring",method=RequestMethod.GET)
	public ModelAndView userGroupnameSearch(HttpServletRequest req,HttpServletResponse res,WebRequest wr){
		log.debug("UserController.userGroupnameSearch");

		String pageNos="1";
		String gname=(String)req.getParameter("gname");

		pageNos=(String)req.getParameter("pageNo");
		List<ImagePojo> l=us.userGroupnameSearch(gname);
		int size=l.size();
		int i=(int)Math.ceil(size/5.0);
		wr.setAttribute("l", l, wr.SCOPE_SESSION);
		wr.setAttribute("i", i, wr.SCOPE_SESSION);
		System.out.println(i);
		if(pageNos==null){
			pageNos="1";			
		}
		int pageNo=Integer.parseInt(pageNos);
		if(pageNo==0){
			pageNo=1;
		}

		System.out.println(size);
		int start=pageNo-1;

		int first=(start*5);
		int last=first+5;
		if(pageNo>1){
			if(pageNo>i){
				pageNo=i;

			}}
		if(last>size){
			last=size;
		}
		if(pageNo==1){


			System.out.println(size);
			List<ImagePojo> ll=l.subList(0, last);
			System.out.println("retrning users.jsp");
			return new ModelAndView("search","grouplist",ll);
		}
		List<ImagePojo> ll=l.subList(first, last);
		System.out.println("retrning users.jsp");
		return new ModelAndView("search","grouplist",ll);

	}
	

	@RequestMapping(value="/users_AddUser.spring",method=RequestMethod.GET)
	public ModelAndView addUserTOGroupForm(User u){
		System.out.println("UserController.addUserTOGroup");

		return new ModelAndView("users_AddUser");

	}
	
	
	@RequestMapping(value="/addUser.spring",method=RequestMethod.POST)
	public ModelAndView addUserTOGroup(User u){
		System.out.println("UserController.addUserTOGroup");
		int flag=us.addUserToGroup(u);
		if(flag>=0)
			log.debug("sucesss emails added is :"+flag);
		return new ModelAndView("redirect:/userlist.spring?pageNo=1");		
	}
	@RequestMapping(value="/userlist.spring", method=RequestMethod.GET)
	public ModelAndView userList(HttpServletRequest req,WebRequest wr)throws Exception{
		log.debug("UserController.userHome");

		String pageNos=(String)req.getParameter("pageNo");
		List<User> ul=us.userList();
		int size=ul.size();
		int i=(int)Math.ceil(size/5.0);
		wr.setAttribute("pageNos", pageNos,wr.SCOPE_SESSION);
		wr.setAttribute("ul", ul, wr.SCOPE_SESSION);
		wr.setAttribute("i", i, wr.SCOPE_SESSION);
		System.out.println(i);

		int pageNo=Integer.parseInt(pageNos);

		System.out.println(size);
		int start=pageNo-1;

		int first=(start*5);
		int last=first+5;
		if(pageNo>1){
			if(pageNo>i){
				pageNo=i;

			}}
		if(last>size){
			last=size;
		}
		if(pageNo==1){

			System.out.println(size);
			List<User> ll=ul.subList(0, last);
			System.out.println("retrning user_List.jsp");
			return new ModelAndView("user_List","userlist",ll);
		}
		List<User> ll=ul.subList(first, last);
		System.out.println("retrning user_List.jsp");
		return new ModelAndView("user_List","userlist",ll);
	}
	@RequestMapping(value="/userdelete.spring",method=RequestMethod.GET)
	public ModelAndView userDeletet(String uid,HttpSession hs){
		log.debug("UserController.userDeletet");

		boolean flag=us.userDeletet(uid);
		if(flag){

			return new ModelAndView("redirect:/userlist.spring?pageNo=1");
		}
		return new ModelAndView("delete_f");
	}
	
	/**
	 * Group wise extracting
	 */
	@RequestMapping(value="/userlistbygroup.spring", params={"groupname"},method=RequestMethod.GET)
	public ModelAndView userListbygroup(HttpServletRequest req,WebRequest wr)throws Exception{
		log.debug("UserController.userListbygroup");
		String pageNos="1";
		String name=req.getParameter("groupname");
		System.out.println("UserController.userListByGroup"+name);
		
	    pageNos=(String)req.getParameter("pageNo");
		List<User> ulg=us.userListByGroup(name);
		
		int size=ulg.size();
		int i=(int)Math.ceil(size/5.0);
		wr.setAttribute("pageNos", pageNos,wr.SCOPE_SESSION);
		wr.setAttribute("ulg", ulg, wr.SCOPE_SESSION);
		wr.setAttribute("i", i, wr.SCOPE_SESSION);
		System.out.println(i);
		
		
		if(pageNos==null){
			pageNos="1";			
		}
		int pageNo=Integer.parseInt(pageNos);
		if(pageNo==0){
			pageNo=1;
		}

		System.out.println(size);
		int start=pageNo-1;

		int first=(start*5);
		int last=first+5;
		if(pageNo>1){
			if(pageNo>i){
				pageNo=i;

			}}
		if(last>size){
			last=size;
		}
		if(pageNo==1){

			System.out.println(size);
			List<User> ll=ulg.subList(0, last);
			System.out.println("retrning user_List.jsp");
			return new ModelAndView("user_List","userlist",ll);
		}
		List<User> ll=ulg.subList(first, last);
		System.out.println("retrning group wise list user_List.jsp");
		return new ModelAndView("user_List","userlist",ll);
	}
	
	@RequestMapping(value="/importuser.spring",method=RequestMethod.GET)
	public ModelAndView importUser(User u){
		System.out.println("UserController.importUser");

		return new ModelAndView("user_import");

	}
	@RequestMapping(value="/importuserdetails.spring",method=RequestMethod.POST)
	public ModelAndView importUserDetails(@ModelAttribute("uploadForm") FileUploadForm uploadForm,
			Model map, @RequestParam("file") MultipartFile file){
		System.out.println("UserController.importUserDetails");
		
		MultipartFile multipartFile = uploadForm.getFile();

		String fileName = "";
			
		if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
 
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File("C:/ABC"+ File.separator + "tmpFiles");
                System.out.println("FileSeparetor"+File.separator);
                if (!dir.exists())
                    dir.mkdirs();
 
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + "import.csv");
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
 
               
            } catch (Exception e) {
            	e.printStackTrace();
            }
        } /*else {
                        
        }*/
	 
    	if (multipartFile != null) {
			fileName = multipartFile.getOriginalFilename();

		}
		map.addAttribute("files", fileName);

		String csvFile = "C:/ABC/tmpFiles/import.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
	 
		try {
	 
			br = new BufferedReader(new FileReader(csvFile));
			while ((line = br.readLine()) != null) {
	 
			    // use comma as separator
				String[] country = line.split(cvsSplitBy);
				
				
		System.out.println("UserController.addUserTOGroup");
		int flag=us.importUserTOGroup(country);
		if(flag>=0)
			log.debug("sucesss emails added is :"+flag);
		
	 	 
			}
	 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	 
		System.out.println("Done");
		
		return new ModelAndView("redirect:/userlist.spring?pageNo=1");
	}
	
	/**
	 * user mail search
	 */
	@RequestMapping(value="/usermailsearch.spring",method=RequestMethod.GET)
	public ModelAndView userMailSearch(HttpServletRequest req,HttpServletResponse res,WebRequest wr){
		log.debug("UserController.userMailSearch");

		String pageNos="1";
		String email=(String)req.getParameter("email");

		pageNos=(String)req.getParameter("pageNo");
		List<User> l=us.userMailSearch(email);
		int size=l.size();
		int i=(int)Math.ceil(size/5.0);
		wr.setAttribute("ul", l, wr.SCOPE_SESSION);
		wr.setAttribute("ui", i, wr.SCOPE_SESSION);
		System.out.println(i);
		if(pageNos==null){
			pageNos="1";			
		}
		int pageNo=Integer.parseInt(pageNos);
		if(pageNo==0){
			pageNo=1;
		}

		System.out.println(size);
		int start=pageNo-1;

		int first=(start*5);
		int last=first+5;
		if(pageNo>1){
			if(pageNo>i){
				pageNo=i;

			}}
		if(last>size){
			last=size;
		}
		if(pageNo==1){


			System.out.println(size);
			List<User> ull=l.subList(0, last);
			System.out.println("retrning users.jsp");
			return new ModelAndView("searchuser","ugrouplist",ull);
		}
		List<User> ull=l.subList(first, last);
		System.out.println("retrning users.jsp");
		return new ModelAndView("searchuser","ugrouplist",ull);

	}
}
