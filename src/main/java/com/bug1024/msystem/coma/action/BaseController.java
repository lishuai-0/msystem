package com.bug1024.msystem.coma.action;


import com.alibaba.fastjson.JSONObject;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.BaseService;
import com.bug1024.msystem.coma.service.impl.ImpBaseService;
import com.bug1024.msystem.entity.Base;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class BaseController {
    private BaseService baseService = new ImpBaseService();


    @RequestMapping("baseAdd.do")
    @ResponseBody
    public String baseAdd(@Param("bno")String bno, @Param("bname")String bname,@Param("adress")String adress,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");

        Base base = baseService.selectOne(bno);
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        if (base!=null){
            jsonObject.put("code",500);
        }else {
            base = new Base(bno,bname,adress);
            baseService.baseAdd(base);
            jsonObject.put("code",200);
        }
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }



    @RequestMapping("baseChange.do")
    @ResponseBody
    public String baseChange(@Param("bno")String bno, @Param("bname")String bname,@Param("adress")String adress,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");
        baseService.baseUpdate(new Base(bno,bname,adress));
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("deleteBase.do")
    @ResponseBody
    public String deleteBase(@Param("bno") String bno, HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        System.out.println(bno);
        baseService.baseDelete(bno);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("baseList.do")
    @ResponseBody
    public String baseList(@Param("page") Integer page, @Param("limit") Integer limit,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        Integer nowPage = page;
        if (page==null){
            nowPage = 1;
        }
        if (limit==null){
            limit = 5;
        }
        Integer total=baseService.getAllNum();
        List<Role> roleList = baseService.baseList(nowPage,limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("count",total);
        jsonObject.put("data",roleList);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


}
