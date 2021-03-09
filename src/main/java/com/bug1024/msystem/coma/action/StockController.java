package com.bug1024.msystem.coma.action;


import com.alibaba.fastjson.JSONObject;
import com.bug1024.msystem.coma.domain.Role;
import com.bug1024.msystem.coma.service.StockService;
import com.bug1024.msystem.coma.service.impl.ImpStockService;
import com.bug1024.msystem.entity.Stock;
import com.bug1024.msystem.utils.mymvc.Param;
import com.bug1024.msystem.utils.mymvc.RequestMapping;
import com.bug1024.msystem.utils.mymvc.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class StockController {
    private StockService stockService = new ImpStockService();


    @RequestMapping("stockAdd.do")
    @ResponseBody
    public String stockAdd(@Param("gno")String gno, @Param("bno")String bno,@Param("stockNum")Integer stockNum,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");

        Stock stock = stockService.selectOne(gno,bno);
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        if (stock!=null){
            jsonObject.put("code",500);
            jsonObject.put("msg","用户编号已存在");
        }else {
            stock = new Stock(gno,bno,stockNum);
            stockService.stockAdd(stock);
            jsonObject.put("code",200);
            jsonObject.put("msg","请求成功");
        }

        return jsonObject.toJSONString();
    }


    @RequestMapping("stockChange.do")
    @ResponseBody
    public String stockChange(@Param("gno")String gno, @Param("bno")String bno,@Param("stockNum")Integer stockNum,HttpServletResponse response) throws Exception {
        response.setContentType("utf-8");
        stockService.stockUpdate(new Stock(gno,bno,stockNum));
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("deleteStock.do")
    @ResponseBody
    public String deleteStock(@Param("gno") String gno,@Param("bno") String bno, HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        stockService.stockDelete(gno,bno);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }

    @RequestMapping("stockList.do")
    @ResponseBody
    public String stockList(@Param("page") Integer page, @Param("limit") Integer limit,HttpServletResponse response){
        response.setContentType("application/json;charset=utf-8");
        Integer nowPage = page;
        if (page==null){
            nowPage = 1;
        }
        if (limit==null){
            limit = 5;
        }
        Integer total=stockService.getAllNum();
        List<Role> roleList = stockService.stockList(nowPage,limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("count",total);
        jsonObject.put("data",roleList);
        jsonObject.put("code",200);
        jsonObject.put("msg","请求成功");
        return jsonObject.toJSONString();
    }


}
