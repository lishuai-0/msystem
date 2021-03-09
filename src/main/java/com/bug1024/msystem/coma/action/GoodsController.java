package com.bug1024.msystem.coma.action;


import com.alibaba.fastjson.JSONObject;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.GoodsService;
import com.bug1024.msystem.coma.service.impl.ImpGoodsService;
import com.bug1024.msystem.entity.Goods;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class GoodsController {
    private GoodsService goodsService = new ImpGoodsService();


    @RequestMapping("goodsAdd.do")
    @ResponseBody
    public String goodsAdd(@Param("bno")String bno, @Param("bname")String bname,@Param("adress")String adress,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");

        Goods goods = goodsService.selectOne(bno);
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        if (goods!=null){
            jsonObject.put("code",500);
        }else {
            goods = new Goods(bno,bname,adress);
            goodsService.goodsAdd(goods);
            jsonObject.put("code",200);
        }
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }



    @RequestMapping("goodsChange.do")
    @ResponseBody
    public String goodsChange(@Param("bno")String bno, @Param("bname")String bname,@Param("adress")String adress,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");
        goodsService.goodsUpdate(new Goods(bno,bname,adress));
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("deleteGoods.do")
    @ResponseBody
    public String deleteGoods(@Param("bno") String bno, HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        System.out.println(bno);
        goodsService.goodsDelete(bno);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("goodsList.do")
    @ResponseBody
    public String goodsList(@Param("page") Integer page, @Param("limit") Integer limit,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        Integer nowPage = page;
        if (page==null){
            nowPage = 1;
        }
        if (limit==null){
            limit = 5;
        }
        Integer total=goodsService.getAllNum();
        List<Role> roleList = goodsService.goodsList(nowPage,limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("count",total);
        jsonObject.put("data",roleList);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


}
