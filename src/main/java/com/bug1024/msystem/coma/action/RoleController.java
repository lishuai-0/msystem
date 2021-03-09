package com.bug1024.msystem.coma.action;

import com.alibaba.fastjson.JSONObject;
import com.bug1024.msystem.coma.domain.Menu;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.RoleService;
import com.bug1024.msystem.coma.service.impl.ImpRoleService;
import com.bug1024.msystem.utils.mymvc.ModelAndView;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class RoleController {

    private RoleService roleService = new ImpRoleService();

    @RequestMapping("roleDeletePlus.do")
    @ResponseBody
    public String roleDeletePlus(@Param("rno") Integer rno, HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        roleService.delete(rno);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }



    @RequestMapping("roleListPlus.do")
    @ResponseBody
    public String roleListPlus(@Param("page") Integer page, @Param("limit") Integer limit,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        Integer nowPage = page;
        if (page==null){
            nowPage = 1;
        }
        if (limit==null){
            limit = 5;
        }
        Integer total=roleService.getAllNum(null,null,null);
        List<Role> roleList = roleService.roleList(nowPage,limit,null,null,null);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("count",total);
        jsonObject.put("data",roleList);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


    @RequestMapping("giveMenuToRoles.do")
    public ModelAndView giveMenuToRoles(@Param("rno") Integer rno){
        ModelAndView mv = new ModelAndView();
        mv.addAttribute("rno",rno);
        mv.setViewName("giveMenuToRoles.jsp");
        return mv;
    }

    @RequestMapping("getRoleList.do")
    @ResponseBody
    public List<Role> getRoleList(@Param("nowPage") Integer nowPageParam, @Param("rowNum") Integer rowNumParam, @Param("rno") Integer rnoParam,
                                  @Param("rname") String rnameParam, @Param("description") String descriptionParam){
        Integer nowPage = nowPageParam;
        Integer rowNum = rowNumParam;
        Integer rno = rnoParam;
        String rname = rnameParam;
        String description = descriptionParam;
        if (nowPageParam==null){
            nowPage = 1;
        }
        if (rowNum==null){
            rowNum = 5;
        }
        Integer total=roleService.getAllNum(rno,rname,description);
        Integer sumPage = total/rowNum;
        if(total%rowNum!=0){
            sumPage++;
        }
        List<Role> roleList = roleService.roleList(nowPage,rowNum,rno,rname,description);
        return roleList;
    }

    @RequestMapping("saveMenusForRole.do")
    public void saveMenusForRole(@Param("rno") Integer rno,@Param("mnos") String mnos){
        roleService.deleteMenusForRole(rno);
        String[] mnoArray = mnos.split(",");
        for (String mno:mnoArray){
            roleService.saveMenusForRole(rno,new Integer(mno));
        }
    }

    @RequestMapping("selectNoMenusByRoleId.do")
    @ResponseBody
    public List<Menu> selectNoMenusByRoleId(@Param("rno") Integer rno){
        return  roleService.selectNoMenusByRoleId(rno);
    }
    @RequestMapping("selectMenusByRoleId.do")
    @ResponseBody
    public List<Menu> selectMenusByRoleId(@Param("rno") Integer rno){
        return roleService.selectMenusByRoleId(rno);
    }

    @RequestMapping("roleList.do")
    public ModelAndView roleList(@Param("nowPage") Integer nowPageParam,@Param("rowNum") Integer rowNumParam,@Param("rno") Integer rnoParam,
                         @Param("rname") String rnameParam,@Param("description") String descriptionParam){
        Integer nowPage = nowPageParam;
        Integer rowNum = rowNumParam;
        Integer rno = rnoParam;
        String rname = rnameParam;
        String description = descriptionParam;
        if (nowPageParam==null){
            nowPage = 1;
        }
        if (rowNum==null){
            rowNum = 5;
        }
        Integer total=roleService.getAllNum(rno,rname,description);
        Integer sumPage = total/rowNum;
        if(total%rowNum!=0){
            sumPage++;
        }
        List<Role> roleList = roleService.roleList(nowPage,rowNum,rno,rname,description);
        ModelAndView mv  = new ModelAndView();
        mv.setViewName("roleList.jsp");
        mv.addAttribute("nowPage",nowPage);
        mv.addAttribute("rowNum",rowNum);
        mv.addAttribute("rno",rno);
        mv.addAttribute("rname",rname);
        mv.addAttribute("description",description);
        mv.addAttribute("roleList",roleList);
        mv.addAttribute("sumPage",sumPage);
        return mv;
    }
}
