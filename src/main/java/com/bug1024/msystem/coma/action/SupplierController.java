package com.bug1024.msystem.coma.action;


import com.alibaba.fastjson.JSONObject;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.SupplierService;
import com.bug1024.msystem.coma.service.impl.ImpSupplierService;
import com.bug1024.msystem.entity.Supplier;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SupplierController {
    private SupplierService supplierService = new ImpSupplierService();


    @RequestMapping("supplierAdd.do")
    @ResponseBody
    public String supplierAdd(@Param("sno")String sno, @Param("sname")String sname,@Param("adress")String adress,@Param("phone") String phone, HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");

        Supplier supplier = supplierService.selectOne(sno);
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        if (supplier!=null){
            jsonObject.put("code",500);
        }else {
            supplier = new Supplier(sno,sname,adress,phone);
            supplierService.supplierAdd(supplier);
            jsonObject.put("code",200);
        }
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


    @RequestMapping("supplierChange.do")
    @ResponseBody
    public String supplierChange(@Param("sno")String sno, @Param("sname")String sname,@Param("adress")String adress,@Param("phone") String phone ,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");
        supplierService.supplierUpdate(new Supplier(sno,sname,adress,phone));
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("deleteSupplier.do")
    @ResponseBody
    public String deleteSupplier(@Param("sno") String sno, HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        System.out.println(sno);
        supplierService.supplierDelete(sno);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("supplierList.do")
    @ResponseBody
    public String supplierList(@Param("page") Integer page, @Param("limit") Integer limit,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        Integer nowPage = page;
        if (page==null){
            nowPage = 1;
        }
        if (limit==null){
            limit = 5;
        }
        Integer total=supplierService.getAllNum();
        List<Role> roleList = supplierService.supplierList(nowPage,limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("count",total);
        jsonObject.put("data",roleList);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


}
