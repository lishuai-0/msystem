package com.bug1024.msystem.coma.action;

import com.bug1024.msystem.coma.domain.User;
import com.bug1024.msystem.coma.service.UserService;
import com.bug1024.msystem.coma.service.impl.ImpUserService;
import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.utils.SelfSendEmail;
import com.bug1024.msystem.utils.mymvc.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.*;
import sun.applet.resources.MsgAppletViewer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

@SessionAttributes({"loginUser"})
public class UserController {

    UserService userService = new ImpUserService();

    //用户登录
    @RequestMapping("login.do")
    public ModelAndView login(@Param("uname")String uname, @Param("upass") String upass){
        User user = userService.login(uname,upass);
        ModelAndView modelAndView = new ModelAndView();
        if (user!=null){//登录成功
            modelAndView.addAttribute("loginUser",user);
            modelAndView.setViewName("main.jsp");
        }else{//登录失败
            modelAndView.setViewName("index.jsp");
            modelAndView.addAttribute("mesg","0");

        }
        return modelAndView;
    }
    //用户退出
    @RequestMapping("quit.do")
    @ResponseBody
    public ModelAndView quit(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index.jsp");
        return modelAndView;
    }

    @RequestMapping("getMsg.do")
    public String getMsg(HttpServletRequest request){
        String name = request.getParameter("name");
        User user = userService.selectOneByName(name);
        String MSG = SelfSendEmail.sendMsg(user.getEmail(),6);
        request.getSession().setAttribute("MSG", MSG);
        request.getSession().setAttribute("name", name);
        return  null;
    }
    @RequestMapping("modifyPassword.do")
    @ResponseBody
    public String modifyPassword(HttpServletRequest request){
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        System.out.println(name);
        String MSG = (String) session.getAttribute("MSG");
        String msg = request.getParameter("msg");
        if (MSG!=null&&msg!=null){
            if (MSG.equals(msg)){
                String password = request.getParameter("password");
                User user = userService.selectOneByName(name);
                user.setUpass(password);
                userService.updatePass(user);
                session.invalidate();
                return "/index.jsp";
            }else {
                return "验证码错误";
            }
        }else{

        }
        return "系统错误";

    }
    //展示用户拥有的菜单表
    @RequestMapping("getMenusByUno.do")
    @ResponseBody
    public List<Menu> getMenusByUno(@Param("uno") Integer uno){
        return userService.getMenusByUno(uno);
    }


    //展示用户列表
    @RequestMapping("userList.do")
    public ModelAndView userList(){
        List<User> list=  userService.userList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addAttribute("userList",list);
        modelAndView.setViewName("userList.jsp");
        return modelAndView;
    }
    //新增用户
    @RequestMapping("userAdd.do")
    @ResponseBody
    public String userAdd(User user){
        userService.userAdd(user);
        return "添加成功";
    }
    //编辑用户，修改用户信息
    @RequestMapping("userEdit.do")
    public ModelAndView userEdit(@Param("uno")Integer uno){
        User user = userService.selectOne(uno);
        ModelAndView mv = new ModelAndView();
        mv.addAttribute("user",user);
        mv.setViewName("userEdit.jsp");
        return mv;
    }

    //更新用户信息
    @RequestMapping("userUpdate.do")
    @ResponseBody
    public String userUpdate(User user){
        userService.userUpdate(user);
        return "保存成功";
    }

    //删除一个用户
    @RequestMapping("userDelete.do")
    @ResponseBody
    public String userDelete(@Param("uno") Integer uno){
        userService.userDelete(uno);
        return "删除成功";
    }

    //删除一堆用户
    @RequestMapping("usersDelete.do")
    @ResponseBody
    public String usersDelete(@Param("unos") String unos){
        String[] unoList = unos.split("-");
        for (String uno:unoList){
            userService.userDelete(new Integer(uno));
        }
        return "批量删除成功";
    }

    @RequestMapping("Food.do")
    public String Food(){
        return "Food.jsp";
    }

    @RequestMapping("fileModelDownload.do")
    @ResponseBody
    public String fileModelDownload(HttpServletRequest request, HttpServletResponse response){

        InputStream is=null;
        OutputStream op = null;
        try {
            is = new FileInputStream("E:\\个人文件\\js练习库\\msystem\\src\\main\\webapp\\files\\users.xls");
            response.setHeader("Content-Disposition", "attachment;filename=users.xls");
            op = response.getOutputStream();
            byte[] b = new byte[1024];
            //读取文件内容相应给客户端
            int len;
            while((len = is.read(b))!=-1){
                op.write(b,0,len);
            }
            op.flush();
            is.close();
            op.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "模板下载成功";
    }

    //通过文件导入用户
    @RequestMapping("uploadFile.do")
    @ResponseBody
    public String uploadFile(HttpServletRequest request){
        try {
            DiskFileItemFactory ds  = new DiskFileItemFactory();
            ServletFileUpload fp = new ServletFileUpload(ds);
            List<FileItem>  fileItems = fp.parseRequest(request);
            for (FileItem fileItem:fileItems){
                    System.out.println("是一个文件");
                    //获得输入流，通过jvm读取文件内容
                    InputStream is = fileItem.getInputStream();
                    Workbook wb = WorkbookFactory.create(is);
                    Sheet sheet = wb.getSheetAt(0);
                    for (int i=1;i<sheet.getLastRowNum()+1;i++){
                        Row row = sheet.getRow(i);
                        Cell c1 = row.getCell(0);
                        Cell c2 = row.getCell(1);
                        Cell c3 = row.getCell(2);
                        Cell c4 = row.getCell(3);
                        Cell c5 = row.getCell(4);
                        Cell c6 = row.getCell(5);
                        Cell c7 = row.getCell(6);
                        Cell c8 = row.getCell(8);
                        Integer uno = null;
                        String uname = c1.getStringCellValue();
                        String upass = (int)c2.getNumericCellValue()+"";
                        String trueName = c3.getStringCellValue();
                        Integer age = (int) c4.getNumericCellValue();
                        String sex = c5.getStringCellValue();
                        String phone = (int)c6.getNumericCellValue()+"";
                        String email = c7.getStringCellValue();;
                        String yl2 = null;
                        email = c7.getStringCellValue();
                        if(c8!=null){
                            yl2 = c8.getStringCellValue();
                        }
                        User user = new User(null,uname,upass,trueName,age,sex,phone,email,yl2);
                        userService.userAdd(user);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "用户批量导入成功";

    }






    //    @RequestMapping("uploadFile.do")
//    @ResponseBody
//    public String uploadFile(HttpServletRequest request){
//        try {
//            DiskFileItemFactory ds  = new DiskFileItemFactory();
//            ServletFileUpload fp = new ServletFileUpload(ds);
//            List<FileItem>  fileItems = fp.parseRequest(request);
//            for (FileItem fileItem:fileItems){
//                System.out.println("是一个文件");
//                //获得输入流，通过jvm读取文件内容
//                InputStream is = fileItem.getInputStream();
//                Workbook wb = WorkbookFactory.create(is);
//                Sheet sheet = wb.getSheetAt(0);
//                for (int i=4;i<sheet.getLastRowNum();i++){
//                    Row row = sheet.getRow(i);
//                    Cell c1 = row.getCell(4);
//                    Double acount  = (double)c1.getNumericCellValue();
//                    System.out.println(acount+"-------");
//                }
//                FileOutputStream fos = new FileOutputStream("E:\\user1.xls");
//                wb.write(fos);
//
//            }
//        } catch (FileUploadException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "用户批量导入成功";
//
//    }
//
//

}
