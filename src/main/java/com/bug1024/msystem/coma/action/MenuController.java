package com.bug1024.msystem.coma.action;

import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.MenuService;
import com.bug1024.msystem.coma.service.impl.ImpMenuService;
import com.bug1024.msystem.utils.mymvc.ModelAndView;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class MenuController {


    private MenuService service = new ImpMenuService();
    @RequestMapping("menuList.do")
    @ResponseBody
    public List<Menu> menuList(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("UTF-8");
        List<Menu> menus = service.getMenus();
        return menus;
    }



    @RequestMapping("addMenu.do")
    @ResponseBody
    public Menu addMenu(@Param("mname") String mname, @Param("mhref") String mhref, @Param("mtarget") String mtarget, @Param("pno") Integer pno){
        service.addMenu(mname,mhref,mtarget,pno);
        return service.selectMenuByMname(mname);
    }

    @RequestMapping("deleteMenu.do")
    public void deleteMenu(@Param("mno") Integer mno){
        service.deleteMenuById(mno);
    }

    @RequestMapping("giveRoleToUser.do")
    public ModelAndView giveRoleToUser(@Param("uno") Integer uno){
        ModelAndView mv = new ModelAndView();
        mv.addAttribute("uno",uno);
        mv.setViewName("giveRoleToUser.jsp");
        return  mv;
    }

    @RequestMapping("selectRoleWithUser.do")
    @ResponseBody
    public List<Role> selectRoleWithUser(@Param("uno") Integer uno){
        return service.selectRoleWithUser(uno);
    }

    @RequestMapping("selectNoRoleWithUser.do")
    @ResponseBody
    public List<Role> selectNoRoleWithUser(@Param("uno") Integer uno){
        return service.selectNoRoleWithUser(uno);
    }


    @RequestMapping("saveRoleForUser.do")
    public void saveRoleForUser(@Param("rnos") String rnos,@Param("uno") Integer uno){
        System.out.println(rnos);
        service.deleteRoleForUserByUserId(uno);
        String[] rnoArray = rnos.split(",");
        for (String rno:rnoArray){
            service.addRoleForUserById(uno,new Integer(rno));
        }
    }
}
